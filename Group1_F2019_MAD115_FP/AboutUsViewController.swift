//
//  AboutUsViewController.swift
//  Group1_F2019_MAD115_FP
//
//  Created by Ankita Jain on 2019-11-16.
//  Copyright © 2019 Ankita Jain. All rights reserved.
//

import UIKit

import WebKit

class AboutUsViewController: UIViewController, WKNavigationDelegate{

    @IBOutlet weak var aboutWK: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutWK.navigationDelegate = self
        aboutWK.allowsBackForwardNavigationGestures = true
           // self.loadFromURL()
           self.loadFromFile()

        }
        func loadFromURL(){
                    let url = URL(string: "https://www.lambtoncollege.ca/About_Us/Our_College/President/A_Message_from_President_Judith_Morris/")
                   let urlReq = URLRequest(url: url!)
                   aboutWK.load(urlReq)
        }
    func loadFromFile()
    {
        let localfilePath = Bundle.main.url(forResource: "aboutUs", withExtension: "html")
        let myRequest = URLRequest(url: localfilePath!)
        aboutWK.load(myRequest)
       
        
    }
//    @IBAction func WkButton(_ sender: UIBarButtonItem) {
//
//        switch sender.tag {
//            case 0:
//                if aboutWK.canGoForward{
//                    aboutWK.goForward()
//                }
//            case 1:
//                    aboutWK.goBack()
//            case 2:
//                aboutWK.reload()
//            default:
//                print("Nothing to do")
//            }
//        }
        
    }

