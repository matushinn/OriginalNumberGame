//
//  StartViewController.swift
//  Dentaku
//
//  Created by 大江祥太郎 on 2018/11/11.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    var timer:Timer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func secondDigitButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toSecondDigit", sender: nil)
    }
    
    @IBAction func thirdDigitButton(_ sender: Any) {
    
     self.performSegue(withIdentifier: "toThirdDigit", sender: nil)
    }
    
    @IBAction func fourthDigitButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toFourthDigit", sender: nil)
    }
    
}
