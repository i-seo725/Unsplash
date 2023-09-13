//
//  ViewController.swift
//  Unsplash
//
//  Created by 이은서 on 2023/09/11.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var changeButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nicknameTextField.placeholder = "nickname_placeholder".localized
//        let value = NSLocalizedString("nickname_result", comment: "")
//        resultLabel.text = String(format: value, "은서", "최고")
        
        resultLabel.text = "age_result".localized(number: 28)
        
        let mybar = UISearchBar()
        mybar.text = "aasd"
        mybar.placeholder = " ddddd kkkkkk "
    }
    
    
   
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }


}

