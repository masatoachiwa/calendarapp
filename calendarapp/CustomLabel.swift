//
//  CustomLabel.swift
//  calendarapp
//
//  Created by アプリ開発 on 2020/03/23.
//  Copyright © 2020 Masato.achiwa. All rights reserved.
//

import UIKit

     
        @IBDesignable class CustomLabel: UILabel {
                
                // 角丸の半径(0で四角形)
                @IBInspectable var cornerRadius: CGFloat = 0.0
                
                // 枠
                @IBInspectable var borderColor: UIColor = UIColor.clear
                @IBInspectable var borderWidth: CGFloat = 0.0
                
                // 余白
                let padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
                
                override func drawText(in rect: CGRect) {
                        // 角丸
                        self.layer.cornerRadius = cornerRadius
                        self.clipsToBounds = (cornerRadius > 0)
                        
                        // 枠線
                        self.layer.borderColor = borderColor.cgColor
                        self.layer.borderWidth = borderWidth
                        
                        super.drawText(in: rect.inset(by: padding))
                }
            
                // ラベルのサイズを調整する
                override var intrinsicContentSize: CGSize {
                    var intrinsicContentSize = super.intrinsicContentSize
                    intrinsicContentSize.height += padding.top + padding.bottom
                    intrinsicContentSize.width += padding.left + padding.right
                    return intrinsicContentSize
                }
                
 }
