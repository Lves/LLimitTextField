//
//  CardNumberTextField.swift
//  Velo
//
//  Created by LvesLi on 2019/3/20.
//  Copyright © 2019 Pintec. All rights reserved.
//

import UIKit

enum TextFieldUnderlineType{
    case none
    case one
    case spaced
}

protocol LLimitTextFieldDelegate: class {
     func inputViewDidEndEditing(_ inputView: LLimitTextField)
}

class LLimitTextField: UIView {
    public weak var delegate:LLimitTextFieldDelegate?
    public var limitLength:UInt = 16 {
        didSet{
            if isAutoInsertSpace{
                var spaceCount:UInt = 0 //代表空格的个数，每四个字符一个空格
                if limitLength%UInt(insertSpaceStep) == 0{
                    spaceCount = limitLength/UInt(insertSpaceStep)-1
                    spaceCount = max(spaceCount, 0) // >= 0
                }else{
                    spaceCount = limitLength/UInt(insertSpaceStep)
                }
                _maxLength = limitLength + spaceCount
            }else{
                _maxLength = limitLength
            }
            justShowTextField.limitLength = _maxLength
        }
    }
    public var textColor:UIColor = UIColor.black{
        didSet{
            justShowTextField.textColor = textColor
        }
    }
    public var font:UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize){
        didSet{
            justShowTextField.font = font
        }
    }
    public var keyboardType:UIKeyboardType = .default{
        didSet{
            controlTextField.keyboardType = keyboardType
        }
    }
    public var cursorColor:UIColor = UIColor.black {
        didSet{
            justShowTextField.cursorColor = cursorColor
        }
    }
    public var text:String?{
        get{
            return controlTextField.text?.replacingOccurrences(of: " ", with: "")
        }
    }
    public var textAlignment:NSTextAlignment = .left{
        didSet{
            justShowTextField.textAlignment = textAlignment
        }
    }
    //set isAutoInsertSpace befor limitLength
    public var isAutoInsertSpace:Bool = false
    public var insertSpaceStep:Int = 4
    public var bottomLineTopMargin:CGFloat = 3
    public var bottomLineHeight:CGFloat = 2
    //underlineType = .spaced
    public var bottomLineSpaceWidth:CGFloat = 3
    public var underlineType:TextFieldUnderlineType = .none
    public var underlineColor:UIColor = .black{
        didSet{
            for subLayer in self.layerArray {
                subLayer.backgroundColor = underlineColor.cgColor
            }
        }
    }
    private var layerArray:[CALayer] = []
    private var _maxLength:UInt = 19
    private let justShowTextField:FullWidthTextField = {
        let textField = FullWidthTextField(frame: CGRect.zero)
        textField.isUserInteractionEnabled = false
        textField.borderStyle = .none
        return textField
    }()
    private let controlTextField:UITextField = {
        let textField = UITextField(frame: CGRect.zero)
        textField.borderStyle = .none
        textField.textColor = UIColor.clear
        textField.tintColor = UIColor.clear
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
         createUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createUI()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    private func createUI()  {
        addSubview(controlTextField)
        addSubview(justShowTextField)
        controlTextField.delegate = self
    }
    private func setupUI() {
        
        createUnderline()
    }
    
    private func createUnderline(){
        
        var textFieldFrame = bounds
        if underlineType == .one {
            textFieldFrame.h -= (bottomLineHeight + bottomLineTopMargin)
            if layerArray.count == 0{
                let bottomLayer = CALayer()
                bottomLayer.backgroundColor = underlineColor.cgColor
                bottomLayer.frame = CGRect(x: 0, y: textFieldFrame.h+bottomLineTopMargin, width: bounds.size.width, height: bottomLineHeight)
                layer.addSublayer(bottomLayer)
                layerArray.append(bottomLayer)
            }
        }else if underlineType == .spaced{
            textFieldFrame.h -= (bottomLineHeight + bottomLineTopMargin)
            if layerArray.count == 0{
                let space = _maxLength-1
                let lineWidth = (bounds.size.width-CGFloat(space)*bottomLineSpaceWidth)/CGFloat(_maxLength)
                for index in 0..<_maxLength{
                    let bottomLayer = CALayer()
                    bottomLayer.backgroundColor = underlineColor.cgColor
                    bottomLayer.frame = CGRect(x:(lineWidth+bottomLineSpaceWidth)*CGFloat(index) , y: textFieldFrame.h+bottomLineTopMargin, width: lineWidth, height: bottomLineHeight)
                    layer.addSublayer(bottomLayer)
                    layerArray.append(bottomLayer)
                }
            }
        }
        controlTextField.frame = textFieldFrame
        justShowTextField.frame = textFieldFrame
        
    }
}

extension LLimitTextField:UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.controlTextField.isHidden = true
        self.justShowTextField.startShake()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.controlTextField.isHidden = false
        self.justShowTextField.stopShake()
        if let dele = self.delegate {
            dele.inputViewDidEndEditing(self)
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var changeRange = range
        if let currentText = textField.text,currentText.count > 0,string != ""{
            if currentText.count >= _maxLength{
                controlTextField.resignFirstResponder()
                return false
            }else if isAutoInsertSpace && currentText.count%(insertSpaceStep+1) == insertSpaceStep{ //每四个添加一个" "
                textField.text?.append(" ")
                changeRange = NSRange(location: range.location+1, length: range.length)
            }
        }
        let next = ((textField.text ?? "") as NSString).replacingCharacters(in: changeRange, with: string)
        self.justShowTextField.text = next
        return true
    }
}
