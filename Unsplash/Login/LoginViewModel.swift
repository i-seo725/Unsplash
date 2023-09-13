//
//  LoginViewModel.swift
//  Unsplash
//
//  Created by 이은서 on 2023/09/12.
//

import Foundation

class LoginViewModel {
    
    var id = Observable("")
    var pw = Observable("")
    var isValid = Observable(false)
    
    func checkValidation() {
        if id.value.count >= 6 && pw.value.count >= 4 {
            isValid.value = true
        } else {
            isValid.value = false
        }
    }
    
    func signIn(completionHandler: @escaping () -> Void) {
        //서버에 검증, 닉네임/아이디 값 유저디폴트에 저장 등
        UserDefaults.standard.set(id.value, forKey: "id")
        completionHandler() //얼럿 띄우기, 화면 전환하기는 뷰컨트롤러에서 구현해라
    }
    
}
