//
//  UserController.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 04/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class UserController: UIViewController
{
    @IBOutlet weak var usernameTxtLabel: UILabel!
    @IBOutlet weak var settingsList: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.usernameTxtLabel.text = UserMock.instance.username
    }
}

//extension UserController: UITableViewDelegate, UITableViewDataSource
//{
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = settingsList.dequeueReusableCell(withIdentifier: "billCell") as? SettingsCell
//            else { return UITableViewCell() }
//        cell.configureCell(client: "Mr Test", total: 12.5)
//        return cell
//    }
//}

