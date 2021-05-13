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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bt = UserButtonCjange()
        bt.ChangeSizeButton(button: firstAddNewIncomeOutlet)
        
    }
    


    // MARK: - Navigation

     //MARK: Action
    // первая кнопка
    @IBAction func firstAddNewIncomeAction(_ sender: Any) {
     
        
    }
    
}

extension AddNewMoneyViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 34
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewBalance.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        return cell
    }
    
    
}
