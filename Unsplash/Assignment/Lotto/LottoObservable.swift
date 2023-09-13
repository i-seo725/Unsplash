//
//  LottoObservable.swift
//  Unsplash
//
//  Created by 이은서 on 2023/09/13.
//

import Foundation

class LottoObservable<T> {
    
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    
    func bind(_ handler: @escaping (T) -> Void) {
        handler(value)
        listener = handler
    }
    
}
