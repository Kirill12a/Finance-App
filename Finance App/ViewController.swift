//
//  ViewController.swift
//  Finance App
//
//  Created by Kirill Drozdov on 09.05.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var fas: [String]=[]
    
    @IBOutlet var ScreenMainCategory: UIView!
    @IBOutlet weak var ScreenAddNewCAtagory: UIView!
    @IBOutlet weak var TBMain: UITableView!
    @IBOutlet weak var AddNewCategoryOutlet: UIButton!
    
    @IBOutlet weak var filterView: UIView!
    
    @IBOutlet weak var TfTwoScreen: UITextField!
    @IBOutlet weak var ButtonTwoScreen: UIButton!
    @IBOutlet weak var del: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TBMain.delegate = self
        TBMain.dataSource = self
        editButtonAddCategory()
        ScreenAddNewCAtagory.isHidden = true
        TfTwoScreen.layer.borderWidth = 0
        TfTwoScreen.layer.borderColor = UIColor.white.cgColor
        ButtonTwoScreen.layer.cornerRadius = 24
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
        ScreenAddNewCAtagory.isHidden = false
        AddNewCategoryOutlet.isHidden = true
        //        ScreenMainCategory.backgroundColor = .lightGray
        
        //        TBMain.backgroundColor = .lightGray
        ScreenAddNewCAtagory.backgroundColor = .white
        
        filterView.isHidden = false
        //        filterView.backgroundColor = .lightGray
        filterView.isOpaque = false
        filterView.alpha = 0.3
        
    }
    @IBAction func ButtonTwoScreenAction(_ sender: Any) {
        filing()
        filterView.isHidden = true
        ScreenAddNewCAtagory.isHidden = true
        AddNewCategoryOutlet.isHidden = false
        ScreenMainCategory.backgroundColor = .white
        
        
        view.endEditing(true)
        
        
    }
    @IBAction func clearButton(_ sender: Any) {
        TfTwoScreen.text = ""
    }
    func editButtonAddCategory(){
        AddNewCategoryOutlet.layer.cornerRadius = 24
    }
    
    func filing(){
        let tx = TfTwoScreen.text
        fas.append(tx!)
        TBMain.reloadData()
    }
    
    
}

