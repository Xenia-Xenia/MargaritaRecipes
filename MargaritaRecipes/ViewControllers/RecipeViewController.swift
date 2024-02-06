//
//  RecipeViewController.swift
//  MargaritaRecipes
//
//  Created by Ксения Загарьева on 30.01.2024.
//

import UIKit

final class RecipeViewController: UIViewController {
    
    @IBOutlet var recipeLabel: UILabel!
    @IBOutlet var ingredientsLabel: UILabel!
    
    private let networkManager = NetworkManager.shared
    var drink: Drink!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()

    }

    private func setupLabels() {
        recipeLabel.text = 
                        """
                        Recipe:
                        \(drink.strInstructions)
                        """
        ingredientsLabel.text = drink.ingredients
    }
}
