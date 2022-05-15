//
//  ViewController.swift
//  Faktoriyel Hesapla
//
//  Created by Furkan Ceylan on 9.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    var result = UILabel()
    var clearButton = UIButton()
    var fakt:Int64 = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = view.frame.size.width
        let height = view.frame.size.height
        result.textColor = UIColor(red: 255/256, green: 100/256, blue: 25/256, alpha: 0.8)
        result.textAlignment = .center
        result.frame = CGRect(x: width * 0.5 - width * 0.8/2, y: height * 0.5 - 30, width: width * 0.8, height: 60)
        view.addSubview(result)
        
        
        clearButton = UIButton(frame: CGRect(x: width * 0.5 - width * 0.2/2, y: height * 0.7, width: width * 0.2, height: 20))
        clearButton.setTitle("Clear", for: UIControl.State.normal)
        clearButton.backgroundColor = UIColor(red: 255/256, green: 100/256, blue: 25/256, alpha: 0.8)
        clearButton.addTarget(self, action: #selector(deleteFunc), for: .touchUpInside)
        self.view.addSubview(clearButton)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        

    }

    @IBAction func calculateClick(_ sender: Any) {
        if fakt > 922337203685477580{
            result.text = "Bellek aşımı"
        }else{
            
            if let number : Int64 = Int64(numberTextField.text!) {
                for i in 1...number {
                    fakt = i * fakt
                }
            }
            result.text = "\(numberTextField.text!)'in faktoriyeli = \(fakt)'dır."
            
        }
    }
    
    @objc func deleteFunc(sender: UIButton!){
        result.text = " "
        numberTextField.text = nil
        numberTextField.placeholder = "Enter Number Please"
        fakt = 1
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}

