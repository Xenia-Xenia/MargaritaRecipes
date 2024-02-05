//
//  DrinkCell.swift
//  MargaritaRecipes
//
//  Created by Ксения Загарьева on 02.02.2024.
//

import UIKit

final class DrinkCell: UITableViewCell {
    
    @IBOutlet var drinkImage: UIImageView!
    @IBOutlet var drinkName: UILabel!
    
    private let networkManager = NetworkManager.shared
    
    func configure(with drink: Drink) {
            drinkName.text = drink.strDrink
            
            networkManager.fetchImage(from: drink.strDrinkThumb) { [unowned self] result in
            switch result {
            case .success(let imageData):
                drinkImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
     }
}
 
