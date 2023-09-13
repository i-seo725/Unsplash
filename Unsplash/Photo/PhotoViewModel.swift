//
//  PhotoViewModel.swift
//  Unsplash
//
//  Created by 이은서 on 2023/09/12.
//

import Foundation

class PhotoViewModel {
    
    var list = Observable(Photo(total: 0, total_pages: 0, results: []))
    
    var numberOfRowsInSection: Int {
        return list.value.results?.count ?? 0
    }

    func fetchPhoto() {
        APIService.shared.searchPhoto(query: "bear") { photo in
            guard let photo else { return }
            self.list.value = photo
        }
    }
    
    func loadPhoto(at indexPath: IndexPath, handler: @escaping (_ data: Data) -> Void) {
        guard let url = URL(string: "\(list.value.results?[indexPath.row].urls.thumb)") else {
            return }
      
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else {
                print("데이터 없음")
                return }
            DispatchQueue.main.async {
                print("핸들러 실행")
                handler(data)
                
            }
        }
    }
    
    func cellForRowAt(at indexPath: IndexPath) -> PhotoResult {
        return list.value.results![indexPath.row]
    }
    
}
