//
//  DetailViewModelType.swift
//  TaskFirst
//
//  Created by Максим Михеев on 20.04.2022.
//

import Foundation
import UIKit

protocol DetailViewModelType {
    var description: String { get }
    var phone: String { get }
    var image: UIImage { get }
}
