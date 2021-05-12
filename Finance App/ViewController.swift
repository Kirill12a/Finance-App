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
        cell.textLabel?.font = UIFont(name: "Helvetica", size: 30)
        cell.textLabel?.text = fas[indexPath.row]
        return cell
    }
     //MARK: Добавить новую категорию которая на стартовом экране
    @IBAction func AddNewCategory(_ sender: Any) {
        ScreenAddNewCAtagory.isHidden = false
        AddNewCategoryOutlet.isHidden = true
        ScreenAddNewCAtagory.backgroundColor = .white
        filterView.isHidden = false
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
     //MARK: Кнопка чистки поля когда нажимаю добавить категорию
    @IBAction func clearButton(_ sender: Any) {
        TfTwoScreen.text = ""
    }
    func editButtonAddCategory(){
        AddNewCategoryOutlet.layer.cornerRadius = 24
    }
     //MARK: Заполение массива
    func filing(){
        let tx = TfTwoScreen.text
        if ((tx?.isEmpty) != nil){
            fas.append(tx!)
            TBMain.reloadData()
        }
//        fas.append(tx!)
//        TBMain.reloadData()
        
    }

 //MARK: Размер ячейки
    var selectedIndex = -1
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedIndex {
            return 354
        }else {
            return 115
        }
    }
     //MARK: Нажатие по ячейки
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        TBMain.deselectRow(at: indexPath, animated: true)
        print(fas[indexPath.row])
    }
     //MARK: Удаление ячейки
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            fas.remove(at: indexPath.row)
            TBMain.deleteRows(at: [indexPath], with: .fade)
            self.TBMain.reloadData()
        }else if editingStyle == .insert{
            self.TBMain.reloadData()
        }
    }
 
}

