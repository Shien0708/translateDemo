//
//  StoreVocViewController.swift
//  translateDemo
//
//  Created by 方仕賢 on 2022/1/22.
//

import UIKit

var questions = [Question]()
var ogQuestions = [Question]()

class StoreVocViewController: UIViewController {

    
    @IBOutlet weak var storeEnglishTextField: UITextField!
    
    @IBOutlet weak var storeChineseTextField: UITextField!
    
    @IBOutlet weak var warningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    
    func storeNewVoc(){
        
        if storeChineseTextField.text != "" &&  storeEnglishTextField.text != "" {
            
            ogQuestions.append(Question(chineseWord: storeChineseTextField.text!, englishWord: storeEnglishTextField.text!))
            
            addNewBlank(x: ogQuestions.count)
            
            
            
            
        } else if storeChineseTextField.text == "" &&  storeEnglishTextField.text == "" {
            
            warningLabel.text = "請輸入英文及中文"
            
        } else if storeChineseTextField.text == "" {
            
            warningLabel.text = "請輸入中文"
            
        } else {
            
            warningLabel.text = "請輸入英文"
            
        }
        
        questions = ogQuestions

    }
    
    @IBAction func checkAndStore(_ sender: Any) {
        
        storeNewVoc()
        
        storeChineseTextField.text = ""
        storeEnglishTextField.text = ""
        
    }
    
 
}


struct Question {
    
    var chineseWord: String
    
    var englishWord: String
 
}
