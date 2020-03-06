//
//  ImageViewController.swift
//  calendarapp
//
//  Created by アプリ開発 on 2019/12/15.
//  Copyright © 2019 Masato.achiwa. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

      
        
        @IBOutlet var jkImage: UIImageView!
        
        @IBOutlet var speechText: UILabel!
        
        
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
 
       
        }
        override func viewWillAppear(_ animated: Bool) {
               
                speechText.text = TalkManager.shared.numberOfLabel().0
                jkImage.image = TalkManager.shared.numberOfLabel().1
                
                
                switch TalkManager.shared.currentType {
                case .good:
                       speechText.text = TalkManager.shared.numberOfLabel().0
                       
                case .bad:
                       speechText.text = TalkManager.shared.badOfLabel().0
                        
                }
             
                
        }

   
}



