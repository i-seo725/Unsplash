//
//  PhotoViewController.swift
//  Unsplash
//
//  Created by 이은서 on 2023/09/12.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var viewModel = PhotoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchPhoto()
        viewModel.list.bind { _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
}

extension PhotoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell")!
        let data = viewModel.cellForRowAt(at: indexPath)
        viewModel.loadPhoto(at: indexPath) { data in
            print("핸들러 실행?")
            cell.imageView?.image = UIImage(data: data)
            self.tableView.reloadData()
        }
        cell.backgroundColor = .lightGray
        
        return cell
    }
    
}
