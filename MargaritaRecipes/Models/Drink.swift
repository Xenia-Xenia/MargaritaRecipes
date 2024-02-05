//
//  Cocktail.swift
//  CocktailRecipies
//
//  Created by Ксения Загарьева on 30.01.2024.
//

import Foundation

struct Drinks: Decodable {
    let drinks: [Drink]
}

struct Drink: Decodable {
    let strDrink: String
    let strAlcoholic: String
    let strGlass: String
    let strInstructions: String
    let strDrinkThumb: URL
    let strIngredient1: String
    let strIngredient2: String
    let strIngredient3: String
    let strIngredient4: String
    let strIngredient5: String
    let strIngredient6: String
    let strIngredient7: String
    let strMeasure1: String
    let strMeasure2: String
    let strMeasure3: String
    let strMeasure4: String
    let strMeasure5: String
    let strMeasure6: String
    let strMeasure7: String
    
   var shortDescription: String {
       """
       \(strDrink)
       \(strAlcoholic)
       """
    }
}

enum DrinksAPI {
    case baseURL
    
    var url: URL {
        switch self {
        case .baseURL:
            return URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita")!
        }
    }
    
}
