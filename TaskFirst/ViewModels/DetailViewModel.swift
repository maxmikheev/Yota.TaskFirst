//
//  DetailViewModel.swift
//  TaskFirst
//
//  Created by Максим Михеев on 20.04.2022.
//

import Foundation
import UIKit

class DetailViewModel: DetailViewModelType {
    
    private var members: Member!
    
    var description: String {
        return String(describing: "\(members.detailDescription)")
    }
    
    var phone: String {
        return String(describing: "Phone: \(members.phone)")
    }
    
    var image: UIImage {
        UIImage(data: members.imageData!)!
    }
    
    var name: String {
        String(members.name!)
    }
    
    var surname: String {
        String(members.surname!)
    }
    
    init(members: Member) {
        self.members = members
    }
}
