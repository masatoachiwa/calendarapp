//
//  Button_Custom.swift
//  calendarapp
//
//  Created by アプリ開発 on 2020/03/22.
//  Copyright © 2020 Masato.achiwa. All rights reserved.
//

import UIKit

@IBDesignable class Button_Custom : UIButton {

        @IBInspectable var textColor: UIColor?
        
        @IBInspectable var cornerRadius: CGFloat = 0 {
                didSet {
                        layer.cornerRadius = cornerRadius
                }
        }
        
        @IBInspectable var borderWidth: CGFloat = 0 {
                didSet {
                        layer.borderWidth = borderWidth
                }
        }
        
        @IBInspectable var borderColor: UIColor = UIColor.clear {
                didSet {
                        layer.borderColor = borderColor.cgColor
                }

}
      
     
        
}
