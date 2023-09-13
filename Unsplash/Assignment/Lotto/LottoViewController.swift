//
//  LottoViewController.swift
//  Unsplash
//
//  Created by 이은서 on 2023/09/13.
//

import UIKit

class LottoViewController: UIViewController {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var number1: UILabel!
    @IBOutlet var number2: UILabel!
    @IBOutlet var number3: UILabel!
    @IBOutlet var number4: UILabel!
    @IBOutlet var number5: UILabel!
    @IBOutlet var number6: UILabel!
    @IBOutlet var number7: UILabel!
    @IBOutlet var moneyLabel: UILabel!
    
    var viewModel = LottoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.callRequest(drwNo: 1000)
        bindData()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.viewModel.callRequest(drwNo: 1025)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.viewModel.callRequest(drwNo: 1035)
        }
    }
    
    func bindData() {
        
        viewModel.date.bind { value in
            self.dateLabel.text = value
        }
        
        viewModel.number1.bind { value in
            self.number1.text = value
        }
        
        viewModel.number2.bind { value in
            self.number2.text = value
        }
        
        viewModel.number3.bind { value in
            self.number3.text = value
        }
        
        viewModel.number4.bind { value in
            self.number4.text = value
        }
        
        viewModel.number5.bind { value in
            self.number5.text = value
        }
        
        viewModel.number6.bind { value in
            self.number6.text = value
        }
        
        viewModel.number7.bind { value in
            self.number7.text = value
        }
        
        viewModel.money.bind { value in
            self.moneyLabel.text = value
        }
    }
    
    
}
