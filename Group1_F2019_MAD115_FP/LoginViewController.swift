//
//  ViewController.swift
//  C0769647_MidTerm_MAD3115F2019
//
//  Created by MacStudent on 2019-11-01.
//  Copyright © 2019 Karan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var rememberSwitchBtn: UISwitch!
    @IBAction func loginBtn(_ sender: UIButton) {
        
        if readInfoPlist()
        {
            if self.rememberSwitchBtn.isOn{
                self.userDefault.set(usernameTxtField.text, forKey: "userName")
                self.userDefault.set(passwordTxtField.text, forKey: "userPassword")
            }else{
                self.userDefault.removeObject(forKey: "userName")
                self.userDefault.removeObject(forKey: "userPassword")
            }
            
            let clvc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "menuVC")
            self.navigationController?.pushViewController(clvc, animated: true)
            
        }
        
        else{
            let alert = UIAlertController(title: "Username Or Password Incorrect", message: "Try Agian !", preferredStyle: .alert)
            
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {action
                in
                print("OK CLicked")
            }))
            self.present(alert, animated: true)
            print("invalid username or password")
        }
        
        
        
        
        
        
    }
    
    @IBOutlet weak var passwordTxtField: UITextField!
    
    @IBOutlet weak var usernameTxtField: UITextField!
    
    var userDefault : UserDefaults!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let getdata =  Singleton.getInstance()
        getdata.createCustomer()
        userDefault = UserDefaults.standard
        if let userName = userDefault.value(forKey: "userName"){
            usernameTxtField.text = userName as? String
        }
        
        if let userPassword = userDefault.value(forKey: "userPassword"){
            passwordTxtField.text = userPassword as? String
        }
        
    }
    
    
    
    func readInfoPlist() -> Bool{
        if let bundlePath = Bundle.main.path(forResource: "Users", ofType: "plist") {
            let dictionary = NSMutableDictionary(contentsOfFile: bundlePath)
            let usersList = dictionary!["Users"] as! NSArray
            
            for u in usersList
            {
                let user = u as! NSDictionary
                let username = user["username"]! as! String
                let pwd = user["password"]! as! String
                if username==usernameTxtField.text! && pwd==passwordTxtField.text!
                {
                    return true
                }
            }
            
            
        }
        return false    }
    
    
    
}


