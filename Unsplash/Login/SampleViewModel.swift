//
//  SampleViewModel.swift
//  Unsplash
//
//  Created by 이은서 on 2023/09/12.
//

import Foundation

class SampleViewModel {     //모델과 컨트롤러 간의 중간관리자
    
    var list = [User(name: "은서", age: 25), User(name: "메로나", age: 29), User(name: "목캔디", age: 35), User(name: "더위사냥", age: 40)]
    
    var numberOfRowsInSection: Int {
        return list.count
    }
    
    func cellForRowAt(at indexPath: IndexPath) -> User {
        return list[indexPath.row]
    }
}
