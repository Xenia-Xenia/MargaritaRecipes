//
//  MainViewController.swift
//  MargaritaRecipes
//
//  Created by Ксения Загарьева on 02.02.2024.
//

import UIKit

let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita")!

class MainViewController: UIViewController {

    @IBOutlet var margaritaButton: UIButton!
    
    private let networkManager = NetworkManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        margaritaButton.doGlowAnimation(withColor: UIColor.white)
        fetchDrinks()
    }
}

// MARK: - Networking
extension MainViewController {
    private func fetchDrinks() {
        networkManager.fetch(Drinks.self, from: url) { result in
            switch result {
            case .success(let drinks):
                print(drinks)
            case .failure(let error):
                print(error)
            }
        }
    }
}
