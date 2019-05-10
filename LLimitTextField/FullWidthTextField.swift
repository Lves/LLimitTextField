//
//  FullWidthTextField.swift
//  Velo
//
//  Created by LvesLi on 2019/3/20.
//  Copyright © 2019 Pintec. All rights reserved.
//

import UIKit

class FullWidthTextField: UITextField {
    public var limitLength:UInt = 19
    public var cursorColor:UIColor = UIColor.black {
        didSet{
            self.cursorView.backgroundColor = cursorColor
        }
    }
    private var cursorView:UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = UIColor.yellow
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cursorView)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubview(cursorView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    private func setupUI()  {
        let fontSize:CGFloat = font?.pointSize ?? 0
        let y = (bounds.size.height-fontSize)/2.0
        cursorView.frame = CGRect(x: 0, y: y, width: 2, height: fontSize)
        cursorView.alpha = 0;
    }
    
    public func startShake()  {
        //Shake
        let baseAnimation = CABasicAnimation(keyPath: "opacity")
        baseAnimation.fromValue = NSNumber(value: 0)
        baseAnimation.toValue = NSNumber(value: 1)
        baseAnimation.duration = 0.6
        baseAnimation.autoreverses = true
        baseAnimation.repeatCount = Float.greatestFiniteMagnitude
        cursorView.layer.add(baseAnimation, forKey: "opacityAnimation")
    }
    public func stopShake() {
        cursorView.layer.removeAnimation(forKey: "opacityAnimation")
    }
    override func drawText(in rect: CGRect) {
        let fontSize:CGFloat = font?.pointSize ?? 0
        let fontW = rect.size.width/CGFloat(limitLength)
        let y = (rect.size.height-fontSize)/2.0
        if let contentString = self.text {
            for index in 0..<contentString.count {
                let nextIndex = contentString.index(contentString.startIndex, offsetBy: index)..<contentString.index(contentString.startIndex, offsetBy: index+1)
                let nextRect = CGRect(x: fontW*CGFloat(index), y: y, width: fontW, height: rect.size.height)
                
                let style = NSMutableParagraphStyle()
                style.alignment = textAlignment
                (contentString[nextIndex] as NSString).draw(in: nextRect,
                                                            withAttributes: [.font:UIFont.systemFont(ofSize: fontSize),
                                                                             .foregroundColor:textColor ?? UIColor.black,
                                                                             .paragraphStyle:style])
            }
            let oldReact = cursorView.frame
            cursorView.frame = CGRect(x: fontW*CGFloat(contentString.count), y: oldReact.origin.y, width: oldReact.size.width, height: oldReact.size.height)
        }
    }

}
