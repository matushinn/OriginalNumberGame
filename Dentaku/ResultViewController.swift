//
//  ResultViewController.swift
//  Dentaku
//
//  Created by 大江祥太郎 on 2018/11/08.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit


class ResultViewController: UIViewController {
    
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var lastScoreLabel: UILabel!
    
    @IBOutlet weak var highScoreTextLabel: UILabel!
    
    @IBOutlet weak var lastScoreTextLabel: UILabel!
    
    
    @IBOutlet weak var rankTextLabel: UILabel!
    
    @IBOutlet weak var rankLabel: UILabel!
    var firstTimerArray = [Double]()
    var secondTimerArray = [Double]()
    var thirdTimerArray = [Double]()
    
    var firstHighTimerArray = [Double]()
    var secondHighTimerArray = [Double]()
    var thirdHighTimerArray = [Double]()
    
    var lastScore:Double = 0.0
    var firstHighScore:Double = 0.0
    var secondHighScore:Double = 0.0
    var thirdHighScore:Double = 0.0
    
    var rank:Double = 0
    
    var newHighScoreCount:Int=0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //arrayというキー値で保存された、配列arrayを取り出す
        if UserDefaults.standard.object(forKey: "firstlastScore") != nil{
            firstTimerArray = UserDefaults.standard.object(forKey: "firstlastScore") as! [Double]
            if UserDefaults.standard.object(forKey: "firstCount") != nil{
                UserDefaults.standard.removeObject(forKey: "firstCount")
                rankTextLabel.text = "◯❓△ rank"
                checkHighScore()
                
                
            }
            
        }
        if UserDefaults.standard.object(forKey: "secondlastScore") != nil{
            secondTimerArray = UserDefaults.standard.object(forKey: "secondlastScore") as! [Double]
            rankTextLabel.text = "◯△❓□ rank"
            checkHighScore()
            
        }
        if UserDefaults.standard.object(forKey: "thirdlastScore") != nil{
            thirdTimerArray = UserDefaults.standard.object(forKey: "thirdlastScore") as! [Double]
            rankTextLabel.text = "◯△❓□♤ rank"
            checkHighScore()
            
        }
        //rankを計算する
        
    }
    //highscoreあるかないか
    func checkHighScore(){
        if UserDefaults.standard.object(forKey: "highScore") != nil{
//            firstHighScore = firstHighTimerArray[0]
//            secondHighScore = secondHighTimerArray[0]
//            thirdHighScore = thirdHighTimerArray[0]
//            highScoreあったら
            decideHighTime()
            rankQuestion()
            
            
        }else{
            //highScoreなかったら
            decideHighTime()

            rankQuestion()
        }
        
    }
    func decideHighTime(){
        switch rankTextLabel.text {
        case "◯❓△ rank":
            firstHighTimerArray = UserDefaults.standard.object(forKey: "highScore") as! [Double]
            lastScore = firstTimerArray[0]
            if firstHighScore != 0.0{
                //2回目以降
                if firstHighScore > lastScore{
                    firstHighScore = lastScore
                }
            }else{
                //highScore=0 -> 最初
                firstHighScore = lastScore
                
            }
            highScoreTextLabel.text = String(firstHighScore)
            //textFieldで記入されたテキストを入れる
            firstHighTimerArray.append(Double(firstHighScore))
            
            //キー値"array"で配列の保存
            UserDefaults.standard.set(firstHighTimerArray, forKey: "highScore")
            
        case "◯△❓□ rank":
            secondHighTimerArray = UserDefaults.standard.object(forKey: "highScore") as! [Double]
            
            lastScore = secondTimerArray[0]
            if secondHighScore != 0.0{
                //2回目以降
                if secondHighScore > lastScore{
                    secondHighScore = lastScore
                }
            }else{
                //highScore=0 -> 最初
                secondHighScore = lastScore
                
            }
            highScoreTextLabel.text = String(secondHighScore)
            //textFieldで記入されたテキストを入れる
            secondHighTimerArray.append(Double(secondHighScore))
            
            //キー値"array"で配列の保存
            UserDefaults.standard.set(secondHighTimerArray, forKey: "highScore")
            
        case "◯△❓□♤ rank":
            thirdHighTimerArray = UserDefaults.standard.object(forKey: "highScore") as! [Double]
            
            lastScore = thirdTimerArray[0]
            if thirdHighScore != 0.0{
                //2回目以降
                if thirdHighScore > lastScore{
                    thirdHighScore = lastScore
                }
            }else{
                //highScore=0 -> 最初
                thirdHighScore = lastScore
                
            }
            highScoreTextLabel.text = String(thirdHighScore)
            //textFieldで記入されたテキストを入れる
            thirdHighTimerArray.append(Double(thirdHighScore))
            
            //キー値"array"で配列の保存
            UserDefaults.standard.set(thirdHighTimerArray, forKey: "highScore")
            
        default:
            break
            
        }
        lastScoreTextLabel.text = String(lastScore)
        
        
        
    }
    func rankQuestion(){
        rank = lastScore
        switch rank {
        case 0..<10:
            rankLabel.textColor = UIColor.blue
            rankLabel.text = "Super"
        case 10..<15:
            rankLabel.textColor = UIColor.purple
            rankLabel.text = "Greate!"
        case 15..<20:
            rankLabel.textColor = UIColor.orange
            rankLabel.text = "Good!"
        case 20..<25:
            rankLabel.textColor = UIColor.yellow
            rankLabel.text = "SSS"
        case 25..<30:
            rankLabel.textColor = UIColor.yellow
            rankLabel.text = "SS"
        case 30..<35:
            rankLabel.textColor = UIColor.yellow
            rankLabel.text = "S"
        case 35..<40:
            rankLabel.textColor = UIColor.red
            rankLabel.text = "A"
        case 40..<50:
            rankLabel.textColor = UIColor.red
            rankLabel.text = "B"
        case 50..<60:
            rankLabel.textColor = UIColor.red
            rankLabel.text = "C"
        case 60..<70:
            rankLabel.textColor = UIColor.magenta
            rankLabel.text = "D"
        
        default:
            rankLabel.textColor = UIColor.black
            rankLabel.text = "More harder"
            
        }
        
        
        
        
    }
        
    
   
    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    //share機能
    @IBAction func share(_ sender: Any) {
        // 共有する項目
        let shareText = Double("Good")
        let shareWebsite = NSURL(string: "http://hachimantai.spartacamp.jp/")!
        
        
        let activityItems = [shareText, shareWebsite] as [Any]
        
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        
        
     /*   // 使用しないアクティビティタイプ
        let excludedActivityTypes = [
            UIActivity.ActivityType.postToFacebook,
            UIActivity.ActivityType.postToTwitter,
            UIActivity.ActivityType.message,
            UIActivity.ActivityType.saveToCameraRoll,
            UIActivity.ActivityType.print
        ]
 
        activityVC.excludedActivityTypes = excludedActivityTypes
       */
        // UIActivityViewControllerを表示
        self.present(activityVC, animated: true, completion: nil)
        
    }
    
    
    
}

