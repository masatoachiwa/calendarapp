//
//  SetupManager.swift
//  calendarapp
//
//  Created by アプリ開発 on 2020/02/20.
//  Copyright © 2020 Masato.achiwa. All rights reserved.
//

import UIKit

class SetupManager {
        static  let shared = SetupManager() //staticがないとエラー(シングルトン）
        private  init(){}

     
        
        
        
        func register(name:String){
                let nameDefaults = UserDefaults.standard
                nameDefaults.set(name, forKey: "name")
        
        }
                
        func register2(effort:String){
                
                let effortDefaults = UserDefaults.standard
                effortDefaults.set(effort, forKey: "effort")
        }
        
        func register3(period:String){
                let periodDefaults = UserDefaults.standard
                periodDefaults.set(period, forKey: "period")
        
}
        func register4(unit:String){
                
                let effortDefaults = UserDefaults.standard
                effortDefaults.set(unit, forKey: "unit")
        }

}
