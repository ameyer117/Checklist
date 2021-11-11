//
//  AddItemViewController.swift
//  Checklist
//
//  Created by Alec Meyer on 11/10/21.
//

import UIKit

class AddItemViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
    }
    
    // MARK: - Selectors
    @objc func cancelButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func doneButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helpers
    func configureNavigation() {
        navigationItem.title = "Add Item"
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed))
    }
}
