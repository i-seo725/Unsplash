//
//  LoginViewController.swift
//  Unsplash
//
//  Created by 이은서 on 2023/09/12.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var idTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        idTextField.addTarget(self, action: #selector(idTextFieldChanged), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(pwTextFieldChanged), for: .editingChanged)
        
        viewModel.id.bind { text in
            self.idTextField.text = text
            print(text)
        }
        
        viewModel.pw.bind { text in
            self.pwTextField.text = text
        }
        
        viewModel.isValid.bind { bool in
            self.loginButton.isEnabled = bool
            self.loginButton.backgroundColor = bool ? .green : .lightGray
        }
    }
    
    @objc func loginButtonClicked() {
        
        viewModel.signIn {
            print("로그인 성공") //로그인 성공/실패 여부는 뷰모델에서 검증하기 때문에 성공 했을 경우에 대해서만 작성하면 됨
        }
        
    }
    @objc func idTextFieldChanged() {
        viewModel.id.value = idTextField.text!
        viewModel.checkValidation()
    }
    @objc func pwTextFieldChanged() {
        viewModel.pw.value = pwTextField.text!
        viewModel.checkValidation()
    }
}
