//
//  StartViewController.swift
//  Dentaku
//
//  Created by 大江祥太郎 on 2018/11/11.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit
import AVFoundation

class StartViewController: UIViewController {
    var timer:Timer!
     var audioPlayer:AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            let filePath = Bundle.main.path(forResource: "bgm",ofType: "mp3")
            let musicPath = URL(fileURLWithPath: filePath!)
            audioPlayer = try AVAudioPlayer(contentsOf: musicPath)
            
        } catch {
            print("error")
        }
        audioPlayer.play()
        
        
    }
    
    @IBAction func secondDigitButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toSecondDigit", sender: nil)
        audioPlayer.stop()
    }
    
    @IBAction func thirdDigitButton(_ sender: Any) {
    
     self.performSegue(withIdentifier: "toThirdDigit", sender: nil)
        audioPlayer.stop()
    }
    
    @IBAction func fourthDigitButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toFourthDigit", sender: nil)
        audioPlayer.stop()
    }
    
}
