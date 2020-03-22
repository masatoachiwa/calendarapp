//
//  TopViewController.swift
//  calendarapp
//
//  Created by アプリ開発 on 2019/12/17.
//  Copyright © 2019 Masato.achiwa. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {



        @IBOutlet var yearLabel: UILabel!
        
        @IBOutlet var doLabel: UILabel!
        
        @IBOutlet var do2Label: UILabel!
        
        @IBOutlet var kariLabel: UILabel! //デバック用ラベル
        
       @IBOutlet var pointLabel: UILabel! //デバック用ラベル
        
       @IBOutlet var badLabel: UILabel! //デバック用ラベル
        
        
        @IBOutlet var testLabel: UILabel!  //デバック用日付変更確認ラベル
        
        
     var n = 0
        
        @IBOutlet var topView: UIImageView!
        
        @IBOutlet var goodButton: UIButton!
        
        @IBOutlet var badButton: UIButton!
        
        @IBOutlet var restButton: UIButton!
        
        let defaults = UserDefaults.standard
        
        
        let datemanager = DateManager()
        
        
        let talkManager = TalkManager.shared
      
        let date = Date() //本日の日付取得
        let dateFormatter = DateFormatter() //文字列からDate型の日付を生成できる（インスタンスの作成）
      
         let alldayArray =  UserDefaults.standard.array(forKey: {"alldayArray"}())as? [String]          //配列の呼び出し
        
        
        

        override func viewDidLoad() {
                super.viewDidLoad()
              
              kariLabel.isHidden = true
              pointLabel.isHidden = true
              badLabel.isHidden = true
              testLabel.isHidden = true
               
                yearLabel.text = "\(String(datemanager.year))年\(String(datemanager.month))月\(String(datemanager.day))日"
               
                let effort: String = UserDefaults.standard.string(forKey: "effort")!
              let period: String = UserDefaults.standard.string(forKey: "period")!
                 let unit: String = UserDefaults.standard.string(forKey: "unit")!
                
                doLabel.text = effort + "を"
               do2Label.text = period + unit + "する"
                
                   switch TalkManager.shared.currentType { //---------------デバック用ポイント確認コード---
       
                   case .good:
                        kariLabel.text = TalkManager.shared.numberOfLabel().0
                          pointLabel.text = String(TalkManager.shared.currentTotalPoint)
                case .bad:
                        kariLabel.text = TalkManager.shared.badOfLabel().0
                        
                }
                pointLabel.text = String(talkManager.currentTotalPoint)
                badLabel.text = String(talkManager.currentTotalbadPoint)
                //---------ここまで---------------------------
              
                talkManager.date(abcd:dateFormatter.string(from: date) ) //配列に初期値を代入
                talkManager.badDate(abcd:dateFormatter.string(from: date) )
                talkManager.restDate(abcd:dateFormatter.string(from: date) )
              
               

                if datemanager.month < 10 {  //----------------アプリ落としてもボタン押せない処理---------------------------------------
                        let alldayArray =  UserDefaults.standard.array(forKey: {"alldayArray"}())as? [String] ??  [""]        //配列の呼び出し
                        
                        let newMonth =  String("0") + String(datemanager.month)
     
                        
                        if alldayArray.contains(String(datemanager.year) + String(newMonth) + String(datemanager.day))   {
                                //goodの配列の中の数字と、カレンダーの日付が同じ日に
                            
                                badButton.isEnabled = false
                                restButton.isEnabled = false
                                goodButton.isEnabled = false
                    
                        }else{ return
                        }
                
                }else{
                          let alldayArray =  UserDefaults.standard.array(forKey: {"alldayArray"}())as? [String] ??  [""]        //配列の呼び出し
                    
                    if    alldayArray.contains(String(datemanager.year) + String(datemanager.month) + String(datemanager.day)) {
                                badButton.isEnabled = false
                                restButton.isEnabled = false
                                goodButton.isEnabled = false
              
                        }
                        else{ return
                }
              
        }//--------------------------------------------------ここまで---------------
        }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        let effort: String = UserDefaults.standard.string(forKey: "effort")!
        let period: String = UserDefaults.standard.string(forKey: "period")!
        let unit: String = UserDefaults.standard.string(forKey: "unit")!
        
        doLabel.text = effort + "を"
        do2Label.text = period + unit + "する"
        
          ////---------- 日付変更---------------------
        let alldayArray =  UserDefaults.standard.array(forKey: {"alldayArray"}())as? [String]
        print([alldayArray])
     print( "\(String(datemanager.year))\(String(datemanager.month))\(String(datemanager.day))")
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(significantTimeChangeNotification(_:)), name: UIApplication.significantTimeChangeNotification, object: nil)
    }
        
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.significantTimeChangeNotification, object: nil)
    }
        
     ////--------------ここまで--------
        
        @IBAction func goodButton(_ sender: Any) {
                TalkManager.shared.currentType = .good
                TalkManager.shared.point += 1
                kariLabel.text = TalkManager.shared.numberOfLabel().0
                pointLabel.text = String(TalkManager.shared.currentTotalPoint)
        
                
                dateFormatter.dateFormat = "yyyyMMd" //yyMMddの形式で日付を生成する
          //      print(dateFormatter.string(from: date)) //本日の日付を取得
                
         
                talkManager.date(abcd:dateFormatter.string(from: date) )
                talkManager.allDate(abcd:dateFormatter.string(from: date) )
         

         badButton.isEnabled = false   // ボタン無効
         restButton.isEnabled = false
         goodButton.isEnabled = false
                
        
                
        }
        
        
        
        @IBAction func badButton(_ sender: Any) {
                TalkManager.shared.currentType = .bad
                TalkManager.shared.badPoint += 1
                kariLabel.text = TalkManager.shared.badOfLabel().0
                badLabel.text = String(TalkManager.shared.currentTotalbadPoint)
                
                dateFormatter.dateFormat = "yyyyMMd" //yyMMddの形式で日付を生成する
             //   print(dateFormatter.string(from: date)) //本日の日付を取得
                
                talkManager.badDate(abcd:dateFormatter.string(from: date) )
                 talkManager.allDate(abcd:dateFormatter.string(from: date) )
                
                badButton.isEnabled = false // ボタン無効
               restButton.isEnabled = false
                goodButton.isEnabled = false
                
                           let goodButton2: Bool = defaults.bool(forKey: "goodButton")
                               goodButton.isEnabled = goodButton2
             
        }
        
        @IBAction func restButton(_ sender: Any) {
                dateFormatter.dateFormat = "yyyyMMd" //yyMMddの形式で日付を生成する
      //          print(dateFormatter.string(from: date)) //本日の日付を取得
                
                talkManager.restDate(abcd:dateFormatter.string(from: date) )
                talkManager.allDate(abcd:dateFormatter.string(from: date) )
                
                badButton.isEnabled = false // ボタン無効
               restButton.isEnabled = false
                goodButton.isEnabled = false
                
                
                
        }
        
        @IBAction func risettButton(_ sender: Any) {
                TalkManager.shared.resetPoint()
       //         kariLabel.text = TalkManager.shared.numberOfLabel()
                pointLabel.text = String(TalkManager.shared.point)
                badLabel.text = String(TalkManager.shared.badPoint)
                
              
               talkManager.remove()
                badButton.isEnabled = true
                restButton.isEnabled = true
                goodButton.isEnabled = true
        }
        
        
    @objc private func significantTimeChangeNotification(_ notification: Notification) {
        testLabel.text = "日付が変わりました"
        badButton.isEnabled = true
        restButton.isEnabled = true
        goodButton.isEnabled = true
    }
        
}



