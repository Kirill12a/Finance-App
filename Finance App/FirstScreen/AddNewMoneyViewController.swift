//
//  AddNewMoneyViewController.swift
//  Finance App
//
//  Created by Kirill Drozdov on 12.05.2021.
//

import UIKit


class AddNewMoneyViewController: UIViewController {
    
    
    var arrayNumbers:[String]=[]
    
    //MARK: Оутлет
    @IBOutlet weak var balanseLabel: UILabel!
    @IBOutlet weak var revenueLabel: UILabel!
    @IBOutlet weak var userBalanceImportant: UILabel!
    @IBOutlet weak var tableViewBalance: UITableView!
    @IBOutlet weak var firstAddNewIncomeOutlet: UIButton!
    
     //MARK: Второй вью
    @IBOutlet weak var TwoViewScreen: UIView!
    
    @IBOutlet weak var addMoneyTwoView: UIButton!
    
    @IBOutlet weak var TEFIETwoScreen: UITextField!
    @IBOutlet weak var clearArray: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let bt = UserButtonCjange()
        bt.ChangeSizeButton(button: firstAddNewIncomeOutlet, twoButton: addMoneyTwoView)
        TwoViewScreen.isHidden = true
        
    }
    
    // MARK: - Navigation

     //MARK: Action
    // первая кнопка
    @IBAction func firstAddNewIncomeAction(_ sender: Any) {
        TwoViewScreen.isHidden = false
        firstAddNewIncomeOutlet.isHidden = true
        TEFIETwoScreen.text = ""

        
    }
    
    @IBAction func secondAddNewIncomeAction(_ sender: Any) {
        TwoViewScreen.isHidden = true
        firstAddNewIncomeOutlet.isHidden = false
        view.endEditing(true)
        filing()
    }
    
    @IBAction func clearArrayAction(_ sender: Any) {
        TEFIETwoScreen.text = ""
    }
    
    func filing(){
        let tx = TEFIETwoScreen.text
        if ((tx?.isEmpty) != nil){
            var writeTX = TEFIETwoScreen.text
            arrayNumbers.append(writeTX!)
            let intArray = arrayNumbers.compactMap { Double($0) }
            let sum = intArray.reduce(0, +)
            userBalanceImportant.text = "\(sum) P"
            tableViewBalance.reloadData()
        }
    }
}

extension AddNewMoneyViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNumbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = tableViewBalance.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        cell2.textLabel?.text = arrayNumbers[indexPath.row]
        return cell2
    }
   
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var selectedIndex2 = -1
        if indexPath.row == selectedIndex2 {
            return 354
        }else {
            return 115
        }
   
}
 //MARK: Удаление с Table
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            arrayNumbers.remove(at: indexPath.row)
            let intArray = arrayNumbers.compactMap { Double($0) }
            let sum = intArray.reduce(0, -)
            userBalanceImportant.text = "\(sum) P"
            tableViewBalance.deleteRows(at: [indexPath], with: .fade)
            self.tableViewBalance.reloadData()
        }else if editingStyle == .insert{
            self.tableViewBalance.reloadData()
        }
    }
}


