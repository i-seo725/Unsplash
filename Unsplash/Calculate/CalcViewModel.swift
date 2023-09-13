//
//  CalcViewModel.swift
//  Unsplash
//
//  Created by 이은서 on 2023/09/13.
//

import Foundation

class CalculateViewModel {
    
    var firstNum: CustomObservable<String?> = CustomObservable("10")
    var secondNum: CustomObservable<String?> = CustomObservable("20")
    var resultText = CustomObservable("결과: 30")
    var tempText = CustomObservable("임시 문자열")
    
    func calculate() {
        
        guard let first = firstNum.value, let firstConvertNum = Int(first) else {
            resultText.value = "첫번째 값에서 오류가 발생했습니다"
            return
        }
        guard let second = secondNum.value, let secondConvertNum = Int(second) else {
            resultText.value = "두번째 값에서 오류가 발생했습니다"
            return
        }
        
        resultText.value = "결과는 \(firstConvertNum + secondConvertNum)입니다"
        
    }
    
    func format(for number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(for: number)!
    }
    
    func presentNumberFormat() {
        guard let first = firstNum.value, let firstConvertNum = Int(first) else {
            resultText.value = "숫자가 아닙니다"
            return
        }
        tempText.value = format(for: firstConvertNum)
    }
}
