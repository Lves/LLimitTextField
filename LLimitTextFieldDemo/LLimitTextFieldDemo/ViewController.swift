//
//  ViewController.swift
//  LLimitTextFieldDemo
//
//  Created by LvesLi on 2019/3/21.
//  Copyright © 2019 LvesLi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,LLimitTextFieldDelegate {

    
    @IBOutlet weak var limitTextField: LLimitTextField!
    @IBOutlet weak var spaceTextField: LLimitTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Limit TextField"
        
        limitTextField.isAutoInsertSpace = true
        limitTextField.insertSpaceStep = 4
        limitTextField.textColor = UIColor.white
        limitTextField.font = UIFont.systemFont(ofSize: 25)
        limitTextField.cursorColor = UIColor.white
        limitTextField.keyboardType = .numberPad
        limitTextField.delegate = self
        limitTextField.underlineType = .one
        limitTextField.underlineColor = UIColor(hex6: 0x2CF0F9)
        limitTextField.limitLength = 16
        
        
        
        spaceTextField.textColor = UIColor.white
        spaceTextField.limitLength = 4
        spaceTextField.font = UIFont.systemFont(ofSize: 25)
        spaceTextField.cursorColor = UIColor.white
        spaceTextField.keyboardType = .numberPad
        spaceTextField.textAlignment = .center
        spaceTextField.delegate = self
        spaceTextField.underlineType = .spaced
        spaceTextField.underlineColor = UIColor(hex6: 0x2CF0F9)
        
    }
    func inputViewDidEndEditing(_ inputView: LLimitTextField) {
        print(inputView.text ?? "")
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
