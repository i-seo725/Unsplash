//
//  SampleViewController.swift
//  Unsplash
//
//  Created by 이은서 on 2023/09/12.
//

import UIKit

struct User {
    
    let name: String
    let age: Int
    var introduce: String {
        return "\(name), \(age)세"
    }
    
}



class SampleViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    let viewModel = SampleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        var number1 = 10
        var number2 = 23
        
        print(number1 - number2)
        
        number1 = 4
        number2 = 2
        
        //observable
        
        var number3 = Observable(22)
        var number4 = Observable(14)
        
        number3.bind { number in
            print("Observable", number3.value - number4.value)
        }
        
        number3.value = 123
        number3.value = 88
        number3.value = 191
    }
    
}


extension SampleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCell")!
        let data = viewModel.cellForRowAt(at: indexPath)
        cell.textLabel?.text = data.introduce
        return cell
    }
    
}
