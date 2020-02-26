//
//  CalendarCell.swift
//  calendarapp
//
//  Created by アプリ開発 on 2019/10/18.
//  Copyright © 2019 Masato.achiwa. All rights reserved.
//

import UIKit

class CalendarCell: UICollectionViewCell {
        
        var year: Int?
        var month: Int?
        var day: Int?
        
        var textLabel : UILabel!
        var cellImage = UIImageView()
        var cellImage1 = UIImageView()
        var cellImage2 = UIImageView()
        
     
        
        let datemanager = DateManager()
        
        
        required init?(coder aDecoder: NSCoder) {
                
                super.init(coder:aDecoder)!
                
                
                
                //UILabelを生成
                textLabel = UILabel(frame: CGRect(x:0, y:0, width:self.frame.width,  height: self.frame.height))
                textLabel.font = UIFont(name: "HiraKakuProN-W3", size: 12)
                textLabel.textAlignment = NSTextAlignment.center
                
                //UIImageを作成
                cellImage = UIImageView(frame: CGRect(x:0, y:0, width:self.frame.width,  height: self.frame.height))
                cellImage1 = UIImageView(frame: CGRect(x:0, y:0, width:self.frame.width,  height: self.frame.height))
                cellImage2 = UIImageView(frame: CGRect(x:0, y:0, width:self.frame.width,  height: self.frame.height))
                
                // Cellに追加
                self.addSubview(cellImage)  //○
                self.addSubview(cellImage1)  //ばつ
                self.addSubview(cellImage2) // ハイフン
                
                
                self.addSubview(textLabel!)
                
        }
        
        
        func remove(year: Int, month:Int ,day: Int){
                
                cellImage.isHidden = true
                cellImage1.isHidden = true
                cellImage2.isHidden = true
        }
        

        
        func getToday(year: Int, month:Int ,day: Int){
                //   print(year)
                //   print(month)
                //    print(self.textLabel.text!) // ここにcellの日付が入る。
                //    print("\(String(datemanager.year))年\(String(datemanager.month))月\(String(datemanager.day))日")
                // ここで保存した日付を取得する、今は仮に今日日付を取得
                

                cellImage.isHidden = true
                cellImage1.isHidden = true
        cellImage2.isHidden = true
                
                
                let good =  UserDefaults.standard.array(forKey: {"dayArray"}())as? [String]          //配列の呼び出し
                
                
                let bad =  UserDefaults.standard.array(forKey: {"baddayArray"}())as? [String]          //配列の呼び出し
                
                let rest =  UserDefaults.standard.array(forKey: {"restdayArray"}())as? [String]          //配列の呼び出し
                

                
                if month < 10{ //月が10以下だったら
                        let newMonth =  String("0") + String(month)
                        print(String(year) + String(newMonth) + self.textLabel.text! )
                 print(good!)


                     
                        
                        
                        if good!.contains(String(year) + String(newMonth) + self.textLabel.text!)  { //goodの配列の中の数字と、カレンダーの日付が同じ日に
                                        cellImage.isHidden = false //○を隠さない
                                        
                                }
                                
                                        
                                  else   if  bad!.contains(String(year) + String(newMonth) + self.textLabel.text!){
                                                cellImage1.isHidden = false //バツを隠さない
                                                
                                                
                                }
                                
                                          else   if  rest!.contains(String(year) + String(newMonth) + self.textLabel.text!){
                                                        cellImage2.isHidden = false //ハイフンを隠さない
                                                        
                                                        
                                }
                        
                                
              
                        
                }else { //月が10以下でなかったら
                        
                        print(String(year) + String(month) + self.textLabel.text! )
                        
                        if good!.contains(String(year) + String(month) + self.textLabel.text!){
                                cellImage.isHidden = false
                                
                        }else if bad!.contains(String(year) + String(month) + self.textLabel.text!){
                                cellImage1.isHidden = false
                        }else if rest!.contains(String(year) + String(month) + self.textLabel.text!){
                                cellImage2.isHidden = false //ハイフンを隠さない
                                
                        }else {
                                
                                cellImage.isHidden = true
                                cellImage1.isHidden = true
                                cellImage2.isHidden = true
                        }
                        
                        
                }
                
                
        }
        
}

























