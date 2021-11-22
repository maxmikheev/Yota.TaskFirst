//
//  TableViewController.swift
//  TaskFirst
//
//  Created by Максим Михеев on 17.11.2021.
//

import UIKit

class TeamMembersViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let teamComrads = Team.teamMembers()

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamComrads.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id", for: indexPath)
        
        let team = teamComrads[indexPath.row]
        
        var memberData = cell.defaultContentConfiguration()
        
        memberData.text = team.comrad
        memberData.secondaryText = team.work
        
        cell.contentConfiguration = memberData
        
        return cell
    }
}
