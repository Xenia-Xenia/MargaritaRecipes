//
//  ListViewController.swift
//  MargaritaRecipes
//
//  Created by Ксения Загарьева on 30.01.2024.
//

import UIKit



final class ListViewController: UITableViewController {
    
    private let networkManager = NetworkManager.shared
    private var drinks = Drinks(drinks: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDrinks()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let recipeVC = segue.destination as? RecipeViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        recipeVC.drink = drinks.drinks[indexPath.row]
    }
    
    //MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        drinks.drinks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath)
        guard let cell = cell as? DrinkCell else { return UITableViewCell() }
        let drink = drinks.drinks[indexPath.row]
        cell.configure(with: drink)
        
        return cell
    }
    
}
// MARK: - Networking
extension ListViewController {
    
    private func fetchDrinks() {
        networkManager.fetchDrinks(from: Link.baseURL.url) { [weak self] result in
            switch result {
            case .success(let drinks):
                self?.drinks.drinks = drinks
                self?.tableView.reloadData()
            case .failure(let error):
                self?.showAlert(withTitle: "Oops...", andMessage: error.localizedDescription)
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

