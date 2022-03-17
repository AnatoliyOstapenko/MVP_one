//
//  ViewController.swift
//  MVP_one
//
//  Created by AnatoliiOstapenko on 16.03.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol?
    
    @IBOutlet weak var mvpTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Have to registrate a cell, there is no possibility to add cell in storyboard
        mvpTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        mvpTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    



}
// MARK: - Data Source
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "MVP pattern test \(indexPath.row)"
        return cell
    }
    
    
}




// MARK: - Main View Protocol
extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
       
    }
    
    
}

