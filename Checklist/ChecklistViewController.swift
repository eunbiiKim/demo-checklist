//
//  ChecklistViewController.swift
//  Checklist
//
//  Created by 김은비 on 19/11/2019.
//  Copyright © 2019 eunbiiKim. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, AddItemViewControllerDelegate {
    var checklist: Checklist!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        title = checklist.name
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return checklist.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let item = checklist.items[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        
        return cell
    }
    
    //MARK: - Table view Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = checklist.items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //1. Remove the item from the data model.
        checklist.items.remove(at: indexPath.row)
        //2. Delete the corresponding row from the table view.
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    //MARK: - Configure Checkmark and text
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        let label = cell.viewWithTag(1001) as! UILabel
        
        if item.checked {
            label.text = "√"
        } else {
            label.text = ""
        }
    }
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        //label.text = item.text
        label.text = "\(item.itemID): \(item.text)"
    }
    
//    @IBAction func addItem() {
//        let newRowIndex = items.count
//
//        let item = ChecklistItem()
//        item.text = "I am a new row"
//        item.checked = true
//
//
//        let indexPath = IndexPath(row: newRowIndex, section: 0)
//        let indexPaths = [indexPath]
//        tableView.insertRows(at: indexPaths, with: .automatic)
//    }
    
    //MARK: - Item Detail ViewController Delegates
    
    func ItemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
        navigationController?.popViewController(animated: true)
    }

    func ItemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem) {
        let newRowIndex = checklist.items.count
        checklist.items.append(item)

        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)

        navigationController?.popViewController(animated: true)
    }
    
    func ItemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem) {
        if let index = checklist.items.firstIndex(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) {
                configureText(for: cell, with: item)
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //1.
        if segue.identifier == "AddItem" {
            //2.
            let controller = segue.destination as! ItemDetailViewController
            //3.
            controller.delegate = self as AddItemViewControllerDelegate
        } else if segue.identifier == "EditItem" {
            // sending data between view controllers
            let controller = segue.destination as! ItemDetailViewController
            controller.delegate = self
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                controller.itemToEdit = checklist.items[indexPath.row]
            }
        }
    }
}
