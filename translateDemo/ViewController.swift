//
//  ViewController.swift
//  translateDemo
//
//  Created by 方仕賢 on 2022/1/22.
//

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkList(_ sender: Any) {
        
        if questions.count == 0 {
            
            showAlert()
            
        }
    }
    

    @IBAction func start(_ sender: Any) {
        
        if questions.count == 0 {
            
            
            showAlert()
            
        } else {
            
            questions.shuffle()
            
        }
      
    }
    
    @IBAction func backToMenu(segue: UIStoryboardSegue) {
        
        
    }
    
    func showAlert(){
        
        guard let _ = viewIfLoaded?.window, presentedViewController == nil else {return}
        
        let controller = UIAlertController(title: "尚無單字", message: "你沒有加入任何單字", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "去新增單字", style: .default, handler: nil)
        
        controller.addAction(action)
        
        present(controller, animated: true, completion: nil)
        
    }
   
}

