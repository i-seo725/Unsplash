//
//  Observable.swift
//  Unsplash
//
//  Created by 이은서 on 2023/09/12.
//

import Foundation

class Observable<T> {
    
    //alert 띄우거나 변경된 닉네임을 label에 보여주기, 화면 전환, 네트워크 통신 등등...
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        print(#function)
        closure(value)
        listener = closure
    }
 
    
}
