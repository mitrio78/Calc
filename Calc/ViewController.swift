//
//  ViewController.swift
//  Calc
//
//  Created by Дмитрий Гришечко on 17.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Variables
    
    var currentNumber: String?
    var savedNumber: String?
    var operation: Calculator?
    
    //MARK: - Outlets
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var changeSignButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var pointButton: UIButton!
    
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var stackFirstRow: UIStackView!
    
    @IBOutlet weak var resultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - LifeCycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureButton()
        configureLabel(currentNumber)
    }
    
    //MARK: - Button actions
    
    @IBAction func acButtonTap(_ sender: UIButton) {
        currentNumber = nil
        operation = nil
        savedNumber = nil
        updateLabel(currentNumber)
    }
    
    @IBAction func changeSignButtonTap(_ sender: UIButton) {
        if currentNumber != nil {
            let index = currentNumber!.startIndex
            if currentNumber![index] == "-" {
                currentNumber!.remove(at: index)
            } else {
                currentNumber!.insert("-", at: index)
            }
            updateLabel(currentNumber)
        } else if savedNumber != nil {
            let index = savedNumber!.startIndex
            if savedNumber![index] == "-" {
                savedNumber!.remove(at: index)
            } else {
                savedNumber!.insert("-", at: index)
            }
            updateLabel(savedNumber)
        } else { return }
    }
    
    @IBAction func percentButtonTap(_ sender: UIButton) {
        percent()
    }
    
    @IBAction func oneButtonTap(_ sender: UIButton) {
        addNumber("1")
    }
    
    @IBAction func twoButtonTap(_ sender: UIButton) {
        addNumber("2")
    }
    
    @IBAction func threeButtonTap(_ sender: UIButton) {
        addNumber("3")
    }
    
    @IBAction func fourButtonTap(_ sender: UIButton) {
        addNumber("4")
    }
    
    @IBAction func fiveButtonTap(_ sender: UIButton) {
        addNumber("5")
    }
    
    @IBAction func sixButtonTap(_ sender: UIButton) {
        addNumber("6")
    }
    
    @IBAction func sevenButtonTap(_ sender: UIButton) {
        addNumber("7")
    }
    
    @IBAction func eightButtonTap(_ sender: UIButton) {
        addNumber("8")
    }
    
    @IBAction func nineButtonTap(_ sender: UIButton) {
        addNumber("9")
    }
    
    @IBAction func zeroButtonTap(_ sender: UIButton) {
        addNumber("0")
    }
    
    @IBAction func pointButtonTap(_ sender: UIButton) {
        addNumber(".")
    }
    
    @IBAction func divideButtonTap(_ sender: UIButton) {
        evaluate(operation: .divide)
    }
    
    @IBAction func multiButtonTap(_ sender: UIButton) {
        evaluate(operation: .multiply)
    }
    
    @IBAction func minusButtonTap(_ sender: UIButton) {
        evaluate(operation: .substraction)
    }
    
    @IBAction func plusButtonTap(_ sender: UIButton) {
        evaluate(operation: .addition)
    }
    
    @IBAction func resultButtonTap(_ sender: UIButton) {
       showResult()
    }
    
    //MARK: - Views Configuration
    
    private func configureLabel(_ text: String?) {
        let text = text ?? "0"
        let height = resultLabel.frame.size.height
        var labeltextAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        labeltextAttributes[.font] = UIFont.systemFont(ofSize: height, weight: .semibold)
        let labelString = NSAttributedString(string: text, attributes: labeltextAttributes)
        resultLabel.attributedText = labelString
        resultLabel.textColor = .white
    }
    
    private func configureButton() {
        let buttonsArray: [UIButton] = [oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton, zeroButton, divideButton, multiplyButton, minusButton, plusButton, acButton, changeSignButton, percentButton, pointButton, resultButton]
        buttonsArray.forEach { button in
            var buttonTitle = ""
            switch button {
            case acButton:
                buttonTitle = "AC"
            case changeSignButton:
                buttonTitle = "+/-"
            case percentButton:
                buttonTitle = "%"
            case oneButton:
                buttonTitle = "1"
            case twoButton:
                buttonTitle = "2"
            case threeButton:
                buttonTitle = "3"
            case fourButton:
                buttonTitle = "4"
            case fiveButton:
                buttonTitle = "5"
            case sixButton:
                buttonTitle = "6"
            case sevenButton:
                buttonTitle = "7"
            case eightButton:
                buttonTitle = "8"
            case nineButton:
                buttonTitle = "9"
            case zeroButton:
                buttonTitle = "0"
            case divideButton:
                buttonTitle = "/"
            case multiplyButton:
                buttonTitle = "*"
            case plusButton:
                buttonTitle = "+"
            case minusButton:
                buttonTitle = "-"
            case resultButton:
                buttonTitle = "="
            case pointButton:
                buttonTitle = "."
            default:
                buttonTitle = ""
            }
            
            let buttonTextAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: button.frame.size.height / 2.6, weight: .semibold)]
            let buttonString = NSAttributedString(string: buttonTitle, attributes: buttonTextAttributes)
            button.setAttributedTitle(buttonString, for: .normal)
            zeroButton.layer.cornerRadius = zeroButton.frame.size.height / 2.5
            button.layer.cornerRadius = button.frame.size.height / 2.5
            button.clipsToBounds = true
            
            
            switch button {
            case oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton, zeroButton, pointButton, divideButton, multiplyButton, plusButton, minusButton, resultButton:
                button.tintColor = .white
            default:
                button.tintColor = .black
            }
        }
    }
    
    private func updateLabel(_ text: String?) {
        var text = text ?? "0"
        if text.hasSuffix(".0") {
            let number = Double(text)!
            text = "\(Int(round(number)))"
        }
        resultLabel.text = text
    }
    
    //MARK: - Calculations
    
    private func addNumber(_ buttonNum: String) {
            if buttonNum == "0" {
                if currentNumber != nil && currentNumber!.count < 9 {
                    currentNumber! += buttonNum
                } else {
                    return
                }
            } else if buttonNum == "." {
                if currentNumber != nil && currentNumber!.count < 9 {
                    currentNumber! += buttonNum
                } else if currentNumber != nil && currentNumber!.count == 9 {
                    return
                } else {
                    currentNumber = "0" + buttonNum
                }
            } else {
                if currentNumber != nil && currentNumber!.count < 9 {
                    currentNumber! += buttonNum
                } else if currentNumber != nil && currentNumber!.count == 9 {
                    return
                } else {
                    currentNumber = buttonNum
                }
            }
        resultLabel.text = currentNumber ?? "0"
    }
    
    private func evaluate(operation: Calculator?) {
        if let currentNumber = currentNumber, let savedNumber = savedNumber {
            if operation != nil {
                let first = Double(savedNumber)
                let second = Double(currentNumber)
                let result = self.operation?.evaluate(savedValue: first!, currentValue: second!)
                let resultString = "\(result!)"
                updateLabel(resultString)
                self.savedNumber = ""
                self.savedNumber?.append(resultString)
                self.currentNumber = nil
                self.operation = operation
            } else {
                self.operation = operation
                let first = Double(savedNumber)
                let second = Double(currentNumber)
                let result = self.operation?.evaluate(savedValue: first!, currentValue: second!)
                let resultString = "\(result!)"
                updateLabel(resultString)
                self.savedNumber = ""
                self.savedNumber?.append(resultString)
                self.currentNumber = nil
            }
        } else if currentNumber != nil {
            self.operation = operation
            savedNumber = ""
            savedNumber?.append(self.currentNumber!)
            self.currentNumber = nil
        } else if savedNumber != nil {
            self.operation = operation
        } else { return }
    }
    
    private func percent() {
        if currentNumber != nil && savedNumber != nil && operation != nil {
            currentNumber = "\(Double(savedNumber!)! / 100 * Double(currentNumber!)!)"
            updateLabel(currentNumber)
        } else if let number = currentNumber {
            currentNumber = "\(Double(number)! / 100)"
            updateLabel(currentNumber)
        } else if let number = savedNumber {
            savedNumber = "\(Double(number)! / 100)"
            updateLabel(savedNumber)
        } else { return }
    }
    
    private func showResult() {
        if operation != nil {
            if let currentNumber = currentNumber, let savedNumber = savedNumber {
                let first = Double(savedNumber)
                let second = Double(currentNumber)
                let result = operation?.evaluate(savedValue: first!, currentValue: second!)
                let resultString = "\(result!)"
                updateLabel(resultString)
                self.savedNumber = ""
                self.savedNumber?.append(resultString)
                self.currentNumber = nil
            } else if savedNumber != nil {
                currentNumber = ""
                currentNumber?.append(savedNumber!)
                let first = Double(savedNumber!)
                let second = Double(currentNumber!)
                let result = operation?.evaluate(savedValue: first!, currentValue: second!)
                let resultString = "\(result!)"
                updateLabel(resultString)
                self.savedNumber = ""
                self.savedNumber?.append(resultString)
                self.currentNumber = nil
            } else { return }
        } else { return }
    }
}
