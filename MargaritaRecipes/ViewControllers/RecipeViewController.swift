//
//  RecipeViewController.swift
//  MargaritaRecipes
//
//  Created by Ксения Загарьева on 30.01.2024.
//

import UIKit

final class RecipeViewController: UIViewController {
    
    private let networkManager = NetworkManager.shared

    @IBOutlet var recipeLabel: UILabel!
    @IBOutlet var ingredientsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
