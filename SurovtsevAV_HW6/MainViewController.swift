//
//  MainViewController.swift
//  SurovtsevAV_HW6
//
//  Created by Артем on 08/08/2019.
//  Copyright © 2019 Артем. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var secondNameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    
    //    @IBOutlet var emailLabel: UILabel!
    //    @IBOutlet var phoneLabel: UILabel!
    
    var nameOfPersone: String!
    var secondNameOfPersone: String!
    var emailOfPersone: String!
    var phoneOfPersone: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: nameOfPersone)
        nameLabel.text = nameOfPersone
        secondNameLabel.text = secondNameOfPersone
        emailLabel.text = emailOfPersone
        phoneNumberLabel.text = phoneOfPersone
        imageView.layer.cornerRadius = imageView.frame.height / 2
    }
    
}
