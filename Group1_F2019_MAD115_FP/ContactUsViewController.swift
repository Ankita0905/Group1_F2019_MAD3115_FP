//
//  ContactUsViewController.swift
//  Group1_F2019_MAD115_FP
//
//  Created by Ankita Jain on 2019-11-16.
//  Copyright © 2019 Ankita Jain. All rights reserved.
//

import UIKit
import MessageUI

class ContactUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnContactUs(_ sender: UIButton)
    {
        
        let alert = UIAlertController(title: "Contact Us",
                                      message: "If you need help you can email us at \n help@Group1MADT.com \n +16477788990",
            preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Cancel",
                                     style: .cancel, handler: nil)
        alert.addAction(okAction)
        let callAction = UIAlertAction(title: "Call Us",
                                           style: .default, handler: {
                                            _ in
                                            self.makeCall()
            })
            alert.addAction(callAction)
            let smsAction = UIAlertAction(title: "Message Us",
                                          style: .default, handler: {
                                            _ in
                                            self.sendSMS()
            })
            alert.addAction(smsAction)
            self.present(alert, animated: true, completion: nil)
        }
                
                private func makeCall()
                {
                    if let url = URL(string: "tel://+16477788990)"), UIApplication.shared.canOpenURL(url){
                        if #available(iOS 10, *)
                        {
                            UIApplication.shared.open(url)
                        }
                        else
                        {
                            UIApplication.shared.openURL(url)
                        }
                    }
                }
    
    private func sendSMS()
    {
        if MFMessageComposeViewController.canSendText()
        {
            let smsVC = MFMessageComposeViewController()
            smsVC.body = "Hello, How can I help You?"
            smsVC.recipients = ["+16477788990"]
            smsVC.messageComposeDelegate = self as? MFMessageComposeViewControllerDelegate
            self.present(smsVC, animated: false, completion: nil)
        }
        else
        {
            print("NO SIM available")
        }
    }
            }
