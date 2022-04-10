//
//  TableViewController.swift
//  TaskFirst
//
//  Created by Максим Михеев on 17.11.2021.
//

import UIKit
import CoreData

class TeamMembersViewController: UITableViewController {
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var members = [Member]()
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var filtred = [Member]()
    private var ascendingSort = true
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    /// Получение данных из файла
    func getData() {
        
        let fetchRequest: NSFetchRequest<Member> = Member.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name != nil")
        
        var records = 0
        
        do {
            records = try context.count(for: fetchRequest)
            print("Is Data there already?")
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        guard records == 0 else { return }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        guard let pathToFile = Bundle.main.path(forResource: "DataMembers", ofType: "plist"),
              let dataArray = NSArray(contentsOfFile: pathToFile) else { return }


        for dictionary in dataArray {
            let entity = NSEntityDescription.entity(forEntityName: "Member", in: context)
            let member = NSManagedObject(entity: entity!, insertInto: context) as! Member

            let memberDictionary = dictionary as! [String: AnyObject]
            member.name = memberDictionary["name"] as? String
            member.surname = memberDictionary["surname"] as? String
            member.detailDescription = memberDictionary["detailDescription"] as? String
            member.phone = memberDictionary["phone"] as? String
            member.spec = memberDictionary["spec"] as? String

            let imageName = memberDictionary["imageName"] as? String
            let image = UIImage(named: imageName!)
            let imageData = image!.pngData()
            member.imageData = imageData
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Identifications.cellIdentificator.rawValue)
        tableView.dataSource = self
        
        fetchData()
        
        let viewTitle = self.navigationItem
        viewTitle.title = "Members list"
        viewTitle.backButtonTitle = "Back"
        
        // Search
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Input member's name"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
    private func fetchData() {
        let fetchRequest: NSFetchRequest<Member> = Member.fetchRequest()

        do {
            members = try context.fetch(fetchRequest)
        } catch let error {
            print(error)
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filtred.count
        } else {
            return members.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifications.cellIdentificator.rawValue, for: indexPath)
        
        let team: Member!
        
        if isFiltering {
            team = filtred[indexPath.row]
        } else {
            team = members[indexPath.row]
        }
        
        var memberData = cell.defaultContentConfiguration()
        
        memberData.text = "\(team.name!) \(team.surname!)"
        memberData.secondaryText = team.spec
        
        cell.contentConfiguration = memberData
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = DetailMemberViewController()
        
        var member: Member!
        
        if isFiltering {
            member = filtred[indexPath.row]
        } else {
            member = members[indexPath.row]
        }
        
        detailVC.members = member
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension TeamMembersViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContent(searchController.searchBar.text!)
    }
    
    private func filterContent(_ searchText: String) {
        filtred = members.filter({ (member: Member) -> Bool in
            return member.name!.lowercased().contains(searchText.lowercased()) || member.surname!.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
}
