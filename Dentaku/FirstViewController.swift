//
//  FirstViewController.swift
//  Dentaku
//
//  Created by 大江祥太郎 on 2018/10/28.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class FirstViewController: UIViewController {
    var audioPlayer:AVAudioPlayer!
    
    
    @IBOutlet weak var leftLabel: UILabel!
    
    
    @IBOutlet weak var rightLabel: UILabel!
    
    
    @IBOutlet weak var calcLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    
    @IBOutlet weak var startButtonLabel: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var maruImageView: UIImageView!
    
    @IBOutlet weak var batuImageView: UIImageView!
    var calc:[String] = ["➕","➖","✖️"]
    
    var questionNum :Int = 1
    
    var result:Int = 0
    
    var leftNumber :Int = 0
    var rightNumber :Int = 0
    
    var answer:Int = 0
    
    var timer:Timer!
    //  timer保存する配列
    var firstTimerArray = [Double]()
    var count:Double = 0.0
    var checkFirstResultArray = [Int]()
    var min=1
    var range=8
    @IBOutlet weak var noteTextViewLabel: UITextView!
    
    @IBOutlet weak var noteViewLabel: UIView!
    
    @IBOutlet weak var questionNumLabel: UILabel!
    func vibrate() {
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    // アラートを表示する関数
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    //    問題を出す関数
    func showQuestion(){
        //1~9までの数字
        leftNumber=Int(arc4random_uniform(UInt32(range)+UInt32(min)))
        rightNumber=Int(arc4random_uniform(UInt32(range)+UInt32(min)))
        
        leftLabel.text = String(leftNumber)
        rightLabel.text = String(rightNumber)
        
        
        let calculation = Int( arc4random_uniform(UInt32(calc.count)) )
        calcLabel.text = calc[calculation]
        
    }
    func answerQuestion(){
        if result == answer{
            //正解
            vibrate()
            
            //audioPlayer.pause()
            
             showAlert(message: "⭕️")
            
            
            
            /*
             UIView.animate(withDuration: 0.3, animations: {
             self.maruImageView.alpha = 0
             }, completion: { finished in
             self.maruImageView.removeFromSuperview()
 */
            showQuestion()
            questionNum += 1
            questionNumLabel.text = String(questionNum)
            if questionNum == 8{
                questionNumLabel.textColor = UIColor.yellow
            }
            if questionNum == 9{
                questionNumLabel.textColor = UIColor.yellow
            }
            if questionNum == 10{
                questionNumLabel.textColor = UIColor.yellow
            }
            if questionNum == 11{
                timer.invalidate()
                //textFieldで記入されたテキストを入れる
                firstTimerArray.append(Double(timerLabel.text!)!)
                //            checkFirstResultArray.append(firstCount!)
                
                //キー値"array"で配列の保存
                UserDefaults.standard.set(firstTimerArray, forKey: "lastScore")
                //            UserDefaults.standard.set(checkFirstResultArray, forKey: "firstCount")
                
                
                //            print(timerArray)
                self.performSegue(withIdentifier: "toFirstResult", sender: nil)
                
                audioPlayer.stop()
                
                
                
            }
            
            
        }else{
            //不正解
            vibrate()
            //audioPlayer.pause()
            
            
            /*
             UIView.animate(withDuration: 0.3, animations: {
                self.batuImageView.alpha = 0
             }, completion: { finished in
             self.batuImageView.removeFromSuperview()
             })
 */
            
            
        }
        
        answer = 0
        answerLabel.text = "0"
        
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
        
        do {
            let filePath = Bundle.main.path(forResource: "sentou",ofType: "mp3")
            let musicPath = URL(fileURLWithPath: filePath!)
            audioPlayer = try AVAudioPlayer(contentsOf: musicPath)
            
        } catch {
            print("error")
        }
        
        
        
        
    }
    
    
    @IBAction func startButton(_ sender: Any) {
        noteViewLabel.alpha=0.0
        noteTextViewLabel.alpha=0.0
        startButtonLabel.isHidden = true
        startTimer()
        /*
        // mp3音声(SOUND.mp3)の再生
        playSound(name: "sentou")
        
        */
        audioPlayer.play()
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        audioPlayer.stop()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(FirstViewController.update), userInfo: nil, repeats: true)
    }
    
    //    timer
    @objc func update(){
        count = count + 0.1
        timerLabel.text = String(format: "%.1f", count)
        
    }
}
/*
extension FirstViewController: AVAudioPlayerDelegate {
    func playSound(name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
            print("音源ファイルが見つかりません")
            return
        }
        
        do {
            // AVAudioPlayerのインスタンス化
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            
            // AVAudioPlayerのデリゲートをセット
            audioPlayer.delegate = self
            
            // 音声の再生
            audioPlayer.play()
            
            
            
            
            
            
        } catch {
        }
    }
}
*/
