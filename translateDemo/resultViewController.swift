//
//  resultViewController.swift
//  translateDemo
//
//  Created by 方仕賢 on 2022/1/22.
//

import UIKit

class resultViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var recordTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "答對 \(correctIndex) 題\n 答錯 \(wrongIndex) 題"
        
        for i in 0...inputAnswers.count-1 {
            if isEnglish {
                
                recordTextView.text += "\(i+1):\n 題目: \(questions[i].chineseWord)\n 答案: \(questions[i].englishWord)\n 你的答案: \(inputAnswers[i])\n\n"
            
            } else if isChinese {
                
                recordTextView.text += "\(i+1):\n 題目: \(questions[i].englishWord)\n 答案: \(questions[i].chineseWord)\n 你的答案: \(inputAnswers[i])\n\n"
                
            }
        }
    }
    
    @IBAction func backToMenu(_ sender: Any) {
        
        wrongIndex = 0
        correctIndex = 0
        
        questionIndex = 0
        
        inputAnswers = []
        
        recordTextView.text = ""
        
        isChinese = false
        isEnglish = false
        
        second = 0
        displaySecond = 0
    }
   

}
