//
//  MenuViewController.swift
//  Group1_F2019_MAD115_FP
//
//  Created by Ankita Jain on 2019-11-15.
//  Copyright © 2019 Ankita Jain. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBAction func btnLogout(_ sender: UIButton) {
         navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton=true

       
    }
    

    

}
