//
//  TableViewController.swift
//  TaskFirst
//
//  Created by Максим Михеев on 17.11.2021.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return teamMembers.count
        return membersTeam.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id", for: indexPath)
        /*
        var cellData = cell.defaultContentConfiguration()
        cell.textLabel?.text = teamMembers[indexPath.row]
        cellData.text = teamMembers[indexPath.row]
        cellData.secondaryText = specialization[indexPath.row]
        
        let members = teamMembers[indexPath.row]
        let spec = specialization[indexPath.row]
        var cellData = cell.defaultContentConfiguration()
        
        cellData.text = teamMembers
        cellData.secondaryText = specialization
        
        let member = teamMembers[indexPath.row]
        let spec = specialization[indexPath.row]
         */
        
        //var memberData = cell.defaultContentConfiguration()
        //memberData.text = teamMembers[indexPath.row]
        //memberData.secondaryText = specialization[indexPath.row]
        //memberData.text = secondTeamMembers[indexPath.row]
        /*
        for (member, spec) in secondTeamMembers {
            var teamMember = member
            var specialisation = spec
        }
        */
        
        var memberData = cell.defaultContentConfiguration()
        cell.contentConfiguration = memberData
        
        var member: [String] = []
        var spec: [String] = []
        
        for (key, value) in membersTeam {
            member.append(key)
            spec.append(value)
        }
        
        let members = member[indexPath.row]
        let specialization = spec[indexPath.row]
        
        memberData.text = members
        memberData.secondaryText = specialization
        
        cell.contentConfiguration = memberData
        
        return cell
    }
}
