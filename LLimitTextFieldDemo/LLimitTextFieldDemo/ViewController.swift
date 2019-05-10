//
//  ViewController.swift
//  LLimitTextFieldDemo
//
//  Created by LvesLi on 2019/3/21.
//  Copyright © 2019 LvesLi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var limitTextField: LLimitTextField!
    @IBOutlet weak var spaceTextField: LLimitTextField!
    @IBOutlet weak var passwordTextField: LLimitTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Limit TextField"
        
        limitTextField.isAutoInsertSpace = true
        limitTextField.insertSpaceStep = 4
        limitTextField.textColor = UIColor.black
        limitTextField.font = UIFont.systemFont(ofSize: 25)
        limitTextField.cursorColor = UIColor.black
        limitTextField.keyboardType = .numberPad
        limitTextField.delegate = self
        limitTextField.underlineType = .one
        limitTextField.underlineColor = UIColor(hex6: 0x2CF0F9)
        limitTextField.limitLength = 16
        
        
        
        spaceTextField.textColor = UIColor.black
        spaceTextField.limitLength = 4
        spaceTextField.font = UIFont.systemFont(ofSize: 25)
        spaceTextField.cursorColor = UIColor.black
        spaceTextField.keyboardType = .numberPad
        spaceTextField.textAlignment = .center
        spaceTextField.delegate = self
        spaceTextField.underlineType = .spaced
        spaceTextField.underlineColor = UIColor(hex6: 0x2CF0F9)
        
        

        passwordTextField.textColor = UIColor.black
        passwordTextField.isSecureTextEntry = true
        passwordTextField.limitLength = 6
        passwordTextField.insertSpaceStep = 6
        passwordTextField.font = UIFont.systemFont(ofSize: 25)
        passwordTextField.cursorColor = UIColor.black
        passwordTextField.keyboardType = .numberPad
        passwordTextField.textAlignment = .center
        passwordTextField.delegate = self
        passwordTextField.underlineType = .one
        passwordTextField.underlineColor = UIColor(hex6: 0x2CF0F9)

        
    }
    


}

extension ViewController: LLimitTextFieldDelegate{
    func inputViewDidEndEditing(_ inputView: LLimitTextField) {
        print(inputView.text ?? "")
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
}


extension UIColor{
    public convenience init(hex6: UInt32, alpha: CGFloat = 1) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex6 & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hex6 & 0x0000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

