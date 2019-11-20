//
//  AllListsTableViewController.swift
//  Checklist
//
//  Created by 김은비 on 20/11/2019.
//  Copyright © 2019 eunbiiKim. All rights reserved.
//

import UIKit

class AllListsTableViewController: UITableViewController {
    
    let cellIdentifier = "ChecklistCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel!.text = "List: \(indexPath.row)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowChecklist", sender: nil)
    }
}
