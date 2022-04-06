//
//  DetailMemberViewController.swift
//  TaskFirst
//
//  Created by Максим Михеев on 29.11.2021.
//
 
import UIKit

class DetailMemberViewController: UIViewController {
        
    var members: MemberOfTeam!
    
    private lazy var memberPhoto: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: members.fullName)
        return photo
    }()
    
    private lazy var detailDescription: UILabel = {
        let description = UILabel()
        description.text = members.detailDescription
        description.numberOfLines = 2
        return description
    }()
    
    private lazy var phone: UILabel = {
        let phoneMember = UILabel()
        phoneMember.text = members.phone
        return phoneMember
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = members.fullName
        
        setupViews([memberPhoto, detailDescription, phone])
        setConstraints()
    }
    
    private func setupViews(_ views: [UIView]) {
        views.forEach { view.addSubview($0) }
    }
    
    private func setConstraints() {
        memberPhoto.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            memberPhoto.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            memberPhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            memberPhoto.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            memberPhoto.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 400)
        ])
        
        detailDescription.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            detailDescription.topAnchor.constraint(equalTo: memberPhoto.bottomAnchor, constant: 30),
            detailDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            detailDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        phone.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            phone.topAnchor.constraint(equalTo: detailDescription.bottomAnchor, constant: 20),
            phone.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            phone.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}
