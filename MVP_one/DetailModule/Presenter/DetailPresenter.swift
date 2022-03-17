//
//  DetailPresenter.swift
//  MVP_one
//
//  Created by AnatoliiOstapenko on 17.03.2022.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setItem(data: FakeAPI?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, item: FakeAPI?)
    func setItem()
    
}

class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol
    let item: FakeAPI?
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, item: FakeAPI?) {
        self.view = view
        self.networkService = networkService
        self.item = item
    }
    
    func setItem() {
        self.view?.setItem(data: item)
    }
    
    
    
}
