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
    func setGreeting(greeting: String)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, person: FakeAPI)
    func showGreeting()
}

class MainPresenter: MainViewPresenterProtocol {
    let view: MainViewProtocol
    let person: FakeAPI
    
    required init(view: MainViewProtocol, person: FakeAPI) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = self.person.firstName + " " + self.person.lastName
        self.view.setGreeting(greeting: greeting)
    }
    
    
    
}
