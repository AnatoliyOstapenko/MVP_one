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
}

class BuilderModel: Builder {
    static func createMainModule() -> UIViewController {
        let person = Person(firstName: "Winston", lastName: "Smith")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, person: person)
        view.presenter = presenter
        return view
        
    }
    
    
}
