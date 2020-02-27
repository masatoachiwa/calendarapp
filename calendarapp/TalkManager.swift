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
      
        var dayArray: [String] = ["りんご"]
        var baddayArray: [String] = []
        var restdayArray: [String] = []
        
        
        
        
        func date(abcd:String){ //yymmddの追加と値の保存

                dayArray =  (UserDefaults.standard.array(forKey: {"dayArray"}())as? [String])!
                dayArray.append(abcd)
                
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
        
        
        func numberOfLabel() -> String {
                switch currentTotalPoint {
                case 0:
                        return "これから頑張ろう。"
                case 1:
                        return "聞いたよー。〇〇始めたんだってね？何日続くんだろうね？（笑"
                case 2:
                        return "やるじゃん！絶対やめたと思った。"
                case 3:
                        return "3日続いたね。エライ！"
                case 4:
                        return "そろそろ飽きたころでしょ？"
                case 5:
                        return "最近雨が多いのは＊＊のせいかな？"
                case 6:
                        return "〇〇続いているみたいだね。頑張って。"
                case 7:
                        return "一週間もったね。応援してるよ。"
                case 8:
                        return "今日も〇〇してたんだね。お疲れ様。"
                case 9:
                        return "＊＊お疲れ様。はい、ジュース。"
                case 10:
                        return "10日目達成だね。ちょっと見直したな。"
                case 11:
                        return "ここまできたら諦めたらだめだよ"
                case 12:
                        return "最近頑張ってるね。感心、感心（笑）"
                case 13:
                        return "頑張るのもいいけど、たまには息抜きも必要だよ。"
                case 14:
                        return "二週間経ったね。ちょっと尊敬するかも。"
                case 15:
                        return "目標は高く半年続けることね！"
                case 16:
                        return "私も〇〇やろうかなー？"
                case 17:
                        return "あー、結局〇〇やってない。私は小さい頃からピアノずっと続けれてるからいいの。"
                case 18:
                        return "お疲れ様。今日も飽きずに〇〇してるね。"
                case 19:
                        return "最近＊＊が頑張っても雨降らなくなったね。"
                case 20:
                        return "２０日達成したよー。へい、へい。"
                case 21:
                        return "もうすぐ１ヶ月だねー。しみじみだね。"
                case 22:
                        return "＊＊が頑張ってると、なんだか私も頑張らなきゃって思うよ。"
                case 23:
                        return "焦らずに行こうね。急がば回れだよ。"
                case 24:
                        return "さっき友達に＊＊のこと話したら褒めてたよ。"
                case 25:
                        return "今日も頑張ったんだね。飛ばしすぎちゃだめだよ。"
                case 26:
                        return "疲れ溜まってない？大丈夫？"
                case 27:
                        return "お疲れ、昨日は何時まで○○してたの？"
                case 28:
                        return "＊＊の努力が早く実るといいね"
                case 29:
                        return "えへへ。安定の努力家ですね！"
                case 30:
                        return "30日経ったよ！これから苦しくなるかもしれないけど応援してるから！"
                case 31:
                        return "まだまだこれからだよ！"
                case 32:
                        return "やっぱり努力してる人って素敵だな。"
                case 33:
                        return "もうすぐ定期試験だね。二足のわらじも大変だけど頑張ろ。"
                case 34:
                        return "やっぱり両立って難しいよね。できる＊＊のこと尊敬するなー。"
                case 35:
                        return "昨日は疲れて全然勉強できなかったー。＊＊と違って私だめだなー。"
                case 36:
                        return "テストできた？"
                case 37:
                        return "テスト終わったね。また〇〇頑張ろー！"
                case 38:
                        return "＊＊、〇〇始める頃よりもテストの点あがってない？"
                case 39:
                        return "一つのことを努力する習慣がつくと、他のこともできるようになるのかな？"
                case 40:
                        return "クラスメートも〇〇が変わったことに気がつきはじめたかもね。"
                case 41:
                        return "私は最初から〇〇がやればできるって知ってたよ。"
                case 42:
                        return "お疲れ、〇〇の集中力を分けて欲しいよ。"
                case 43:
                        return "たまには休息もとらないとダメだよ。"
                case 44:
                        return "＊は彼女いないの？"
                case 45:
                        return "いないんだー。ごめん、変なこときいて。"
                case 46:
                        return "今は〇〇を頑張ってるからいらないよね。"
                case 47:
                        return "あっ、もうすぐ５０日だよ。ファイトー！"
                case 48:
                        return "お疲れ！ちゃんと息抜きしてる？"
                case 49:
                        return "感心、感心"
                case 50:
                        return "５０日ー！おめでとー！"
                case 51:
                        return "とりあえず半年は頑張って！私にできることは協力するから。"
                case 52:
                        return "後１３０日！道のりは長いよ！"
                case 53:
                        return "＊＊なら絶対できるよ！"
                case 54:
                        return "もう〇〇しないと気持ち悪いんじゃない？"
                case 55:
                        return "私も＊＊が○○してないって聞くと、体調悪いの？って思うようになっちゃった。"
                case 56:
                        return "なんだか＊＊が頑張ってる姿見ると私も嬉しくなっちゃう。"
                case 57:
                        return "今日も頑張ったね！私もピアノの練習頑張らなくっちゃ"
                case 58:
                        return "今度私にも○○教えて欲しいなー。"
                case 59:
                        return "やりすぎは体に毒だから、飛ばしすぎないでね。"
                case 60:
                        return "６０日できたね。３分の１終わったよ！"
                case 61:
                        return "お疲れ！ねえ、＊＊はなんで〇〇を始めたの？"
                case 62:
                        return "みんなそれぞれいろんな理由があるけど、頑張っている人はかっこいいと思うよ。"
                case 63:
                        return "だから、＊＊も今かっこいいよ。"
                case 64:
                        return "照れてるのー？"
                case 65:
                        return "その表情マルですね。"
                case 66:
                        return "今これ流行ってるんだよ。＊＊は毎日頑張ってるから知らないかもね。"
                case 67:
                        return "お疲れ様。良かったら一緒に帰ろ。"
                case 68:
                        return "私ね、最近＊＊の影響なのかピアノの練習が前より楽しいんだ。"
                case 69:
                        return "類は友を呼ぶっていうからかな、＊＊見てると私も頑張らなくちゃって思うの。"
                case 70:
                        return "でも思うような結果がでなかったらどうしようとか、そんなことを考えると不安になるの。"
                case 71:
                        return "だったら練習しても意味ないんじゃないか、とかね。"
                case 72:
                        return "＊＊はそういう経験ないの？"
                case 73:
                        return "やっぱりあるんだね。でもここまで続けてきた＊＊ならきっとうまくいくよ。"
                case 74:
                        return "私も＊＊みたいに頑張る！"
                case 75:
                        return "＊＊と話せて良かった。また一緒に帰ろうね。"
                case 76:
                        return "あっーー！今日で＊＊初めて努力した日が７６日経ってる。７０日目伝えるの忘れてた。"
                case 77:
                        return "私が＊＊の努力した日は数えてるからね！"
                case 78:
                        return "言わなくても分かるよ、お疲れ様。"
                case 79:
                        return "いつも以上に頑張らなくてもいいからね！いつも通りで。"
                case 80:
                        return "８０日経ったよー。いえーい！"
                case 81:
                        return "＊＊は結果と過程どっちが大切派？"
                case 82:
                        return "私は過程派だな。甘いかな？"
                case 83:
                        return "努力しても結果が出ないことはあっても、結果出すやつに努力してない人はいないよ。"
                case 84:
                        return "誰かの受け売りだけどね。私もそう思うな"
                case 85:
                        return "あせらずに頑張ってね。必ず成功するって信じてるから。"
                case 86:
                        return "頑張れ！頑張れ！＊＊"
                case 87:
                        return "ちょっと、いつもと違う応援してみたよ（笑）"
                case 88:
                        return "眠たい時とかは、無理して頑張るんじゃなくてちょっと仮眠してからするといいよ。"
                case 89:
                        return "私はそのまま朝まで寝ちゃうから、向いてない人もるけど。"
                case 90:
                        return "９０日経ったよー。半分行きました。残り９０日！"
                case 91:
                        return "今日もお疲れ。３ヶ月あっという間だったね。長かった？"
                case 92:
                        return "折り返し地点を過ぎたって考えるともうすぐだね。"
                case 93:
                        return "なんだかやり終えた＊＊を想像するとワクワクするね。"
                case 94:
                        return "最後まで応援するからよろしくね。"
                case 95:
                        return "お疲れ、なんだか＊＊毎日が楽しそう。"
                case 96:
                        return "クラスの友達も＊＊の顔つきが変わったっていってたよ。"
                case 97:
                        return "努力を楽しめる人って本当に素敵だと思うな。"
                case 98:
                        return "そういう人は壁にぶち当たっても、それを突破するのが楽しんだろうな。"
                case 99:
                        return "私はそんな＊＊を見てるのが楽しいよ。"
                case 100:
                        return "おめでとう！１００日目だよ。３桁いきましたね。"
                case 101:
                        return "もう続けることは苦にならないよね？"
                case 102:
                        return "今日も１日お疲れ様です。"
                case 103:
                        return "私正直いうとね、一週間で辞めると思っていたんだよ。"
                case 104:
                        return "これだけ続けていられるのは本当に＊＊が変わろうと決心しただよ。"
                case 105:
                        return "少しは私のお陰もあるかな？"
                case 106:
                        return "嘘嘘、全部＊＊の力だよ。私は応援してるだけですから。"
                case 107:
                        return "これからも＊＊のこと応援させてね。"
                case 108:
                        return "何の得にもならないのにどうして応援してくれるのかって？"
                case 109:
                        return "何だか楽しいんだよね。＊＊の成長見てると。"
                case 110:
                        return "１１０日経ったよ！あと７０日だよ。"
                case 111:
                        return "私ね、一回だけピアノの練習を辞めた時期があるんだ。"
                case 112:
                        return "自分より年下で自分より後にピアノを始めたのに、自分よりピアノがうまいこがいてバカらしくなっちゃったの。"
                case 113:
                        return "だからピアノはやってるけどなんとなく通っているだけ。そんな時期があったの。"
                case 114:
                        return "それで先生に辞めたいって言ったんだ。理由も正直に話した。"
                case 115:
                        return "そしたら先生が人と比べるんじゃなくて、昨日の自分を超えることを考えてって。"
                case 116:
                        return "人と比べるより、昨日の自分に勝つことができる子が伸びるの。"
                case 117:
                        return "どんなに才能があっても、人と比べているだけで満足してたら絶対にどこかで止まる。"
                case 118:
                        return "だから、自分に負けないでって言われの。それでもう一度やってみようと思ったんだ。"
                case 119:
                        return "なんでこんな話したんだろう？＊＊は毎日頑張っているのに。"
                case 120:
                        return "ごめんね。ちょっと嫉妬しちゃったんだ。毎日目標に向けて突っ走る＊＊を見て。"
                case 121:
                        return "あっ、ごめん。昨日で１２０日目だった。今日が１２１日目！"
                case 122:
                        return "もし私みたいに、辞めたい時期がきたら私に相談してくれると嬉しいな。"
                case 123:
                        return "でもこれは、その…＊＊のこと挫折するって疑っているわけじゃないからね。"
                case 124:
                        return "絶対に成功するって分かってるから。ちょっとだけ私の気持ちも知って欲しかっただけ。"
                case 125:
                        return "変なこと言ってごめんね。また明日からも頑張ろー！"
                case 126:
                        return "お疲れ様。一緒に帰ろ。"
                case 127:
                        return "いえい！相変わらず絶好調だね。"
                case 128:
                        return "人生のターニングポイントはいつですか？ふふ。将来絶対聞かれるよ。"
                case 129:
                        return "お疲れ様。ルーティン化されてきて、やらない日がほとんどなくなったね。"
                case 130:
                        return "１３０日達成だよ！あと５０日。"
                case 131:
                        return "ここから先がファイトだよ！意外と前半頑張りすぎて後半しぼんできちゃう人もいるから。"
                case 132:
                        return "お疲れ様。毎日頑張りすぎないように頑張ろうね笑"
                case 133:
                        return "すごいよ＊＊。本当にすごい。"
                case 134:
                        return "お疲れ様。今日も頑張りすぎてない？"
                case 135:
                        return "友達が＊＊のこと最近かっこいいって言ってたよ。"
                case 136:
                        return "えっ？私は＊＊のことかっこいいと思わないのかって？"
                case 137:
                        return "へへ。保留です。"
                case 138:
                        return "最後までやり遂げたらかっこいいかな？"
                case 139:
                        return "もう心配無用だね。このままゴールまであと一息だよ"
                case 140:
                        return "１４０日達成！！後４０日だよ。"
                case 141:
                        return "これならゴールを半年じゃなくて１年でもいけそうだね。伸ばす？"
                case 142:
                        return "冗談だよ。半年の目標を終わらせてから次は考えよ。"
                case 143:
                        return "ねー。＊＊は好きな人とかいるの？"
                case 144:
                        return "えっ。いいじゃん。聞いたって。"
                case 145:
                        return "逆に私はどうかって？うーん。いるよ。"
                case 146:
                        return "へへ、誰かは秘密。そのうち教えてあげてもいいけど、今は恥ずかしいな。"
                case 147:
                        return "そのうちっていつかって？うーん。"
                case 148:
                        return "目標の１８０日達成したらかな。"
                case 149:
                        return "って＊＊が好きな人いるか聞いてない！"
                case 150:
                        return "１５０日達成したよ。ラスト３０日！"
                case 151:
                        return "いよいよカウントダウンだね。長かったような、短かったような。"
                case 152:
                        return "今日もお疲れ様。風引かないようにゆっくりしてね。"
                case 153:
                        return "お疲れ様、気を緩めずに行こうね。"
                case 154:
                        return "季節もすっかり変わっちゃったけどまだまだ行くよ！"
                case 155:
                        return "今日もお疲れ様！このセリフ何回ぐらい言ったんだろう？"
                case 156:
                        return "あとちょっとでお疲れ様って言えなくなっちゃうの寂しいな。"
                case 157:
                        return "最初は＊＊のことバカにしてる人もいたけど、もうみんな応援してるよ。"
                case 158:
                        return "私は最初からバカになんかしてないからね。"
                case 159:
                        return "続かないとはちょっとだけ思ってたかも笑"
                case 160:
                        return "１６０日達成。あと２０日。ゴールが見えてきたね。"
                case 161:
                        return "なんだか＊＊か遠い存在の人になってきちゃったな。"
                case 162:
                        return "最後までいっても応援し続けるからね。"
                case 163:
                        return "すごいよ。もうゴールが近いのにどんどん集中力上がってきてるね。"
                case 164:
                        return "今日もお疲れ様！最後の最後までこのまま駆け抜けて。"
                case 165:
                        return "ここだけの話、＊＊の努力する姿見てると私の方が励みになっているんだよ。"
                case 166:
                        return "あっ、そういえば私ねピアノのコンクールで金賞とったよ!"
                case 167:
                        return "＊＊の頑張る姿見るたびに私も頑張ってたんだよ。褒めて。"
                case 168:
                        return "自分より努力してる人に褒められると、嬉しいな。"
                case 169:
                        return "そういえば覚えてる？ゴールになったら私の好きな人いう話？"
                case 170:
                        return "１７０日達成！ラスト１０日だよーー！"
                case 171:
                        return "ラスト９日！体調崩さないようにね！"
                case 172:
                        return "ラスト８日！＊＊の応援できて本当によかった。"
                case 173:
                        return "ラスト７日！もう少しだよ。"
                case 174:
                        return "ラスト６日！あー！楽しかった時間が終わっちゃうね。"
                case 175:
                        return "ラスト５日！お疲れ様。良かったら一緒に帰ろ？"
                case 176:
                        return "ラスト４日！お疲れ様。本当に＊＊のこと尊敬してるよ。"
                case 177:
                        return "ラスト３日！いよいよだね。なんだか分かんないけど泣けてきた。"
                case 178:
                        return "ラスト２日！ヘイ、ヘイ^^"
                case 179:
                        return "ラスト１日！本当にお疲れ様！私に素敵な体験さえてくれてありがとう。"
                case 180:
                        return "おめでとう。＊＊のことが大好きです。良かったら付き合ってください。"
                        
                default:
                        return "上限"
                }
        }
        
        func  badOfLabel()->String{
                if currentTotalPoint <= 5 {
                        switch currentTotalbadPoint {
                                case 0 :  //エラーでる
                                return ""
                                
                        case 1:
                                return "もう諦めたの？"
                                
                        case 2:
                                return "諦めるの早！"
                        case 3:
                                return "ないわ〜"
                        case 4:
                                return "くずですね"
                        case 5:
                                
                                return "…"
                        default:
                                return "バイバイ"
                        }
                }
                else if currentTotalPoint  > 5 && currentTotalPoint <= 20{
                        switch currentTotalbadPoint {
                        case 1:
                                return "どんまい。そんな時もあるよ"
                                
                        case 2:
                                return "気にしない気にしない"
                        case 3:
                                return "体調悪いの〜?"
                        case 4:
                                return "明日は頑張ろうね"
                        case 5:
                                return "もしかして辞めようとしてる？"
                        case 6:
                                return "まあ、そんなもんだと思ったよ。"
                        case 7:
                                return "もう一回頑張ったら？"
                        case 8:
                                return "本当に辞めるの？"
                        case 9:
                                return "まあしょうがないよね"
                        case 10:
                                return "幻滅です"
                        case 11:
                                return "幻滅だわ"
                        case 12:
                                return "最低"
                        case 13:
                                return "嫌い"
                        case 14:
                                return "近寄らないで"
                        case 15:
                                return "…"
                                
                        default:
                                return "バイバイ"
                        }
                }else {
                        return" ゲームオーバー"
                }
                
        }
        
        
}
