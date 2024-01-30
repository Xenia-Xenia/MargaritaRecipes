//
//  ListViewController.swift
//  MargaritaRecipes
//
//  Created by Ксения Загарьева on 30.01.2024.
//

import UIKit



final class ListViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDrink()
    }


}

// MARK: - Networking
extension ListViewController {
    
    private func fetchDrink() {
        
        let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita")!
        
        URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let drinkInfo = try JSONDecoder().decode(Drinks.self, from: data)
                print(drinkInfo)
            } catch {
                print(error)
            }
            
        }.resume()
    }
}
