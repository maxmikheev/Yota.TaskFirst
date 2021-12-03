//
//  DetailMemberViewController.swift
//  TaskFirst
//
//  Created by Максим Михеев on 29.11.2021.
//

import UIKit

class DetailMemberViewController: UIViewController {
    
    let text = birhday
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        let text = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 30))
        text.center = CGPoint(x: 200, y: 200)
        text.textAlignment = .center
        text.text = birhday

        self.view.addSubview(text)
    }
}
