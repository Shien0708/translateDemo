//
//  practiceViewController.swift
//  translateDemo
//
//  Created by 方仕賢 on 2022/1/22.
//

import UIKit

var correctIndex = 0
var wrongIndex = 0

var questionIndex: Int = 0

var inputAnswers = [String]()

var timeString = ""

var timer: Timer?
var timer2: Timer?

class practiceViewController: UIViewController {
  
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var inputAnswerTextField: UITextField!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var checkAnswerButton: UIButton!
    
    @IBOutlet weak var checkResultButton: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var clockView: UIView!
    
    
    
    func countDownAndShow(){
        
        timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(displayTime), userInfo: nil, repeats: true)
        
    }
    
    @objc func displayTime(){
        
        timeLabel.text = String(Int(displaySecond))
        displaySecond -= 1
        
    }
    
    func countDown(){
        
        timer = Timer.scheduledTimer(timeInterval: second+1, target: self, selector: #selector(timesUp), userInfo: nil, repeats: false)

    }
    
    @objc func timesUp(){
        
        if second != 0 {
            
            
           
            let controller = UIAlertController(title: "時間到！", message: "答案是 \(questions[questionIndex].englishWord)", preferredStyle: .alert)
            
           if isChinese {
                
                controller.message = "答案是 \(questions[questionIndex].chineseWord)"
                
            }
            
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            controller.addAction(action)
            
            present(controller, animated: true, completion: nil)
            
            if isChinese {
                
                correctOrWrong(language: questions[questionIndex].chineseWord)
                
            } else {
                
                correctOrWrong(language: questions[questionIndex].englishWord)
                
            }
            
            if questionIndex == questions.count-1 {
                
                checkResultButton.isHidden = false
                
            } else {
                
                nextButton.isHidden = false
                
            }
            
            checkAnswerButton.isHidden = true
        }
        
        
        timer2?.invalidate()
    }

    
    //蘋果 香蕉 西瓜 葡萄
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if isEnglish {
            
            questionLabel.text = questions[0].chineseWord
            
        } else if isChinese {
            
            questionLabel.text = questions[0].englishWord
            
        }
        
        nextButton.isHidden = true
        clockView.isHidden = true
        checkResultButton.isHidden = true
        
        
        
        if second > 0 {
            clockView.isHidden = false
            countDownAndShow()
            countDown()
        }
    }
    
    func correctOrWrong(language: String){
        
        if inputAnswerTextField.text == language {
            
            answerLabel.text = "Correct"
            correctIndex += 1
            
        } else {
            
            answerLabel.text = "The answer is \(language)"
            wrongIndex += 1
        }
        
        inputAnswers.append(inputAnswerTextField.text!)
        
    }
    

    
    @IBAction func checkAnswer(_ sender: Any) {
        
        if inputAnswerTextField.text != "" {
            
            if isEnglish {
                
                correctOrWrong(language: questions[questionIndex].englishWord)
                
            } else if isChinese {
                
                correctOrWrong(language: questions[questionIndex].chineseWord)
            }
            
            
            if questionIndex == questions.count-1 {
                
                checkResultButton.isHidden = false
                
            } else {
                
                nextButton.isHidden = false
               
            }
            
            checkAnswerButton.isHidden = true
            timer?.invalidate()
            timer2?.invalidate()
            
        } else {
            
            answerLabel.text = "請輸入答案"
            
        }
    }
    
    
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        
        questionIndex += 1
        
        if questionIndex <= questions.count-1 {
            
            
            answerLabel.text = ""
            
            checkAnswerButton.isHidden = false
            
            nextButton.isHidden = true
            
            if isEnglish {
            
            questionLabel.text = questions[questionIndex].chineseWord
            
            } else if isChinese {
                
                questionLabel.text = questions[questionIndex].englishWord
                
            }
            inputAnswerTextField.text = ""
            
        }
        
        displaySecond = second
        
        countDownAndShow()
        countDown()
        
    }
    
    
    @IBAction func checkResult(_ sender: Any) {
        
        checkResultButton.isHidden = true
        clockView.isHidden = true
      
    }
  
}
