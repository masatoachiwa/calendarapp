//
//  TalkManager.swift
//  calendarapp
//
//  Created by アプリ開発 on 2019/12/17.
//  Copyright © 2019 Masato.achiwa. All rights reserved.
//

import UIKit

class TalkManager {
        
        
        static  let shared = TalkManager() //staticがないとエラー
        private  init(){}
        
        var badPoint = 0{
                willSet {
                        UserDefaults.standard.set(newValue, forKey: "badpoint") //新しい値をnewValueに保存
                        UserDefaults.standard.synchronize()
                }
        }
        
        
        var point = 0 {
                willSet {
                        UserDefaults.standard.set(newValue, forKey: "goodpoint") //新しい値をnewValueに保存
                        UserDefaults.standard.synchronize()
                }
        }
        
        var currentTotalPoint: Int {
                get{
                        return  UserDefaults.standard.integer(forKey: "goodpoint")
                }
        }
        var currentTotalbadPoint: Int {
                get{
                        return  UserDefaults.standard.integer(forKey: "badpoint")
                }
        }
        
        var currentType: Type {
                get{
                        guard let type = Type(rawValue: UserDefaults.standard.integer(forKey: "type")) else {  //enum TypeからKey"type"に保存された新しい値rawValueがあったらtypeに代入して返す。
                                //デフォルトはgoodType
                                return Type.good
                        }
                        return type
                }
                
                set {
                      //  UserDefaults.standard.set(newValue, forKey: "type")
                       
                          UserDefaults.standard.set(newValue.rawValue, forKey: "type")
                }
        }
        var userDefaults = UserDefaults.standard  // UserDefaultsの定義
      
//        var dayArray: [String] = []
//        var baddayArray: [String] = []
//        var restdayArray: [String] = []
        
     
        
        var dayArray : [String] =  (UserDefaults.standard.array(forKey: {"dayArray"}())as? [String] ?? ["りんご"])
        var baddayArray : [String] =  (UserDefaults.standard.array(forKey: {"baddayArray"}())as? [String] ?? ["ごりら"])
        var restdayArray : [String] =  (UserDefaults.standard.array(forKey: {"restdayArray"}())as? [String] ?? ["らっぱ"])
        
        
        func date(abcd:String){ //yymmddの追加と値の保存
          
               dayArray.append(abcd)
                print(dayArray)
                
                let defaults = UserDefaults.standard
               defaults.set(dayArray, forKey: "dayArray")
                

        }
        func badDate(abcd:String){ //yymmddの追加と値の保存
               
                baddayArray.append(abcd)
                
                let defaults = UserDefaults.standard
                defaults.set(baddayArray, forKey: "baddayArray")
                
               
        }
        func restDate(abcd:String){ //yymmddの追加と値の保存
                
              restdayArray.append(abcd)
                
                let defaults = UserDefaults.standard
                defaults.set(restdayArray, forKey: "restdayArray")
                
        }
        
        
        func remove(){
                dayArray.removeAll() //配列空にする
                let defaults = UserDefaults.standard
                defaults.set(dayArray, forKey: "dayArray")
                baddayArray.removeAll() //配列空にする
                let baddefaults = UserDefaults.standard
                baddefaults.set(baddayArray, forKey: "baddayArray")
                restdayArray.removeAll() //配列空にする
                let restdefaults = UserDefaults.standard
                restdefaults.set(restdayArray, forKey: "restdayArray")
                
        }
        

        func resetPoint() {
                point = 0
                badPoint = 0
                
        }
        
        
        let image0 = UIImage(named:"haruko1")
         let image1 = UIImage(named:"haruko2")
        let image2 = UIImage(named:"haruko3")
        let image3 = UIImage(named:"haruko4")
        let image4 = UIImage(named:"haruko5")
        let image5 = UIImage(named:"haruko6")
        let image6 = UIImage(named:"haruko7")
        let image7 = UIImage(named:"haruko8")
        let image8 = UIImage(named:"haruko9")
        let image9 = UIImage(named:"haruko1")
        
        
        
        
        
        
        func numberOfLabel() -> (String, UIImage) {
                switch currentTotalPoint {
                case 0:
                        return ("これから頑張ろう。",image0!)
                case 1:
                return ("聞いたよー。〇〇始めたんだってね？何日続くんだろうね？（笑",image2!)
                case 2:
                        return ("やるじゃん！絶対やめたと思った。",image8!)
                case 3:
                        return ("3日続いたね。エライ！",image3!)
                case 4:
                        return ("そろそろ飽きたころでしょ？",image9!)
                case 5:
                        return ("最近雨が多いのは＊＊のせいかな？",image1!)
                case 6:
                        return( "〇〇続いているみたいだね。頑張って。", image2!)
                case 7:
                       return( "一週間もったね。応援してるよ。",image4!)
                case 8:
                        return ("今日も〇〇してたんだね。お疲れ様。",image2!)
               case 9:
                        return ("＊＊お疲れ様。はい、ジュース。",image3!)
                case 10:
                       return ("10日目達成だね。ちょっと見直したな。",image1!)
               case 11:
                       return ("ここまできたら諦めたらだめだよ。",image2!)
               case 12:
                        return ("最近頑張ってるね。感心、感心（笑）",image5!)
               case 13:
                        return ("頑張るのもいいけど、たまには息抜きも必要だよ。",image8!)
                case 14:
                        return ("二週間経ったね。ちょっと尊敬するかも。", image3!)
                case 15:
                        return ("目標は高く半年続けることね！",image8!)
               case 16:
                        return ("私も〇〇やろうかなー？",image8!)
                case 17:
                        return ("あー、結局〇〇やってない。私は小さい頃からピアノずっと続けれてるからいいの。",image8!)
                case 18:
                        return ("お疲れ様。今日も飽きずに〇〇してるね。",image8!)
                case 19:
                        return ("最近＊＊が頑張っても雨降らなくなったね。",image8!)
                case 20:
                        return( "２０日達成したよー。へい、へい。",image8!)
                case 21:
                        return ("もうすぐ１ヶ月だねー。しみじみだね。",image8!)
                case 22:
                        return ("＊＊が頑張ってると、なんだか私も頑張らなきゃって思うよ。",image8!)
                case 23:
                        return ("焦らずに行こうね。急がば回れだよ。",image8!)
                case 24:
                        return ("さっき友達に＊＊のこと話したら褒めてたよ。",image8!)
                case 25:
                       return ("今日も頑張ったんだね。飛ばしすぎちゃだめだよ。",image8!)
                case 26:
                        return ("疲れ溜まってない？大丈夫？",image8!)
                case 27:
                        return ("お疲れ、昨日は何時まで○○してたの？",image8!)
                case 28:
                        return ("＊＊の努力が早く実るといいね",image8!)
                case 29:
                        return ("えへへ。安定の努力家ですね！",image8!)
                case 30:
                        return ("30日経ったよ！これから苦しくなるかもしれないけど応援してるから！",image8!)
                case 31:
                        return ("まだまだこれからだよ！",image8!)
                case 32:
                        return ("やっぱり努力してる人って素敵だな。",image8!)
                case 33:
                        return ("もうすぐ定期試験だね。二足のわらじも大変だけど頑張ろ。",image8!)
                case 34:
                        return ("やっぱり両立って難しいよね。できる＊＊のこと尊敬するなー。",image8!)
                case 35:
                        return("昨日は疲れて全然勉強できなかったー。＊＊と違って私だめだなー。",image8!)
                case 36:
                        return ("テストできた？",image8!)
                case 37:
                        return ("テスト終わったね。また〇〇頑張ろー！",image8!)
                case 38:
                        return ("＊＊、〇〇始める頃よりもテストの点あがってない？",image8!)
                case 39:
                        return ("一つのことを努力する習慣がつくと、他のこともできるようになるのかな？",image8!)
                case 40:
                        return ("クラスメートも〇〇が変わったことに気がつきはじめたかもね。",image8!)
                case 41:
                        return ("私は最初から〇〇がやればできるって知ってたよ。",image8!)
                case 42:
                        return ("お疲れ、〇〇の集中力を分けて欲しいよ。",image8!)
                case 43:
                        return ("たまには休息もとらないとダメだよ。",image8!)
                case 44:
                        return ("＊は彼女いないの？",image8!)
                case 45:
                        return ("いないんだー。ごめん、変なこときいて。",image8!)
                case 46:
                        return ("今は〇〇を頑張ってるからいらないよね。",image8!)
                case 47:
                        return ("あっ、もうすぐ５０日だよ。ファイトー！",image8!)
                case 48:
                        return ("お疲れ！ちゃんと息抜きしてる？",image8!)
                case 49:
                        return ("感心、感心",image8!)
                case 50:
                        return ("５０日ー！おめでとー！",image8!)
                case 51:
                        return ("とりあえず半年は頑張って！私にできることは協力するから。",image8!)
                case 52:
                        return ("後１３０日！道のりは長いよ！",image8!)
                case 53:
                        return ("＊＊なら絶対できるよ！",image8!)
                case 54:
                        return ("もう〇〇しないと気持ち悪いんじゃない？",image8!)
                case 55:
                        return ("私も＊＊が○○してないって聞くと、体調悪いの？って思うようになっちゃった。",image8!)
                case 56:
                        return ("なんだか＊＊が頑張ってる姿見ると私も嬉しくなっちゃう。",image8!)
                case 57:
                        return ("今日も頑張ったね！私もピアノの練習頑張らなくっちゃ",image8!)
                case 58:
                        return ("今度私にも○○教えて欲しいなー。",image8!)
                case 59:
                        return ("やりすぎは体に毒だから、飛ばしすぎないでね。",image8!)
                case 60:
                        return ("６０日できたね。３分の１終わったよ！",image8!)
                case 61:
                        return ("お疲れ！ねえ、＊＊はなんで〇〇を始めたの？",image8!)
                case 62:
                        return ("みんなそれぞれいろんな理由があるけど、頑張っている人はかっこいいと思うよ。",image8!)
                case 63:
                        return ("だから、＊＊も今かっこいいよ。",image8!)
                case 64:
                        return ("照れてるのー？",image8!)
                case 65:
                        return ("その表情マルですね。",image8!)
                case 66:
                        return ("今これ流行ってるんだよ。＊＊は毎日頑張ってるから知らないかもね。",image8!)
                case 67:
                        return ("お疲れ様。良かったら一緒に帰ろ。",image8!)
                case 68:
                        return ("私ね、最近＊＊の影響なのかピアノの練習が前より楽しいんだ。",image8!)
                case 69:
                        return ("類は友を呼ぶっていうからかな、＊＊見てると私も頑張らなくちゃって思うの。",image8!)
                case 70:
                        return ("でも思うような結果がでなかったらどうしようとか、そんなことを考えると不安になるの。",image8!)
                case 71:
                        return ("だったら練習しても意味ないんじゃないか、とかね。",image8!)
                case 72:
                        return ("＊＊はそういう経験ないの？",image8!)
                case 73:
                        return ("やっぱりあるんだね。でもここまで続けてきた＊＊ならきっとうまくいくよ。",image8!)
                case 74:
                        return ("私も＊＊みたいに頑張る！",image8!)
                case 75:
                        return ("＊＊と話せて良かった。また一緒に帰ろうね。",image8!)
                case 76:
                        return ("あっーー！今日で＊＊初めて努力した日が７６日経ってる。７０日目伝えるの忘れてた。",image8!)
                case 77:
                        return ("私が＊＊の努力した日は数えてるからね！",image8!)
                case 78:
                        return ("言わなくても分かるよ、お疲れ様。",image8!)
                case 79:
                        return ("いつも以上に頑張らなくてもいいからね！いつも通りで。",image8!)
                case 80:
                       return ("８０日経ったよー。いえーい！",image8!)
                case 81:
                        return ("＊＊は結果と過程どっちが大切派？",image8!)
                case 82:
                        return ("私は過程派だな。甘いかな？",image8!)
                case 83:
                        return ("努力しても結果が出ないことはあっても、結果出すやつに努力してない人はいないよ。",image8!)
                case 84:
                        return ("誰かの受け売りだけどね。私もそう思うな",image8!)
                case 85:
                        return ("あせらずに頑張ってね。必ず成功するって信じてるから。",image8!)
                case 86:
                        return ("頑張れ！頑張れ！＊＊",image8!)
                case 87:
                        return ("ちょっと、いつもと違う応援してみたよ（笑）",image8!)
                case 88:
                        return ("眠たい時とかは、無理して頑張るんじゃなくてちょっと仮眠してからするといいよ。",image8!)
                case 89:
                        return ("私はそのまま朝まで寝ちゃうから、向いてない人もるけど。",image8!)
                case 90:
                        return ("９０日経ったよー。半分行きました。残り９０日！",image8!)
                case 91:
                        return ("今日もお疲れ。３ヶ月あっという間だったね。長かった？",image8!)
                case 92:
                        return ("折り返し地点を過ぎたって考えるともうすぐだね。",image8!)
                case 93:
                        return ("なんだかやり終えた＊＊を想像するとワクワクするね。",image8!)
                case 94:
                        return ("最後まで応援するからよろしくね。",image8!)
                case 95:
                        return ("お疲れ、なんだか＊＊毎日が楽しそう。",image8!)
                case 96:
                        return ("クラスの友達も＊＊の顔つきが変わったっていってたよ。",image8!)
                case 97:
                        return ("努力を楽しめる人って本当に素敵だと思うな。",image8!)
                case 98:
                        return ("そういう人は壁にぶち当たっても、それを突破するのが楽しんだろうな。",image8!)
               case 99:
                        return ("私はそんな＊＊を見てるのが楽しいよ。",image8!)
                case 100:
                        return ("おめでとう！１００日目だよ。３桁いきましたね。",image8!)
                case 101:
                        return ("もう続けることは苦にならないよね？",image8!)
                case 102:
                        return ("今日も１日お疲れ様です。",image8!)
                case 103:
                        return("私正直いうとね、一週間で辞めると思っていたんだよ。",image8!)
                case 104:
                        return ("これだけ続けていられるのは本当に＊＊が変わろうと決心しただよ。",image8!)
                case 105:
                        return ("少しは私のお陰もあるかな？",image8!)
                case 106:
                        return ("嘘嘘、全部＊＊の力だよ。私は応援してるだけですから。",image8!)
                case 107:
                        return ("これからも＊＊のこと応援させてね。",image8!)
                case 108:
                        return( "何の得にもならないのにどうして応援してくれるのかって？",image8!)
                case 109:
                        return ("何だか楽しいんだよね。＊＊の成長見てると。",image8!)
                case 110:
                        return ("１１０日経ったよ！あと７０日だよ。",image8!)
                case 111:
                        return ("私ね、一回だけピアノの練習を辞めた時期があるんだ。",image8!)
                case 112:
                        return ("自分より年下で自分より後にピアノを始めたのに、自分よりピアノがうまいこがいてバカらしくなっちゃったの。",image8!)
                case 113:
                        return ("だからピアノはやってるけどなんとなく通っているだけ。そんな時期があったの。",image8!)
                case 114:
                        return ("それで先生に辞めたいって言ったんだ。理由も正直に話した。",image8!)
                case 115:
                        return ("そしたら先生が人と比べるんじゃなくて、昨日の自分を超えることを考えてって。",image8!)
                case 116:
                        return ("人と比べるより、昨日の自分に勝つことができる子が伸びるの。",image8!)
                case 117:
                        return ("どんなに才能があっても、人と比べているだけで満足してたら絶対にどこかで止まる。",image8!)
                case 118:
                        return ("だから、自分に負けないでって言われの。それでもう一度やってみようと思ったんだ。",image8!)
                case 119:
                        return ("なんでこんな話したんだろう？＊＊は毎日頑張っているのに。",image8!)
                case 120:
                        return ("ごめんね。ちょっと嫉妬しちゃったんだ。毎日目標に向けて突っ走る＊＊を見て。",image8!)
                case 121:
                        return ("あっ、ごめん。昨日で１２０日目だった。今日が１２１日目！",image8!)
                case 122:
                        return ("もし私みたいに、辞めたい時期がきたら私に相談してくれると嬉しいな。",image8!)
                case 123:
                        return ("でもこれは、その…＊＊のこと挫折するって疑っているわけじゃないからね。",image8!)
                case 124:
                        return ("絶対に成功するって分かってるから。ちょっとだけ私の気持ちも知って欲しかっただけ。",image8!)
                case 125:
                        return ("変なこと言ってごめんね。また明日からも頑張ろー！",image8!)
                case 126:
                        return ("お疲れ様。一緒に帰ろ。",image8!)
                case 127:
                        return ("いえい！相変わらず絶好調だね。",image8!)
                case 128:
                        return( "人生のターニングポイントはいつですか？ふふ。将来絶対聞かれるよ。",image8!)
                case 129:
                        return ("お疲れ様。ルーティン化されてきて、やらない日がほとんどなくなったね。",image8!)
                case 130:
                        return ("１３０日達成だよ！あと５０日。",image8!)
                case 131:
                        return ("ここから先がファイトだよ！意外と前半頑張りすぎて後半しぼんできちゃう人もいるから。",image8!)
                case 132:
                        return ("お疲れ様。毎日頑張りすぎないように頑張ろうね笑",image8!)
                case 133:
                        return ("すごいよ＊＊。本当にすごい。",image8!)
                case 134:
                        return ("お疲れ様。今日も頑張りすぎてない？",image8!)
                case 135:
                        return ("友達が＊＊のこと最近かっこいいって言ってたよ。",image8!)
                case 136:
                        return ("えっ？私は＊＊のことかっこいいと思わないのかって？",image8!)
                case 137:
                        return ("へへ。保留です。",image8!)
                case 138:
                        return ("最後までやり遂げたらかっこいいかな？",image8!)
                case 139:
                        return ("もう心配無用だね。このままゴールまであと一息だよ",image8!)
                case 140:
                        return ("１４０日達成！！後４０日だよ。",image8!)
                case 141:
                        return ("これならゴールを半年じゃなくて１年でもいけそうだね。伸ばす？",image8!)
                case 142:
                        return ("冗談だよ。半年の目標を終わらせてから次は考えよ。",image8!)
                case 143:
                        return ("ねー。＊＊は好きな人とかいるの？",image8!)
                case 144:
                        return ("えっ。いいじゃん。聞いたって。",image8!)
                case 145:
                        return ("逆に私はどうかって？うーん。いるよ。",image8!)
                case 146:
                        return ("へへ、誰かは秘密。そのうち教えてあげてもいいけど、今は恥ずかしいな。",image8!)
                case 147:
                        return ("そのうちっていつかって？うーん。",image8!)
                case 148:
                        return ("目標の１８０日達成したらかな。",image8!)
                case 149:
                        return ("って＊＊が好きな人いるか聞いてない！",image8!)
                case 150:
                        return ("１５０日達成したよ。ラスト３０日！",image8!)
               case 151:
                        return ("いよいよカウントダウンだね。長かったような、短かったような。",image8!)
                case 152:
                        return ("今日もお疲れ様。風引かないようにゆっくりしてね。",image8!)
                case 153:
                        return ("お疲れ様、気を緩めずに行こうね。",image8!)
                case 154:
                        return ("季節もすっかり変わっちゃったけどまだまだ行くよ！",image8!)
                case 155:
                        return( "今日もお疲れ様！このセリフ何回ぐらい言ったんだろう？",image8!)
                case 156:
                        return ("あとちょっとでお疲れ様って言えなくなっちゃうの寂しいな。",image8!)
                case 157:
                        return ("最初は＊＊のことバカにしてる人もいたけど、もうみんな応援してるよ。",image8!)
                case 158:
                        return ("私は最初からバカになんかしてないからね。",image8!)
                case 159:
                        return ("続かないとはちょっとだけ思ってたかも笑",image8!)
                case 160:
                        return ("１６０日達成。あと２０日。ゴールが見えてきたね。",image8!)
                case 161:
                        return ("なんだか＊＊か遠い存在の人になってきちゃったな。",image8!)
                case 162:
                        return ("最後までいっても応援し続けるからね。",image8!)
                case 163:
                        return ("すごいよ。もうゴールが近いのにどんどん集中力上がってきてるね。",image8!)
                case 164:
                        return ("今日もお疲れ様！最後の最後までこのまま駆け抜けて。",image8!)
                case 165:
                        return ("ここだけの話、＊＊の努力する姿見てると私の方が励みになっているんだよ。",image8!)
                case 166:
                        return ("あっ、そういえば私ねピアノのコンクールで金賞とったよ!",image8!)
                case 167:
                        return( "＊＊の頑張る姿見るたびに私も頑張ってたんだよ。褒めて。",image8!)
                case 168:
                        return ("自分より努力してる人に褒められると、嬉しいな。",image8!)
                case 169:
                        return( "そういえば覚えてる？ゴールになったら私の好きな人いう話？",image8!)
                case 170:
                        return ("１７０日達成！ラスト１０日だよーー！",image8!)
                case 171:
                        return ("ラスト９日！体調崩さないようにね！",image8!)
                case 172:
                        return ("ラスト８日！＊＊の応援できて本当によかった。",image8!)
                case 173:
                        return ("ラスト７日！もう少しだよ。",image8!)
                case 174:
                        return ("ラスト６日！あー！楽しかった時間が終わっちゃうね。",image8!)
                case 175:
                     return ("ラスト５日！お疲れ様。良かったら一緒に帰ろ？",image8!)
                case 176:
                       return ("ラスト４日！お疲れ様。本当に＊＊のこと尊敬してるよ。",image8!)
                case 177:
                       return ("ラスト３日！いよいよだね。なんだか分かんないけど泣けてきた。",image8!)
               case 178:
                       return ("ラスト２日！ヘイ、ヘイ^^",image8!)
               case 179:
                       return ("ラスト１日！本当にお疲れ様！私に素敵な体験さえてくれてありがとう。",image8!)
                case 180:
                       return ("おめでとう。＊＊のことが大好きです。良かったら付き合ってください。",image8!)
                        
                default:
                        return ("上限",image3!)
                }
        }
        
        func  badOfLabel()->(String, UIImage){
                if currentTotalPoint <= 5 {
                        switch currentTotalbadPoint {
                                case 0 :  //エラーでる
                                return ("",image8!)
                                
                        case 1:
                                return ("もう諦めたの？",image2!)
                                
                        case 2:
                                return ("諦めるの早！",image2!)
                        case 3:
                                return ("ないわ〜",image2!)
                        case 4:
                                return ("くずですね",image2!)
                        case 5:
                                
                                return ("…",image2!)
                        default:
                                return ("バイバイ",image2!)
                        }
                }
                else if currentTotalPoint  > 5 && currentTotalPoint <= 20{
                        switch currentTotalbadPoint {
                        case 1:
                                return ("どんまい。そんな時もあるよ",image2!)
                                
                        case 2:
                                return ("気にしない気にしない",image2!)
                        case 3:
                                return ("体調悪いの〜?",image2!)
                        case 4:
                                return ("明日は頑張ろうね",image2!)
                        case 5:
                                return ("もしかして辞めようとしてる？",image2!)
                        case 6:
                                return ("まあ、そんなもんだと思ったよ。",image2!)
                        case 7:
                                return ("もう一回頑張ったら？",image2!)
                        case 8:
                                return ("本当に辞めるの？",image2!)
                        case 9:
                                return ("まあしょうがないよね",image2!)
                        case 10:
                                return ("幻滅です",image2!)
                        case 11:
                                return ("幻滅だわ",image2!)
                        case 12:
                                return ("最低",image2!)
                        case 13:
                                return ("嫌い",image2!)
                        case 14:
                                return ("近寄らないで",image2!)
                        case 15:
                                return ("…",image2!)
                                
                        default:
                                return ("バイバイ",image2!)
                        }
                        
                }else if currentTotalPoint  > 21 && currentTotalPoint <= 50{
                           switch currentTotalbadPoint {
                          
                           case 1:
                                return ("今日はゆっくりしてね",image2!)
                                
                           case 2:
                                return ("気にしない気にしない",image2!)
                           case 3:
                                return ("そんな時だってあるよ！",image2!)
                           case 4:
                                return ("〇〇も休むことあるんだね",image2!)
                           case 5:
                                return ("疲れていたんだよ。だから大丈夫",image2!)
                           case 6:
                                return ("明日やればいいさー！",image2!)
                           case 7:
                                return ("誰だってできない時はあるよね",image2!)
                           case 8:
                                return ("まだまだ全然大丈夫。明日取り戻そ！",image2!)
                           case 9:
                                return( "疲れちゃった？そんな日もあっていいいと思うよ",image2!)
                           case 10:
                                return ("私は信じてるから諦めないでね",image2!)
                           case 11:
                                return ("〇〇なら絶対やり遂げられるよ。",image2!)
                           case 12:
                                return ("頑張って5分だけやってみると意外とそこからやり続けちゃうんだよ",image2!)
                           case 13:
                                return ("どんまい。そんな日もあるよ",image2!)
                           case 14:
                                return ("今日できなかったことよりも、明日は再開することが大事だよ",image2!)
                           case 15:
                                return( "大丈夫！全てが計画通りにいく人なんていないと思うよ",image2!)
                          case 16:
                                return ("諦めてないよね？諦めるなんて絶対嫌だからね",image2!)
                                
                           case 17:
                                return ("ちょっとペースダウンしてない？大丈夫？",image2!)
                           case 18:
                                return ("ファイト！始めた時の〇〇の目は本気だったよ、もう一回頑張ろ",image2!)
                           case 19:
                                return ("今日はたまたまだよね？",image2!)
                           case 20:
                                return ("もしかして辞めようとしてる？",image2!)
                           case 21:
                                return ("まあ、そんなもんだと思ったよ。",image2!)
                           case 22:
                                return ("もう一回頑張ったら？",image2!)
                           case 23:
                                return ("本当に辞めるの？",image2!)
                           case 24:
                                return ("それで納得できるの？",image2!)
                           case 25:
                                return ("最後までやりとげる〇〇見たかった...",image2!)
                           case 26:
                                return ("お疲れ様",image2!)
                           case 27:
                                return ("〇〇の好きにしたら良いと思うよ",image2!)
                           case 28:
                                return ("それで納得できるの",image2!)
                           case 29:
                                return ("まあそんなもんだと思ったよ",image2!)
                           case 30:
                                return( "そうやっていつも逃げてばかりなんだから",image2!)
                           case 31:
                                return ("〇〇のバカ",image2!)
                           case 32:
                                return ("最低",image2!)
                           case 33:
                                return( "嫌い",image2!)
                           case 34:
                                return ("近寄らないで",image2!)
                           case 35:
                                return ("…",image2!)

                           default:
                return ("バイバイ",image2!)
                        
                        }
                }else if currentTotalPoint  > 51 && currentTotalPoint <= 100{
                        switch currentTotalbadPoint {
                                
                        case 1:
                                return ("今日はゆっくりしてね",image2!)
                                
                        case 2:
                                return ("気にしない気にしない",image2!)
                        case 3:
                                return ("そんな時だってあるよ！",image2!)
                        case 4:
                                return ("〇〇も休むことあるんだね",image2!)
                        case 5:
                                return( "疲れていたんだよ。だから大丈夫",image2!)
                        case 6:
                                return ("明日やればいいさー！",image2!)
                        case 7:
                                return ("誰だってできない時はあるよね",image2!)
                        case 8:
                                return ("まだまだ全然大丈夫。明日取り戻そ！",image2!)
                        case 9:
                                return ("疲れちゃった？そんな日もあっていいいと思うよ",image2!)
                        case 10:
                                return( "私は信じてるから諦めないでね",image2!)
                        case 11:
                                return ("〇〇なら絶対やり遂げられるよ。",image2!)
                        case 12:
                                return ("頑張って5分だけやってみると意外とそこからやり続けちゃうんだよ",image2!)
                        case 13:
                                return ("どんまい。そんな日もあるよ",image2!)
                        case 14:
                                return ("今日できなかったことよりも、明日再開することが大事だよ",image2!)
                        case 15:
                                return ("人間なんだからたまにはさぼらなくっちゃw",image2!)
                        case 16:
                                return ("毎日続けるって難しいよね、分かるよ",image2!)
                                
                        case 17:
                                return( "たまにはサボりたくなっちゃうよね。明日頑張ろ！",image2!)
                        case 18:
                                return ("息抜きも大事だから気にしないでね",image2!)
                        case 19:
                                return ("フレーフレー〇〇！",image2!)
                        case 20:
                                return ("まだまだこれからだよ、ファイト",image2!)
                        case 21:
                                return ("目標を小刻みに決めると達成しやすいよ",image2!)
                        case 22:
                                return ("まだまだだよ、挽回しよ",image2!)
                        case 23:
                                return ("今が踏ん張り時だから一緒に頑張ろ",image2!)
                        case 24:
                                return ("少しでも頑張れたなら「達成できた」って押してもいいと思うよ",image2!)
                        case 25:
                                return ("今日は疲れちゃったね。おやすみなさい",image2!)
                        case 26:
                                return ("達成できた〇〇の顔が見たいから明日は頑張ってね",image2!)
                        case 27:
                                return ("サボったことがない人間なんて絶対いないから大丈夫だよ",image2!)
                        case 28:
                                return ("youtube見てたんでしょ？",image2!)
                        case 29:
                                return ("毎日続けるって意外と難しいよね。でも○○はできるよ",image2!)
                        case 30:
                                return ("ちょっとサボりぐせでてきたぞー、ファイトだよ",image2!)
                        case 31:
                                return ("急用が入った時とかは「本日はお休み」を押してくれていいからね",image2!)
                        case 32:
                                return ("絶対、絶対諦めちゃダメだから",image2!)
                        case 33:
                                return ("〇〇ができなかった時は私も辛いんだよ",image2!)
                        case 34:
                                return ("そんな日もあるさー！。今日のことは忘れて",image2!)
                        case 35:
                                return("大丈夫？最近辛くない？",image2!)
                        case 36:
                                return ("まだあれだよね、想定内の範囲だよね？",image2!)
                        case 37:
                                return ("結果も大事だけど、今は過程が大事だよ！ファイト！",image2!)
                        case 38:
                                return ("次サボったら、罰としてジュースおごってもらうよ",image2!)
                        case 39:
                                return ("ジュースごちそうさまです",image2!)
                        case 40:
                                return ("次は何奢ってもらおうかな？...冗談だよ",image2!)
                        case 41:
                                return ("努力は楽しんだ方が勝ちだよ。ほら笑って ",image2!)
                        case 42:
                                return ("明日はやるんだよ！",image2!)
                        case 43:
                                return ("ちょっと〜。２日に１回はさぼってるよ。気を入れ直して！",image2!)
                        case 44:
                                return ("大分ペースダウンしてない？大丈夫",image2!)
                        case 45:
                                return ("大丈夫！全てが計画通りにいく人なんていないと思うよ",image2!)
                        case 46:
                                return ("少しでも頑張れたなら達成できたって押してもいいと思うよ",image2!)
                                
                        case 47:
                                return ("辛い時は音楽とか聞くといいよ！",image2!)
                        case 48:
                                return ("諦めてないよね？諦めるなんて絶対嫌だからね",image2!)
                        case 49:
                                return ("ファイト！始めた時の〇〇の目は本気だったよ、もう一回がんばろ",image2!)
                        case 50:
                                return ("もう辛いの？",image2!)
                        case 51:
                                return ("もしかして辞めようとしてる？",image2!)
                        case 52:
                                return ("根性よ！〇〇根性！",image2!)
                        case 53:
                                return ("もう一回頑張ったら？",image2!)
                        case 54:
                                return ("本当に辞めるの？",image2!)
                        case 55:
                                return ("それで納得できるの？",image2!)
                        case 56:
                                return ("最後までやりとげる〇〇見たかった...",image2!)
                        case 57:
                                return( "そうやっていつも逃げてばかりなんだから",image2!)
                        case 58:
                                return ("〇〇のバカ",image2!)
                        case 59:
                                return ("最低",image2!)
                        case 60:
                                return ("嫌い",image2!)
                        case 61:
                                return ("近寄らないで",image2!)
                        case 62:
                                return ("...",image2!)
                      
                        default:
                                return ("バイバイ",image2!)
                        
                        
                        }
                        
                
        }else if currentTotalPoint  > 101 && currentTotalPoint <= 180{
        switch currentTotalbadPoint {
        
        case 1:
        return ("よく今までサボらなかったね。尊敬します",image2!)
        
        case 2:
        return ("気にしない気にしない",image2!)
        case 3:
        return ("そんな時だってあるよ！",image2!)
        case 4:
        return ("〇〇も休むことあるんだね。",image2!)
        case 5:
        return( "疲れていたんだよ。だから大丈夫。",image2!)
        case 6:
        return ("明日やればいいさー！",image2!)
        case 7:
        return ("誰だってできない時はあるよね。",image2!)
        case 8:
        return ( "まだまだ全然大丈夫。明日取り戻そ！",image2!)
        case 9:
        return ("疲れちゃった？そんな日もあっていいいと思うよ",image2!)
        case 10:
        return ("順調だね！全然問題ないよ。",image2!)
        case 11:
        return ("たまにはサボらないと壊れちゃうよ",image2!)
        case 12:
        return ("こんなに頑張ってるんだから少しくらい気にしないで。",image2!)
        case 13:
        return ("どんまい。そんな日もあるよ。",image2!)
        case 14:
        return ("今日できなかったことよりも、明日再開することが大事だよ。" ,image2!)
        case 15:
        return ("人間なんだからたまにはさぼらなくっちゃw",image2!)
        case 16:
        return ("毎日続けるって難しいよね、分かるよ。",image2!)
        
        case 17:
        return ("たまにはサボりたくなっちゃうよね。明日頑張ろ！",image2!)
        case 18:
        return( "息抜きも大事だから気にしないでね。",image2!)
        case 19:
        return ("フレーフレー〇〇！",image2!)
        case 20:
        return ("まだまだこれからだよ、ファイト。",image2!)
        case 21:
        return ("目標を小刻みに決めると達成しやすいよ。",image2!)
        case 22:
        return ("まだまだだよ、挽回しよ。",image2!)
        case 23:
        return ("今が踏ん張り時だから一緒に頑張ろ。",image2!)
        case 24:
        return ("少しでも頑張れたなら「達成できた」って押してもいいと思うよ。",image2!)
        case 25:
        return ("今日は疲れちゃったね。おやすみなさい。",image2!)
        case 26:
        return ("達成できた〇〇の顔が見たいから明日は頑張ってね。",image2!)
        case 27:
        return ("サボったことがない人間なんて絶対いないから大丈夫だよ。",image2!)
        case 28:
        return ("youtube見てたんでしょ？",image2!)
        case 29:
        return ("毎日続けるって意外と難しいよね。でも○○はできるよ。",image2!)
        case 30:
        return ("ちょっとサボりぐせでてきたぞー、ファイトだよ。",image2!)
        case 31:
        return ("急用が入った時とかは「本日はお休み」を押してくれていいからね。",image2!)
        case 32:
        return ("絶対、絶対諦めちゃダメだから。", image2!)
        case 33:
        return ("〇〇ができなかった時は私も辛いんだよ。",image2!)
        case 34:
        return ("そんな日もあるさー！。今日のことは忘れて。",image2!)
        case 35:
        return ("毎日続けるなんて辛いから、たまにはさぼらないと笑",image2!)
        case 36:
        return( "まだあれだよね、想定内の範囲だよね？",image2!)
        case 37:
        return ("結果も大事だけど、今は過程が大事だよ！ファイト！",image2!)
        case 38:
        return( "次サボったら、罰としてジュースおごってもらうよ。",image2!)
        case 39:
        return( "ジュースごちそうさまです。",image2!)
        case 40:
        return ("次は何奢ってもらおうかな？...冗談だよ。",image2!)
        case 41:
        return ("努力は楽しんだ方が勝ちだよ。ほら笑って ",image2!)
        case 42:
        return ("明日はやるんだよ！",image2!)
        case 43:
        return ("ちょっと〜。２日に１回はさぼってるよ。気を入れ直して！",image2!)
        case 44:
        return ("大分ペースダウンしてない？大丈夫？",image2!)
        case 45:
        return ("大丈夫！全てが計画通りにいく人なんていないと思うよ。",image2!)
        case 46:
        return ("少しでも頑張れたなら達成できたって押してもいいと思うよ。",image2!)
        
        case 47:
        return ("辛い時は音楽とか聞くといいよ！",image2!)
        case 48:
                return ("私は信じてるから諦めないでね。",image2!)
        case 49:
                return ("〇〇なら絶対やり遂げられるよ。",image2!)
        case 50:
                return ("頑張って5分だけやってみると意外とそこからやり続けちゃうんだよ",image2!)
        case 51:
                return ("大丈夫？最近辛くない？",image2!)
        case 52:
                return ("せっかく３ヶ月以上頑張ったんだから正念場だよ。",image2!)
        case 53:
                return ("〇〇は努力がしたくてたまらなくなーる、おまじないだよ",image2!)
        case 54:
                return ("まだまだ諦めてないよね？",image2!)
        case 55:
                return ("〇〇の夢絶対叶えてね。",image2!)
        case 56:
                return ("最近頑張りすぎて疲れちゃったね。明日がんばろ。",image2!)
                
        case 57:
                return ("努力する前のルーティンを見つけると、スッと行動に移せるみたいだよ。",image2!)
        case 58:
                return ("分かったよ。気を取り直して明日だね。",image2!)
        case 59:
                return ("SNSばかり見てちゃだめだよ",image2!)
        case 60:
                return ("辛いのは分かるけど一緒に頑張ろう",image2!)
        case 61:
                return ("サボりぐせつけちゃダメだよ",image2!)
        case 62:
                return ("頑張ってだしんよー！えへ。",image2!)
        case 63:
                return ("ここで諦めたら絶対にもったいないよ。",image2!)
        case 64:
                return("ファイトだよ！本当にファイト！",image2!)
        case 65:
                return ("努力を始める前のルーティンを見つけると、スッと行動に移せるみたいだよ。",image2!)
        case 66:
                return ("ざぜんを組むなんてどうかな？",image2!)
        case 67:
                return ("ストレッチをするとかも良いかも",image2!)
        case 68:
                return ("やめたいって思うのはみんなあるけど、そこでやめないことで成長できると思うよ。",image2!)
        case 69:
                return ("１日のノルマを少なくして、毎日達成できた実感を得る作戦にしてもいいかも。",image2!)
        case 70:
                return ("こんなところで止まっちゃダメだよ。突き抜けて。",image2!)
        case 71:
                return ("辛い時は息抜きも大事だよ",image2!)
        case 72:
                return ("大丈夫？相談にのろうか？",image2!)
        case 73:
                return ("辛いのは分かるよ。でもここまできたんだからラストスパート頑張ろ！",image2!)
        case 74:
                return ("絶対に最後までやり遂げよう。妥協しちゃダメだよ",image2!)
        case 75:
                return( "気にしないで、リセットして次回は絶対やろう。",image2!)
        case 76:
                return ("ファイトファイト！",image2!)
        case 77:
                return ("〇〇なら絶対にできるよ！",image2!)
        case 78:
                return ("目標を達成した時の喜びを想像して...やりたくなってきた？",image2!)
        case 79:
                return ("ここまできたら月に変わって諦めさせないよ。",image2!)
        case 80:
                return ("あとちょっとだから、負けないで",image2!)
        case 81:
                return (" ここまできたら己との勝負だよ",image2!)
        case 82:
                return ("少しでも頑張れたなら「達成できたボタン」を押すのもいいと思うよ",image2!)
        case 83:
                return( "辛くない？大丈夫？",image2!)
        case 84:
                return ("あとちょっとじゃん！正念場だよ。",image2!)
        case 85:
                return ("〇〇なら絶対いけるって",image2!)
        case 86:
                return ("私が言うんだから絶対いける！",image2!)
        case 87:
                return ("〇〇は諦めないって私信じてるから",image2!)
        case 88:
        return( "諦めてないよね？諦めるなんて絶対嫌だからね",image2!)
        case 89:
        return ("ファイト！始めた時の〇〇の目は本気だったよ、もう一回がんばろ",image2!)
        case 90:
        return ("やっぱり...辛いの？",image2!)
        case 91:
        return ("もしかして辞めようとしてる？",image2!)
        case 92:
        return( "根性よ！〇〇根性！",image2!)
        case 93:
        return ("もう一回頑張ったら？",image2!)
        case 94:
        return ("本当に辞めるの？",image2!)
        case 95:
        return ("それで納得できるの？",image2!)
        case 96:
        return ("最後までやりとげる〇〇見たかった...",image2!)
        case 97:
        return ("そうやっていつも逃げてばかりなんだから",image2!)
        case 98:
        return ("〇〇のバカ",image2!)
        case 99:
        return ("最低",image2!)
        case 100:
        return ("嫌い",image2!)
        case 101:
        return ("近寄らないで",image2!)
        case 102:
        return ("...",image2!)
        
        

        default:
        return ("バイバイ",image2!)
        
        

                
        }
        
        }
                        
                else {
                        return("バイバイ",image2!)
                }
                
        }
        
        
}
