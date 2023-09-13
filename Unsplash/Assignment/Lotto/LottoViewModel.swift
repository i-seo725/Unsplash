//
//  LottoViewModel.swift
//  Unsplash
//
//  Created by 이은서 on 2023/09/13.
//

import Foundation

class LottoViewModel {
    
    var date = LottoObservable("")
    var number1 = LottoObservable("")
    var number2 = LottoObservable("")
    var number3 = LottoObservable("")
    var number4 = LottoObservable("")
    var number5 = LottoObservable("")
    var number6 = LottoObservable("")
    var number7 = LottoObservable("")
    var money = LottoObservable("")
    
    func callRequest(drwNo: Int) {
        LottoNetworkManager.shared.callRequest(drwNo: drwNo) { data in
            self.date.value = data.drwNoDate
            self.number1.value = self.numToString(data.drwtNo1)
            self.number2.value = self.numToString(data.drwtNo2)
            self.number3.value = self.numToString(data.drwtNo3)
            self.number4.value = self.numToString(data.drwtNo4)
            self.number5.value = self.numToString(data.drwtNo5)
            self.number6.value = self.numToString(data.drwtNo6)
            self.number7.value = self.numToString(data.bnusNo)
            self.money.value = "당첨금 " + self.numberFormatter(number: data.totSellamnt) + "원"
        }
    }
    
    func numberFormatter(number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        guard let result = formatter.string(for: number) else { return "" }
        return result
    }
    
    func numToString(_ num: Int) -> String {
        return String(num)
    }
}
