//
//  ViewController.swift
//  Dentaku
//
//  Created by 大江祥太郎 on 2018/10/28.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
   
    @IBOutlet weak var leftLabel: UILabel!
    
    
    @IBOutlet weak var rightLabel: UILabel!
    
    
    @IBOutlet weak var calcLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var maruImageView: UIImageView!
    
    @IBOutlet weak var batsuImageView: UIImageView!
    
    @IBOutlet weak var startButtonLabel: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    var calc:[String] = ["➕","➖","✖️"]
    
    var questionNum :Int = 0
    
    var result:Int = 0
    
    var leftNumber :Int = 0
    var rightNumber :Int = 0
    
    var answer:Int = 0
    
    var timer:Timer!
//  timer保存する配列
    var timerArray = [Double]()
    var count:Double = 0.0
    
    @IBOutlet weak var noteTextViewLabel: UITextView!
    
    @IBOutlet weak var noteViewLabel: UIView!
    func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
//    問題を出す関数
    func showQuestion(){
        leftNumber=Int(arc4random_uniform(10))
        rightNumber=Int(arc4random_uniform(10))
        leftLabel.text = String(leftNumber)
        rightLabel.text = String(rightNumber)
        
        let calculation = Int( arc4random_uniform(UInt32(calc.count)) )
        calcLabel.text = calc[calculation]
        
    }
    func answerQuestion(){
        if result == answer{
            //正解
            vibrate()
            /*
            UIView.animate(withDuration: 1, animations: {
                self.maruImageView.alpha = 0
            }, completion: { finished in
                self.maruImageView.removeFromSuperview()
            })*/
            showQuestion()
            questionNum += 1

            
        }else{
            //不正解
            vibrate()
            /*
            UIView.animate(withDuration: 1, animations: {
                self.batsuImageView.alpha = 0
            }, completion: { finished in
                self.batsuImageView.removeFromSuperview()
            })*/
            
            
        }
        if questionNum == 10{
            timer.invalidate()
            //textFieldで記入されたテキストを入れる
            timerArray.append(Double(timerLabel.text!)!)
            
            //キー値"array"で配列の保存
            UserDefaults.standard.set(timerArray, forKey: "lastScore")
            
           
//            print(timerArray)
            self.performSegue(withIdentifier: "toThird", sender: nil)
            
        }
        answer = 0
        answerLabel.text = "0"
    }
  //rankを計算する
    func rankQuestion(){
        
        
    }
    
    
    
    
    @IBAction func okButton(_ sender: Any) {
        
        
        if calcLabel.text == "➕"{
            result = leftNumber + rightNumber
        }
        if calcLabel.text == "➖"{
            result = leftNumber - rightNumber
        }
        if calcLabel.text == "✖️"{
            result = leftNumber * rightNumber
        }
        
        answerQuestion()
        
    }
    
    @IBAction func cButton(_ sender: Any) {
        answer = 0
        answerLabel.text = String(answer)
    }
    
    @IBAction func zeroButton(_ sender: Any) {
        if answerLabel.text != "0"{
            answer = 10*answer + 0
        }
        answerLabel.text = String(answer)
    }
    @IBAction func oneButton(_ sender: Any) {
        if answerLabel.text == "0"{
            answer = 1
        }
        if answerLabel.text != "0" && answerLabel.text != "-"{
            answer = 10*answer + 1
        }
        if answerLabel.text == "-"{
            answer = -1
        }
        answerLabel.text = String(answer)
        
    }
    
    @IBAction func twoButton(_ sender: Any) {
        if answerLabel.text == "0"{
            answer = 2
        }
        if answerLabel.text != "0" && answerLabel.text != "-"{
            answer = 10*answer + 2
        }
        if answerLabel.text == "-"{
            answer = -2
        }
        answerLabel.text = String(answer)
        
    }
    
    @IBAction func threeButton(_ sender: Any) {
        if answerLabel.text == "0"{
            answer = 3
        }
        if answerLabel.text != "0" && answerLabel.text != "-"{
            answer = 10*answer + 3
        }
        if answerLabel.text == "-"{
            answer = -3
        }
        answerLabel.text = String(answer)
        
    }
    @IBAction func fourButton(_ sender: Any) {
        if answerLabel.text == "0"{
            answer = 4
        }
        if answerLabel.text != "0" && answerLabel.text != "-"{
            answer = 10*answer + 4
        }
        if answerLabel.text == "-"{
            answer = -4
        }
        answerLabel.text = String(answer)
        
    }
    
    @IBAction func fiveButton(_ sender: Any) {
        if answerLabel.text == "0"{
            answer = 5
        }
        if answerLabel.text != "0" && answerLabel.text != "-"{
            answer = 10*answer + 5
        }
        if answerLabel.text == "-"{
            answer = -5
        }
        answerLabel.text = String(answer)
        
    }
    @IBAction func sixButton(_ sender: Any) {
        
        
        if answerLabel.text == "0"{
            answer = 6
        }
        if answerLabel.text != "0" && answerLabel.text != "-"{
            answer = 10*answer + 6
        }
        if answerLabel.text == "-"{
            answer = -6
        }
        answerLabel.text = String(answer)
        
    }
    
    @IBAction func sevenButton(_ sender: Any) {
        
        if answerLabel.text == "0"{
            answer = 7
        }
        if answerLabel.text != "0" && answerLabel.text != "-"{
            answer = 10*answer + 7
        }
        if answerLabel.text == "-"{
            answer = -7
        }
        answerLabel.text = String(answer)
        
        }

    @IBAction func eightButton(_ sender: Any) {
        if answerLabel.text == "0"{
            answer = 8
        }
        if answerLabel.text != "0" && answerLabel.text != "-"{
            answer = 10*answer + 8
        }
        if answerLabel.text == "-"{
            answer = -8
        }
        answerLabel.text = String(answer)
    }

    
    @IBAction func nineButton(_ sender: Any) {
       
        if answerLabel.text == "0"{
            answer = 9
        }
        if answerLabel.text != "0" && answerLabel.text != "-"{
            answer = 10*answer + 9
        }
        if answerLabel.text == "-"{
            answer = -9
        }
        answerLabel.text = String(answer)
        
        }
    
    
    @IBAction func mainasuButton(_ sender: Any) {
        answerLabel.text = "-"
    }
    

    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
//        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(UIMenuController.update), userInfo: nil, repeats: true)
       
        
    }
    

    @IBAction func startButton(_ sender: Any) {
        noteViewLabel.alpha=0.0
        noteTextViewLabel.alpha=0.0
        startButtonLabel.isHidden = true
       timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        
    }
    
//    timer
    @objc func update(){
        count = count + 0.1
        timerLabel.text = String(format: "%.1f", count)
        
    }
    
}
