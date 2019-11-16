//
//  CustomerListViewController.swift
//  C0769647_MidTerm_MAD3115F2019
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 Karan. All rights reserved.
//

import UIKit

class CustomerListViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    
    
    
    
    
    @IBOutlet weak var customerList: UITableView!
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Employee List !"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temp.returnCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let a = temp.returnEmployeeObj(empID: Int(indexPath.row+1))
        let cells = tableView.dequeueReusableCell(withIdentifier: "CustCell", for: indexPath)
        cells.textLabel?.text = (a?.name)!
        return cells
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowselect=UIStoryboard(name: "Main", bundle: nil)
        let detailsVC=rowselect.instantiateViewController(withIdentifier: "detialsOfCustomerVC") as! ShowCustomerDetailsViewController
        detailsVC.employeeDetails=temp.returnEmployeeObj(empID: indexPath.row+1)!
        detailsVC.employeeInternDetails=temp.returnEmployeeObj(empID: indexPath.row+1) as? Intern
        detailsVC.employeeFullTimeDetails=temp.returnEmployeeObj(empID: indexPath.row+1) as? FullTime
        detailsVC.employeeCommissionDetails=temp.returnEmployeeObj(empID: indexPath.row+1) as? CommissionBasedPartTime
        navigationController?.pushViewController(detailsVC, animated: true)
        
        
      
    }
    
    
    
   /* private func addLogoutButton()
   // {
        let LogoutBtn=UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(CustomerListViewController.logout(sender:)))
        
        navigationItem.leftBarButtonItem=LogoutBtn
    }
    
    
    @objc func logout(sender: UIBarButtonItem)
    {
        navigationController?.popViewController(animated: true)
    }*/
    
    
    
    
    var temp = Singleton.getInstance()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        customerList.delegate=self
        customerList.dataSource=self
        
      
        
        
        
    }
   
    override func viewWillAppear(_ animated: Bool) {
        customerList.reloadData()
    }
      

}
