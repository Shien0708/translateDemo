//
//  VocListViewController.swift
//  translateDemo
//
//  Created by 方仕賢 on 2022/1/23.
//

import UIKit


var vocabularies = [UIView]()

func addNewBlank(x: Int){
    
   
    let vocBlank = UIView(frame: CGRect(x: CGFloat((x-1)*100+25*(x-1)), y: 10, width: 100 , height: 100))
    
    vocBlank.backgroundColor = UIColor.black
    
    let numberLabel = UILabel()
    numberLabel.frame = CGRect(x: 5, y: 5, width: 20, height: 20)
    numberLabel.text = "\(x)."
    numberLabel.textColor = .white
    
    
    let chineseLabel = UILabel()
    chineseLabel.frame = CGRect(x:5, y: 25, width: 100, height: 25)
    chineseLabel.text = ogQuestions[x-1].chineseWord
    chineseLabel.textColor = UIColor.white
    
    let englishLabel = UILabel()
    englishLabel.frame = CGRect(x:5, y: 65, width: 100, height: 25)
    
    englishLabel.text = ogQuestions[x-1].englishWord
    englishLabel.textColor = UIColor.white
    
    vocBlank.addSubview(numberLabel)
    vocBlank.addSubview(chineseLabel)
    vocBlank.addSubview(englishLabel)
      
    vocabularies.append(vocBlank)
    
}

func addWhiteBlank(x: Int)->UIView {
    
    let whiteBlank = UIView(frame: CGRect(x: CGFloat((x-1)*100+25*(x-1)), y: 10, width: 100 , height: 100))
    
    whiteBlank.backgroundColor = UIColor(red: 223, green: 229, blue: 232, alpha: 1)
    
    return whiteBlank
    
}



class VocListViewController: UIViewController {
    
    @IBOutlet weak var vocDisplayView: UIView!
    
    @IBOutlet weak var deleteTextField: UITextField!
    
    
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        for count in 0...questions.count-1 {
            
            
            vocDisplayView.addSubview(vocabularies[count])
         
        }
       
        
    }
    
    func deleteVoc(index: Int){
        
       
                ogQuestions.remove(at: index)
        
                questions = ogQuestions
        
                vocabularies.removeAll()
                
        if ogQuestions.count > 0 {
                for count in 1...ogQuestions.count {
                    
                    addNewBlank(x: count)
                    
                    vocDisplayView.addSubview(vocabularies[count-1])
                
                }
        
        }
        
                vocDisplayView.addSubview(addWhiteBlank(x: ogQuestions.count+1))
                
            
      
        deleteTextField.text = ""
    }
    
    func cantNotFind(string: String) {
        
        let controller = UIAlertController(title: "無此單字", message: "找不到\(string)", preferredStyle: .alert)
        let action = UIAlertAction(title: "再輸入一次", style: .default) { (action:UIAlertAction!)->Void in
            self.deleteTextField.text = ""
        }
        
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
        
    }
    
    
    func showAlert(index: Int){
        
        let controller = UIAlertController(title: "刪除此單字", message: "確定要刪除 \(deleteTextField.text!)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "確定", style: .default, handler: { (action: UIAlertAction!)->Void in self.deleteVoc(index: index)})
        let action2 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        controller.addAction(action)
        controller.addAction(action2)
        
        present(controller, animated: true, completion: nil)
        
    }
    
    @IBAction func deleteTheStoredVoc(_ sender: Any) {
        
        var index = ogQuestions.count
        
        if ogQuestions.count > 0 {
        
        for i in 0...ogQuestions.count-1 {
            
            if index == ogQuestions.count {
                
                if deleteTextField.text == ogQuestions[i].chineseWord || deleteTextField.text == ogQuestions[i].englishWord {
                    
                    showAlert(index: i)
                    
                    index = 0
                       
            
                }
           }
            
        }
        
        }
        
        if index == ogQuestions.count {
            
            cantNotFind(string: deleteTextField.text!)
        }
    }
    
    @IBAction func search(_ sender: Any) {
        
        
        for word in 0...ogQuestions.count-1 {
           
            
            if searchTextField.text! == ogQuestions[word].englishWord || searchTextField.text! == ogQuestions[word].chineseWord {
                
                let controller = UIAlertController(title: "找到了！", message: "在編號 \(word+1)", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                controller.addAction(action)
                present(controller, animated: true, completion: nil)
                
                
                
            } else if word == ogQuestions.count-1 {
                
                cantNotFind(string: searchTextField.text!)
                
            }
        }
    }
    
}


