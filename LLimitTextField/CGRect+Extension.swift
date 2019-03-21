//
//  CGRect+Extension.swift
//  LLimitTextFieldDemo
//
//  Created by LvesLi on 2019/3/21.
//  Copyright © 2019 LvesLi. All rights reserved.
//

import UIKit

extension CGRect{
    /// X value of CGRect's origin
    public var x: CGFloat {
        get {
            return self.origin.x
        } set(value) {
            self.origin.x = value
        }
    }
    
    /// Y value of CGRect's origin
    public var y: CGFloat {
        get {
            return self.origin.y
        } set(value) {
            self.origin.y = value
        }
    }
    
    /// Width of CGRect's size
    public var w: CGFloat {
        get {
            return self.size.width
        } set(value) {
            self.size.width = value
        }
    }
    
    /// Height of CGRect's size
    public var h: CGFloat {
        get {
            return self.size.height
        } set(value) {
            self.size.height = value
        }
    }
}
