# LLimitTextField

The specified length of the string fills the entire TextField（指定长度的字符串占满整个TextField）

![Demo](https://github.com/Lves/LLimitTextField/blob/master/img/show_demo.png)

### Requirements
Swift 4.2+
Xcode 10.1+
### Installation
Cocoapods is developing, you can drag the `LLimitTextField` folder into your project.


### Usage（代码实例）


```
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
```

### UnderLine/SeperatorLine Type(分割线类型)

```
enum TextFieldUnderlineType{
    //no underline 
    case none
    //one line
    case one
    //Underline each character below
    case spaced
    //Gridlines
    case grid
}
```
