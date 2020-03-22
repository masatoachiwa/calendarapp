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
  
        @IBOutlet var loveBar: UIProgressView!
        
        
        @IBOutlet var progressLabel: UILabel!
        
        @IBOutlet var count: UILabel!

        
        
        
        var cu : Int = 0
        
        let transform1 = CGAffineTransform(scaleX: 1, y: 10)
        let transform2 = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        
         let talkManager = TalkManager.shared
        
        
        
    override func viewDidLoad() {
        super.viewDidLoad()

  loveBar.transform = transform1.concatenating(transform2)
      
        
        }
        

        
        override func viewWillAppear(_ animated: Bool) {
               
                speechText.text = TalkManager.shared.numberOfLabel().0
                jkImage.image = TalkManager.shared.numberOfLabel().1
                
                loveBar.setProgress(Float(Double(TalkManager.shared.currentTotalPoint) * 0.005555), animated: true)

                let num = loveBar.progress * 100
                progressLabel.text = "\(ceil(num * 10)/10)%"
                
                count.text = String(TalkManager.shared.currentTotalPoint)
                
                switch TalkManager.shared.currentType {
                case .good:
                       speechText.text = TalkManager.shared.numberOfLabel().0
                       
                case .bad:
                       speechText.text = TalkManager.shared.badOfLabel().0
                        

                }
        }

  
        @IBAction func goButton(_ sender: Any) {
        }
        
        
        @IBAction func backButton(_ sender: Any) {
        }
        
        
        
        
        
        

        
}



