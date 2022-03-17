//
//  NetworkService.swift
//  MVP_one
//
//  Created by AnatoliiOstapenko on 17.03.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func getData(completion: @escaping(Result <[FakeAPI?], Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    func getData(completion: @escaping (Result<[FakeAPI?], Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else { return }
            do {
                let data = try JSONDecoder().decode([FakeAPI].self, from: data)
                completion(.success(data))
            } catch { completion(.failure(error))}
        }
        task.resume()
    }
    
    
}
