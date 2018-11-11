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
    
    
    @IBOutlet weak var rankLabel: UILabel!
    var timerArray = [Double]()
    var highTimerArray = [Double]()
    var lastScore:Double = 0.0
    var highScore:Double = 0.0
    
    var rank:Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //arrayというキー値で保存された、配列arrayを取り出す
        if UserDefaults.standard.object(forKey: "lastScore") != nil{
            timerArray = UserDefaults.standard.object(forKey: "lastScore") as! [Double]
            if UserDefaults.standard.object(forKey: "highScore") != nil{
                //highScoreあったら
                highTimerArray = UserDefaults.standard.object(forKey: "highScore") as! [Double]
                
                lastScore = timerArray[0]
                lastScoreTextLabel.text = String(lastScore)
                
                highScore = highTimerArray[0]
                
                
                if highScore != 0.0{
                    //2回目以降
                    if highScore > lastScore{
                        highScore = lastScore
                    }
                }else{
                    //highScore=0 -> 最初
                    highScore = lastScore
                    
                }
                highScoreTextLabel.text = String(highScore)
                
                //textFieldで記入されたテキストを入れる
                highTimerArray.append(Double(highScore))
                
                //キー値"array"で配列の保存
                UserDefaults.standard.set(highTimerArray, forKey: "highScore")
                
                rankQuestion()
                
                
            }else{
                //highScoreなかったら
                highScore = 0.0
                
                lastScore = timerArray[0]
                lastScoreTextLabel.text = String(lastScore)
                
//                highScore = highTimerArray[0]
                
                
                if highScore != 0.0{
                    //2回目以降
                    if highScore > lastScore{
                        highScore = lastScore
                    }
                }else{
                    //highScore=0 -> 最初
                    highScore = lastScore
                    
                }
                highScoreTextLabel.text = String(highScore)
                
                //textFieldで記入されたテキストを入れる
                highTimerArray.append(Double(highScore))
                
                //キー値"array"で配列の保存
                UserDefaults.standard.set(highTimerArray, forKey: "highScore")
                
                rankQuestion()
            }
        }
        //rankを計算する
        
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
        case 70..<80:
            rankLabel.textColor = UIColor.magenta
            rankLabel.text = "E"
        case 90..<100:
            rankLabel.textColor = UIColor.magenta
            rankLabel.text = "F"
        case 100..<110:
            rankLabel.textColor = UIColor.cyan
            rankLabel.text = "G"
        case 110..<120:
            rankLabel.textColor = UIColor.cyan
            rankLabel.text = "H"
        case 120..<130:
            rankLabel.textColor = UIColor.cyan
            rankLabel.text = "I"
        case 130..<140:
            rankLabel.textColor = UIColor.black
            rankLabel.text = "J"
        case 140..<150:
            rankLabel.textColor = UIColor.black
            rankLabel.text = "K"
        case 1500..<160:
            rankLabel.textColor = UIColor.black
            rankLabel.text = "L"
            
            
    
        default:
            rankLabel.textColor = UIColor.black
            rankLabel.text = "Let a little harder"
            
        }
        
        
        
        
    }
        
    
   
    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    //share機能
    @IBAction func share(_ sender: Any) {
        // 共有する項目
        let shareText = Double(highScore)
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

