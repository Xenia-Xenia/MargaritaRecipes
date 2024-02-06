//
//  DrinkCell.swift
//  MargaritaRecipes
//
//  Created by Ксения Загарьева on 02.02.2024.
//

import UIKit

final class DrinkCell: UITableViewCell {
    
    @IBOutlet var drinkImage: UIImageView!
    @IBOutlet var drinkNameLabel: UILabel!
    @IBOutlet var drinkCategoryLabel: UILabel!
    @IBOutlet var alcoholContentLabel: UILabel!
    
    private let networkManager = NetworkManager.shared
    
    func configure(with drink: Drink) {
        drinkNameLabel.text = drink.strDrink
        drinkCategoryLabel.text = drink.strCategory
        alcoholContentLabel.text = drink.strAlcoholic
        
        networkManager.fetchImage(from: drink.strDrinkThumb) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.drinkImage.image = UIImage(data: imageData)
            case .failure(let error):
                self?.networkManager.fetchDefaultImage(from: Link.baseURL.url) { [unowned self] result in
                    switch result {
                    case .success(let defaultImage):
                        self?.drinkImage.image = UIImage(data: defaultImage)
                    case .failure(let error):
                        print(error)
                    }
                    print(error)
                }
            }
        }
    }
    
}
