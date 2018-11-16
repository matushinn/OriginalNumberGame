//
//  ThirdResultViewController.swift
//  Dentaku
//
//  Created by 大江祥太郎 on 2018/11/16.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit
import Social

class ThirdResultViewController: UIViewController {

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
        
        //lastScoreというキー値で保存された、配列timerArrayを取り出す
        if UserDefaults.standard.object(forKey: "lastScore") != nil{
            timerArray = UserDefaults.standard.object(forKey: "lastScore") as! [Double]
            if UserDefaults.standard.object(forKey: "highScore") != nil{
                //highScoreあったら
                highTimerArray = UserDefaults.standard.object(forKey: "highScore") as! [Double]
                
                checkHighScore()
                
            }else{
                //highScoreなかったら
                highScore = 0.0
                
                checkHighScore()
                
            }
            rankQuestion()
        }
    }
    //hightimeCheck
    func checkHighScore(){
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
        
        
    }
    
    //rankを計算する
    
    
    func rankQuestion(){
        rank = lastScore
        switch rank {
        case 0..<20:
            rankLabel.textColor = UIColor.blue
            rankLabel.text = "Super"
        case 20..<30:
            rankLabel.textColor = UIColor.purple
            rankLabel.text = "Greate!"
        case 30..<40:
            rankLabel.textColor = UIColor.orange
            rankLabel.text = "Good!"
        case 40..<50:
            rankLabel.textColor = UIColor.yellow
            rankLabel.text = "SS"
        case 50..<60:
            rankLabel.textColor = UIColor.yellow
            rankLabel.text = "S"
        case 60..<70:
            rankLabel.textColor = UIColor.yellow
            rankLabel.text = "A"
        case 70..<80:
            rankLabel.textColor = UIColor.red
            rankLabel.text = "B"
        case 80..<90:
            rankLabel.textColor = UIColor.red
            rankLabel.text = "C"
        case 100..<110:
            rankLabel.textColor = UIColor.red
            rankLabel.text = "D"
        case 110..<120:
            rankLabel.textColor = UIColor.magenta
            rankLabel.text = "E"
            
        default:
            rankLabel.textColor = UIColor.black
            rankLabel.text = "More harder"
            
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func TweetButton(sender: UIButton) {
        
        let text = "Number❓Number"
        
        let composeViewController: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
        composeViewController.setInitialText(text)
        
        self.present(composeViewController, animated: true, completion: nil)
    }
    @IBAction func FacebookButton(sender: UIButton) {
        
        let text = "Number❓Number"
        
        let composeViewController: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
        composeViewController.setInitialText(text)
        
        self.present(composeViewController, animated: true, completion: nil)
    }
    
    
}
