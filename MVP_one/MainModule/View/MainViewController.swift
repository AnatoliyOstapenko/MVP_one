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
        mvpTableView.delegate = self
    }

}
// MARK: - Data Source
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.array.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = presenter?.array[indexPath.row]?.text
        return cell
    }
}
// MARK: - Delegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let array = presenter?.array[indexPath.row]
        let detailVC = ModuleBuilder.createDetailModule(item: array)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - MainViewProtocol
extension MainViewController: MainViewProtocol {
    func succes() {
        mvpTableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    
}

