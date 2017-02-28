//
//  HomeViewController.swift
//  Led
//
//  Created by Nguyen Viet Duc on 2/8/17.
//  Copyright © 2017 TMH. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func ledDidPressed(_ sender: Any) {
        Alamofire.request(Constant.Url.baseUrl + Constant.Url.tapURL).responseJSON { response in
            if let JSON = response.result.value {
                print(JSON)
            } else {
                print("Error: \(response)")
            }
        }
    }
    
//    func setupUI() {
//        // UI for red button
//        if redStatus == true {
//            redButton.backgroundColor = UIColor(red: 1, green: 23/255, blue: 0, alpha: 1)
//        } else {
//            redButton.backgroundColor = UIColor(red: 1, green: 23/255, blue: 0, alpha: 0.3)
//        }
//        // UI for yellow button
//        if yellowStatus == true {
//            yellowButton.backgroundColor = UIColor(red: 1, green: 216/255, blue: 0, alpha: 1)
//        } else {
//            yellowButton.backgroundColor = UIColor(red: 1, green: 216/255, blue: 0, alpha: 0.3)
//        }
//        // UI for green button
//        if greenStatus == true {
//            greenButton.backgroundColor = UIColor(red: 19/255, green: 1, blue: 0, alpha: 1)
//        } else {
//            greenButton.backgroundColor = UIColor(red: 19/255, green: 1, blue: 0, alpha: 0.3)
//        }
//    }
//    
//    func getLedStatus() -> Void {
//        Alamofire.request(Constant.Url.baseUrl).responseJSON { response in
//            if let JSON = response.result.value {
//                let data = JSON as! [String: Any]
//                self.redStatus = data["red"] as! String == "0" ? false : true
//                
//                self.yellowStatus = data["yellow"] as! String == "0" ? false : true
//                
//                self.greenStatus = data["green"] as! String == "0" ? false : true
//                
//                self.setupUI()
//            } else {
//                print(response)
//            }
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
