//
//  CheckListViewController.swift
//  Checklist
//
//  Created by Alec Meyer on 11/10/21.
//

import UIKit

class CheckListViewController: UITableViewController {
    
    var checkListItems = (1...100).map {
        CheckListItem(isChecked: false, title: "Row: \($0)")
    }

    let prototypeCell: UITableViewCell = {
        let tableViewCell = UITableViewCell(style: .default, reuseIdentifier: "CheckListItem")
        
        return tableViewCell
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CheckListItem")
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Selectors
    @objc func addButtonPressed() {
        // IMPORTANT - This is the row that needs to be inserted next.
        let newRowIndex = checkListItems.count

        checkListItems.append(CheckListItem(isChecked: false, title: "Row: \(newRowIndex + 1)"))
        tableView.insertRows(at: [IndexPath(row: newRowIndex, section: 0)], with: .automatic)
    }
    
    // MARK: - Helpers
    
    func configureNavigation () {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Checklist"
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkListItems.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItem")!
        cell.textLabel?.text = checkListItems[indexPath.row].title
        cell.accessoryType = checkListItems[indexPath.row].isChecked ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath) != nil {
            checkListItems[indexPath.row].isChecked.toggle()
            tableView.reloadData()
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        checkListItems.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }

}

