//
//  MembersData.swift
//  TaskFirst
//
//  Created by Максим Михеев on 17.11.2021.
//

import Foundation

struct MemberOfTeam {
    
    var name: String
    var surname: String
    var detailDescription: String
    var phone: String
    var spec: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}

extension MemberOfTeam {
    
    static func getMemberData() -> [MemberOfTeam] {
        
        var members: [MemberOfTeam] = []
        
        let names = DataManager.shared.names
        let surnames = DataManager.shared.surnames
        let detailDescriptions = DataManager.shared.detailDescription
        let phones = DataManager.shared.phones
        let specs = DataManager.shared.spec
        
        let countOfIteration = min(names.count, surnames.count, detailDescriptions.count, phones.count, specs.count) - 1
        
        for i in 0...countOfIteration {
            let member = MemberOfTeam(
                name: names[i],
                surname: surnames[i],
                detailDescription: detailDescriptions[i],
                phone: phones[i],
                spec: specs[i]
            )
            members.append(member)
        }
        print(members)
        return members
    }
}


/*
struct Teammates {
    let comrad: String
    let work: String
}

extension Teammates {
    static func teamMembers() -> [Teammates] {
        [
            Teammates(comrad: "Максим Линьков", work: "ios"),
            Teammates(comrad: "Максим Новиков", work: "android"),
            Teammates(comrad: "Максим Михеев", work: "qa")
        ]
    }
}
/*
class DetailDescriptions {
    let birthday: String
}

init
*/

let birhday = "01.01.1970"
let date = ["01.01.2000","01.01.3000","01.01.4000"]
*/
