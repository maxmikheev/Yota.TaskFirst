//
//  DataManager.swift
//  TaskFirst
//
//  Created by Максим Михеев on 16.02.2022.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    let names = [
        "Maksim", "Nikolay", "Platon", "Dmitriy",
        "Max", "Alexander"
    ]
    
    let surnames = [
        "Linkov", "Dolgopolov", "Shapkin", "Uspenskiy",
        "Mikheev", "Osipets"
    ]
    
    let detailDescription = [
        "Date of birth: 01.01.1970. Lead IOS team",
        "Date of birth: 01.01.1960. IOS ded",
        "Date of birth: 01.01.1975. Lead Android team",
        "Date of birth: 01.01.1980. Lead voice lane in Android team",
        "Date of birth: 01.01.1996. AQA in IOS team",
        "Date of birth: 01.01.1950. Lead QA team"
    ]
    
    let phones = [
        "7999-999-99-01", "7999-999-99-02", "7999-999-99-03", "7999-999-99-04",
        "7999-999-99-05", "7999-999-99-06"
    ]
    
    let spec = [
        "ios","ios","android","android","qa","qa"
    ]
    
    private init() {}
}
