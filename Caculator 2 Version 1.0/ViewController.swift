//
//  ViewController.swift
//  Calculator 1 Version 1.2
//
//  Created by Viet Anh Doan on 5/28/17.
//  Copyright © 2017 Viet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var botConstraint: NSLayoutConstraint!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    var temp : Double = 0
    var firstTap = true
    var action = ""
    var firstProcess = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        inputTextField.isEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        let scale = UIScreen.main.bounds.height / 671
        topConstraint.constant *= scale
        botConstraint.constant *= scale
    }
    
    @IBAction func numberButton(_ sender: UIButton) {
        if resultLabel.text! == "Error" {
            return
        }
        if Double(resultLabel.text!)! < 10000000000 {
            if sender.titleLabel?.text == "." {
                if firstTap {
                    resultLabel.text = "0."
                }
                else if !((resultLabel.text?.contains("."))!) {
                    resultLabel.text = resultLabel.text! + "."
                }
            }
            else {
                resultLabel.text = firstTap ? (sender.titleLabel?.text)! : (resultLabel.text! + (sender.titleLabel?.text)!)
            }
        }
        firstTap = false
    }
    
    @IBAction func ACButtonAction(_ sender: UIButton) {
        resultLabel.text = "0"
        inputTextField.text = ""
        temp = 0
        firstProcess = true
        action = ""
        firstTap = true
    }
    
    
    @IBAction func operatorButtonAction(_ sender: UIButton) {
        if resultLabel.text! == "Error" {
            return
        }
        firstTap = true
        switch (sender.titleLabel?.text)! {
        case "+/-":
            if let intNumber = Int(resultLabel.text!){
                resultLabel.text = String(-intNumber)
            }
            else {
                temp = -Double(resultLabel.text!)!
                resultLabel.text = String(temp)
            }
        case "%":
            temp = Double(resultLabel.text!)! / 100
            resultLabel.text = floor(temp) == temp ? String(Int(temp)) : String(temp)
        case "/":
            if action == "/" || action == "" {
                if firstProcess {
                    inputTextField.text = resultLabel.text! + " / "
                    temp = Double(resultLabel.text!)!
                    firstProcess = false
                }
                else{
                    if resultLabel.text! == "0" {
                        inputTextField.text = inputTextField.text! + resultLabel.text!
                        resultLabel.text = "Error"
                    }
                    else {
                        inputTextField.text = inputTextField.text! + resultLabel.text! + " / "
                        temp = temp / Double(resultLabel.text!)!
                        resultLabel.text = floor(temp) == temp ? String(Int(temp)) : String(temp)
                    }
                }
            }
            else {
                executeByAction(action: action,toAction: "/")
            }
            action = "/"
        case "*":
            if action == "*" || action == ""{
                if firstProcess {
                    inputTextField.text = resultLabel.text! + " * "
                    temp = Double(resultLabel.text!)!
                    firstProcess = false
                }
                else{
                    inputTextField.text = inputTextField.text! + resultLabel.text! + " * "
                    temp = temp * Double(resultLabel.text!)!
                    resultLabel.text = floor(temp) == temp ? String(Int(temp)) : String(temp)
                }
            }
            else {
                executeByAction(action: action,toAction: "*")
            }
            action = "*"
        case "+":
            if action == "+" || action == ""{
                if firstProcess {
                    inputTextField.text = resultLabel.text! + " + "
                    temp = Double(resultLabel.text!)!
                    firstProcess = false
                }
                else{
                    inputTextField.text = inputTextField.text! + resultLabel.text! + " + "
                    temp = temp + Double(resultLabel.text!)!
                    resultLabel.text = floor(temp) == temp ? String(Int(temp)) : String(temp)
                }
            }
            else {
                executeByAction(action: action,toAction: "+")
            }
            action = "+"
        case "-":
            if action == "-" || action == ""{
                if firstProcess {
                    inputTextField.text = resultLabel.text! + " - "
                    temp = Double(resultLabel.text!)!
                    firstProcess = false
                }
                else{
                    inputTextField.text = inputTextField.text! + resultLabel.text! + " - "
                    temp = temp + Double(resultLabel.text!)!
                    resultLabel.text = floor(temp) == temp ? String(Int(temp)) : String(temp)
                }
            }
            else {
                executeByAction(action: action,toAction: "-")
            }
            action = "-"
        case "=":
            executeByAction(action: action, toAction: "")
            firstProcess = true
            action = ""
        default:
            print("???")
        }
    }
    
    func executeByAction(action:String, toAction:String) -> Void {
        if action == "/" && resultLabel.text! == "0" {
            inputTextField.text = inputTextField.text! + resultLabel.text!
            resultLabel.text = "Error"
        }
        else {
            inputTextField.text = inputTextField.text! + resultLabel.text! + " \(toAction) "
            switch action {
            case "+":
                temp += Double(resultLabel.text!)!
            case "-":
                temp -= Double(resultLabel.text!)!
            case "*":
                temp *= Double(resultLabel.text!)!
            case "/":
                temp /= Double(resultLabel.text!)!
            default:
                print("default execute by action")
            }
            resultLabel.text = floor(temp) == temp ? String(Int(temp)) : String(temp)
        }
    }
}

