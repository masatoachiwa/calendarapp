//
//  tableViewViewController.swift
//  calendarapp
//
//  Created by アプリ開発 on 2020/03/15.
//  Copyright © 2020 Masato.achiwa. All rights reserved.
//

import UIKit

let sectionTitle = ["課金","アプリについて",]
let section0 = [("広告非表示"),("応援履歴")]
let section1 = [("お問い合わせ"),("レビューを書く"),("開発者のツイート")]


let tableDate = [section0,section1]


class tableViewViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
      

        
        @IBOutlet var tableView: UITableView!
      
        override func viewDidLoad() {
        super.viewDidLoad()
                tableView.delegate = self
                tableView.dataSource = self
        
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //セクションごとの行数を決める
       
                let sectionDate = tableDate[section]
                return sectionDate.count //複数のタプルが入っている配列
        }
      
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {  //セクションのタイトル
                return sectionTitle[section]
        }
        

        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {  //セルを作る
             
                let cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")   //セルの作成
       let sectionDate = tableDate[indexPath.section]     //tableDateをセクションごとに振り分ける。
                let cellDate = sectionDate[indexPath.row]    //選択された行の値を振り分ける
          cell.textLabel? .text = cellDate
             
                return cell
        }
        
   
        func numberOfSections(in tableView: UITableView) -> Int {//セクションの個数
                return sectionTitle.count
        }
        
        
        
        
        
        
        
        
        

}
