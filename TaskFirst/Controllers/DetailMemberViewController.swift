//
//  DetailMemberViewController.swift
//  TaskFirst
//
//  Created by Максим Михеев on 29.11.2021.
//
 
import UIKit

class DetailMemberViewController: UIViewController {
    
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var detailDescription: UILabel!
        
    var members: MemberOfTeam?
    //let members = MemberOfTeam.getMemberData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .cyan
        
        phone.text = "Phone: \(members?.phone)"
        detailDescription.text = "Description: \(members?.detailDescription)"
    }
}

/*
title = members.fullName
print(title)

let phone = UILabel(frame: CGRect(x: 10, y: 10, width: 200, height: 30))
phone.center = CGPoint(x: 300, y: 50)
phone.textAlignment = .left
phone.text = member?.phone

let detailDescription = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 30))
detailDescription.center = CGPoint(x: 200, y: 200)
detailDescription.textAlignment = .center
detailDescription.text = member?.detailDescription
 */
