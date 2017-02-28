//
//  SetupViewController.swift
//  ledSwift
//
//  Created by Duc Nguyen Viet on 2/28/17.
//  Copyright © 2017 Duc Nguyen Viet. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var ipTextField: UITextField!
    @IBOutlet weak var goButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        ipTextField.delegate = self

        ipTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
     // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "go" {
            let homeViewController = segue.destination as! HomeViewController
            homeViewController.specificIp = ipTextField.text!
        }
    }

}

extension SetupViewController: UITextFieldDelegate {
    
    // MARK: Actions
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    func textFieldDidChange(textField: UITextField) {
        if ipTextField.text?.characters.count == 0 {
            self.goButton.isEnabled = false
            self.goButton.backgroundColor = UIColor.gray
        } else {
            self.goButton.isEnabled = true
            self.goButton.backgroundColor = UIColor.blue
        }
    }
}
