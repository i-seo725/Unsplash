//
//  CacluateViewController.swift
//  Unsplash
//
//  Created by 이은서 on 2023/09/13.
//

import UIKit

class CacluateViewController: UIViewController {

    @IBOutlet var firstTextField: UITextField!
    @IBOutlet var secondTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    
    let viewModel = CalculateViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstTextField.addTarget(self, action: #selector(firstTextChanged), for: .editingChanged)
        secondTextField.addTarget(self, action: #selector(secondTextChanged), for: .editingChanged)
        
        viewModel.firstNum.bind { number in
            self.firstTextField.text = number
        }

        viewModel.secondNum.bind { number in
            self.secondTextField.text = number
        }
        
        viewModel.resultText.bind { text in
            self.resultLabel.text = text
        }
        
        viewModel.tempText.bind { text in
            self.tempLabel.text = text
        }
        
    }
   
    @objc func firstTextChanged() {
        viewModel.firstNum.value = firstTextField.text
        viewModel.calculate()
        viewModel.presentNumberFormat()
    }

    @objc func secondTextChanged() {
        viewModel.secondNum.value = secondTextField.text
        viewModel.calculate()
    }
    
}


/*
 let person = Person("eunseo")
 person.name = "x"
 person.name = "사또밥"
 
 person.introduce { value in
     self.resultLabel.text = value
     self.view.backgroundColor = [UIColor.systemYellow, UIColor.systemOrange, UIColor.systemPink].randomElement()!
 }
 
 DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
     person.name = "은서이"
     print("1초 뒤")
 }
 
 DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
     person.name = "소고깅"
     print("2초 뒤")
 }
 
 firstTextField.text = viewModel.firstNum.value
 secondTextField.text = viewModel.secondNum.value

 */
