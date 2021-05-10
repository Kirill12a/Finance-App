//
//  ViewController.swift
//  Finance App
//
//  Created by Kirill Drozdov on 09.05.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var fas = ["fa","fa","fsa"]

    @IBOutlet weak var TBMain: UITableView!
    @IBOutlet weak var AddNewCategoryOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        TBMain.delegate = self
        TBMain.dataSource = self
        editButtonAddCategory()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return fas.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = TBMain.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = fas[indexPath.row]
            return cell
        }

    @IBAction func AddNewCategory(_ sender: Any) {
    }
    func editButtonAddCategory(){
        AddNewCategoryOutlet.layer.cornerRadius = 20
    }
}

