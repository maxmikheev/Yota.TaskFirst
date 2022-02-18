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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Identifications.cellIdentificator.rawValue)
        
        let viewTitle = self.navigationItem
        viewTitle.title = "Members list"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifications.cellIdentificator.rawValue, for: indexPath)
        
        let team = members[indexPath.row]
        
        var memberData = cell.defaultContentConfiguration()
        
        memberData.text = team.fullName
        memberData.secondaryText = team.spec
        
        cell.contentConfiguration = memberData
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DetailMemberStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: Identifications.detailMemberStoryboard.rawValue)
        navigationController?.pushViewController(vc, animated: true)
    }
}
