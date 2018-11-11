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
    var timerArray = [Double]()
    var highTimerArray = [Double]()
    var lastScore:Double = 0.0
    var highScore:Double = 0.0
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
                
            }
        }
        
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
}
