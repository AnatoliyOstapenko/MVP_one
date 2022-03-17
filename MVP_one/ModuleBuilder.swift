//
//  ModuleBuilder.swift
//  MVP_one
//
//  Created by AnatoliiOstapenko on 16.03.2022.
//

import Foundation
import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
    static func createDetailModule(item: FakeAPI?) -> UIViewController
}


class ModuleBuilder: Builder {
    
    static func createDetailModule(item: FakeAPI?) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, item: item)
        view.presenter = presenter
        return view
    }
    
    // Method to use in SceneDelegate
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
        
    }
    
    
}
