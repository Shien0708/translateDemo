//
//  chooseQuestionViewController.swift
//  translateDemo
//
//  Created by 方仕賢 on 2022/1/24.
//

import UIKit

var isChinese = false
var isEnglish = false

var second: Double = 0
var displaySecond = second

class chooseQuestionViewController: UIViewController {
    
    @IBOutlet weak var timerSwitch: UISwitch!
    
    @IBOutlet weak var setTimeTextField: UITextField!

    @IBOutlet weak var answerEnglishButton: UIButton!
    
    @IBOutlet weak var answerChineseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setTimeTextField.isHidden = true
    }
    
    
    @IBAction func showSetTimeBlank(_ sender: UISwitch) {
        
        
        if sender.isOn {
            
            setTimeTextField.isHidden = false
            
        } else {
            
            setTimeTextField.isHidden = true
            
        }
    }
    

    @IBAction func enterGame(_ sender: UIButton) {
        
        switch sender {
            
        case answerEnglishButton:
            
            if questions.count > 0 {
               
                isEnglish = true
               
            }
            
        default:
            
            if questions.count > 0 {
                
              isChinese = true
                
            }
            
        }
        
        if !setTimeTextField.isHidden {
            
            if setTimeTextField.text != "" {
                
                second = Double(setTimeTextField.text!)!
                displaySecond = second
                
            } else {
                
               
                let controller = UIAlertController(title: "沒有秒數", message: "請輸入秒數", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                controller.addAction(action)
                present(controller, animated: true, completion: nil)
                
            }
           
           
        }
  
    }

}
