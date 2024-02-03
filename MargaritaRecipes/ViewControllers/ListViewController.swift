//
//  ListViewController.swift
//  MargaritaRecipes
//
//  Created by Ксения Загарьева on 30.01.2024.
//

import UIKit



final class ListViewController: UITableViewController {
    
    private var drinks: [Drink] = []
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        drinks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath)
        guard let cell = cell as? DrinkCell else { return UITableViewCell() }
        let drink = drinks[indexPath.row]
        cell.configure(with: drink)
        return cell
    }
    
}

// MARK: - Networking
/* extension ListViewController {
    func fetchDrinks() {
        
        let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita")!
        
        networkManager.fetch([Drink].self, from: url) { [weak self] result in
            
            guard let self else { return }
            switch result {
            case .success(let drinks):
                tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
} */
/* // MARK: - Networking
extension ListViewController {
    func fetchDrinks() {
        
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
} */
