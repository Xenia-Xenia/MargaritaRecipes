//
//  MainViewController.swift
//  MargaritaRecipes
//
//  Created by Ксения Загарьева on 02.02.2024.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {

    @IBOutlet var margaritaButton: UIButton!
    
    private let networkManager = NetworkManager.shared
    private var drinks: [Drinks] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        margaritaButton.doGlowAnimation(withColor: UIColor.white)
        networkManager.checkFetchedData()
    }
    
    private func fetchDrinks() {
        networkManager.fetchDrinks(from: Link.baseURL.url) { [unowned self] result in
            switch result {
            case .success(let drinks):
                self.drinks = drinks
                print(drinks)
            case .failure(let error):
                showAlert(withTitle: "Oops...", andMessage: error.localizedDescription)
            }
        }
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

