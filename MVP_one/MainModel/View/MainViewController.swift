//
//  ViewController.swift
//  MVP_one
//
//  Created by AnatoliiOstapenko on 16.03.2022.
//

import UIKit

class MainViewController: UIViewController {
    
// MARK: - IBOutlets
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    var presenter: MainViewPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
// MARK: - IBAction
    
    @IBAction func buttonPressed(_ sender: Any) {
        presenter?.showGreeting()
    }


}
extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        greetingLabel.text = greeting
    }
    
    
}

