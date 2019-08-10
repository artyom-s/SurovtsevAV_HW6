//
//  PeopleRandomizerViewController.swift
//  SurovtsevAV_HW6
//
//  Created by Артем on 08/08/2019.
//  Copyright © 2019 Артем. All rights reserved.
//

import UIKit

class PeopleRandomizerViewController: UITableViewController {
    
    let names = [
        "Danny",
        "Tanner",
        "Camila",
        "Clementine",
        "Ginny",
        "Desmond",
        "Geraldo",
        "Inell",
        "Georgine",
        "Natividad",
        "Kimiko",
        "Judith",
        "Ivonne",
        "Brigid",
        "Gina",
        "Wynona",
        "Deneen",
        "Kelley",
        "Terry",
        "Kenny"
    ]
    
    let secondNames = [
        "Kolesar",
        "Tso",
        "Wendling",
        "Stlawrence",
        "Osullivan",
        "Riviera",
        "Brice",
        "Stickler",
        "Maddix",
        "Bomar",
        "Farren",
        "Josey",
        "Zamzow",
        "Erne",
        "Quick",
        "Clower",
        "Engels",
        "Ammon",
        "Schiller",
        "Metheny"
    ]
    
    var randomPersones: [Persone] = []
    
    struct Persone {
        var name: String
        var secondName: String
        var email: String
        var phoneNumber: String
        
        init(name: String, secondName: String, email: String, phoneNumber: String)
        {
            self.name = name
            self.secondName = secondName
            self.email = email
            self.phoneNumber = phoneNumber
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl?.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        
        navigationItem.title = "Random Persones"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    // Fill table view cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RandomPersone", for: indexPath)
        
        makeRandomePersones ()
        cell.textLabel?.text = randomPersones[indexPath.row].name + " " + randomPersones[indexPath.row].secondName
        cell.textLabel?.numberOfLines = 0
        cell.imageView?.image = UIImage(named: randomPersones[indexPath.row].name)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // Send data to second VC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let detailVC = segue.destination as! MainViewController
            detailVC.nameOfPersone = randomPersones[indexPath.row].name
            detailVC.secondNameOfPersone = randomPersones[indexPath.row].secondName
            detailVC.emailOfPersone = randomPersones[indexPath.row].email
            detailVC.phoneOfPersone = randomPersones[indexPath.row].phoneNumber
        }
    }
    
    // Pull to refresh - ranndomize persones
    @objc func refresh(sender:AnyObject)
    {
        randomPersones = []
        makeRandomePersones ()
        self.refreshControl?.endRefreshing()
        tableView.reloadData()
        
    }
    
    // Making random persones
    func makeRandomePersones () {
        var namesRandom = names
        var secondNamesRandom = secondNames
        while !namesRandom.isEmpty {
            randomPersones.append (Persone(name: namesRandom.randomElement()!, secondName: secondNamesRandom.randomElement()!, email: "", phoneNumber: ""))
            if let index = namesRandom.firstIndex(of: randomPersones.last!.name) {
                namesRandom.remove(at: index)
            }
            if let index = secondNamesRandom.firstIndex(of: randomPersones.last!.secondName) {
                secondNamesRandom.remove(at: index)
            }
            let num = randomPersones.count - 1
            randomPersones[num].email = randomPersones.last!.name.lowercased() + "." + randomPersones.last!.secondName.lowercased() + "@gmail.com"
            randomPersones[num].phoneNumber = String(Int.random(in: 100...999)) + "-" + String(Int.random(in: 10...99)) + "-" + String(Int.random(in: 10...99))
        }
        
    }
}
