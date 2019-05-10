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
    @IBOutlet weak var gridTextField: LLimitTextField!
    @IBOutlet weak var gridPasswordTextField: LLimitTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Limit TextField"
        
        //if auto insert space
        limitTextField.isAutoInsertSpace = true
        //auto insert space step
        limitTextField.insertSpaceStep = 4
        //Color of text
        limitTextField.textColor = UIColor.black
        limitTextField.font = UIFont.systemFont(ofSize: 25)
        //the color of cursor
        limitTextField.cursorColor = UIColor.black
        limitTextField.keyboardType = .numberPad
        //LLimitTextFieldDelegate
        limitTextField.delegate = self
        //under line type
        limitTextField.underlineType = .one
        //under line color
        limitTextField.underlineColor = UIColor.cyan
        //Max limit
        limitTextField.limitLength = 16
        
        spaceTextField.textColor = UIColor.black
        spaceTextField.limitLength = 4
        spaceTextField.font = UIFont.systemFont(ofSize: 25)
        spaceTextField.cursorColor = UIColor.black
        spaceTextField.keyboardType = .numberPad
        spaceTextField.textAlignment = .center
        spaceTextField.delegate = self
        spaceTextField.underlineType = .spaced
        spaceTextField.underlineColor =  UIColor.cyan
        
        
        gridTextField.textColor = UIColor.black
        gridTextField.limitLength = 6
        gridTextField.font = UIFont.systemFont(ofSize: 25)
        gridTextField.cursorColor = UIColor.black
        gridTextField.keyboardType = .numberPad
        gridTextField.textAlignment = .center
        gridTextField.delegate = self
        gridTextField.underlineType = .grid
        gridTextField.underlineColor =  UIColor.cyan
        

        gridPasswordTextField.textColor = UIColor.black
        gridPasswordTextField.isSecureTextEntry = true
        gridPasswordTextField.limitLength = 6
        gridPasswordTextField.font = UIFont.systemFont(ofSize: 25)
        gridPasswordTextField.keyboardType = .numberPad
        gridPasswordTextField.textAlignment = .center
        gridPasswordTextField.delegate = self
        gridPasswordTextField.underlineType = .grid
        gridPasswordTextField.underlineColor = UIColor.gray
        gridPasswordTextField.isCursorViewHiden = true
    }

}

extension ViewController: LLimitTextFieldDelegate{
    func inputViewDidEndEditing(_ inputView: LLimitTextField) {
        print(inputView.text ?? "")
    }
}
