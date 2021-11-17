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
        return teamMembers.count
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
        
        var memberData = cell.defaultContentConfiguration()
        
        memberData.text = teamMembers[indexPath.row]
        memberData.secondaryText = specialization[indexPath.row]
        cell.contentConfiguration = memberData
        
        return cell
    }
}
