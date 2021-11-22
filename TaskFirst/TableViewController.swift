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
        
        var memberData = cell.defaultContentConfiguration()
        cell.contentConfiguration = memberData
        
        let teamMembers = Array(membersTeam.keys)
        let specTeam = Array(membersTeam.values)
        
        memberData.text = teamMembers[indexPath.row]
        memberData.secondaryText = specTeam[indexPath.row]
        
        cell.contentConfiguration = memberData
        
        return cell
    }
}
