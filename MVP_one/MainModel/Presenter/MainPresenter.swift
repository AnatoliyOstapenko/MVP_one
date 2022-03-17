//
//  MainPresenter.swift
//  MVP_one
//
//  Created by AnatoliiOstapenko on 16.03.2022.
//

import Foundation

// set AnyObject word after protocol to make weak reference
// MainViewProtocol is abstraction from Dependency Inversion (SOLID)
protocol MainViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getData()
    var array: [FakeAPI?] { get set }
}

class MainPresenter: MainViewPresenterProtocol {
    
    var array: [FakeAPI?] = []
    weak var view: MainViewProtocol? // set weak reference to avoid of memory leak
    let networkService: NetworkServiceProtocol
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
    }

    func getData() {
        networkService.getData { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let arrayFromNetwork):
                    self?.array = arrayFromNetwork
                    self?.view?.succes()
                case .failure(let error):
                    self?.view?.failure(error: error)
                }
            }
            
        }
    }

}
