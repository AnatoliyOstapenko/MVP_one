//
//  DetailViewController.swift
//  MVP_one
//
//  Created by AnatoliiOstapenko on 17.03.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var presenter: DetailPresenter?
    
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setItem()
    }

}
// MARK: - DetailViewProtocol

extension DetailViewController: DetailViewProtocol {
    func setItem(data: FakeAPI?) {
        detailLabel.text = data?.text
    }
}
