//
//  TableViewController.swift
//  TaskFirst
//
//  Created by Максим Михеев on 17.11.2021.
//

import UIKit

class TeamMembersViewController: UITableViewController {

    //let text = birhday
    //var members: [MemberOfTeam] = []
    
    let members = MemberOfTeam.getMemberData()
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var filtred = [MemberOfTeam]()
    private var ascendingSort = true
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Identifications.cellIdentificator.rawValue)
        
        let viewTitle = self.navigationItem
        viewTitle.title = "Members list"
        viewTitle.backButtonTitle = "Back"
        
        // Search
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Input member's name"
        navigationItem.searchController = searchController
        definesPresentationContext = true
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
        
        var team: MemberOfTeam
        
        if isFiltering {
            team = filtred[indexPath.row]
        } else {
            team = members[indexPath.row]
        }
        
        //let team = members[indexPath.row]
        
        var memberData = cell.defaultContentConfiguration()
        
        memberData.text = team.fullName
        memberData.secondaryText = team.spec
        
        cell.contentConfiguration = memberData
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DetailMemberStoryboard", bundle: nil)
        if let detailVC = storyboard.instantiateViewController(withIdentifier: Identifications.detailMemberStoryboard.rawValue) as? DetailMemberViewController {
            
            let member: MemberOfTeam
            
            if isFiltering {
                member = filtred[indexPath.row]
            } else {
                member = members[indexPath.row]
            }
            
            detailVC.members = member
            
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

extension TeamMembersViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        filterContent(searchController.searchBar.text!)
    }
    
    private func filterContent(_ searchText: String) {
        filtred = members.filter({ (member: MemberOfTeam) -> Bool in
            return member.fullName.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
}
