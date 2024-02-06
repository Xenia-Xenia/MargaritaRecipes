//
//  Cocktail.swift
//  CocktailRecipies
//
//  Created by Ксения Загарьева on 30.01.2024.
//

import Foundation

struct Drinks: Decodable {
    let drinks: [Drink]
    
    init(drinks: [Drink]) {
        self.drinks = drinks
    }
    
    init(drinksDetails: [String: [Any]]) {
        drinks = drinksDetails["drinks"] as? [Drink] ?? []
    }
    
    static func getDrinks(from value: Any) -> [Drinks] {
        guard let drinksDetails = value as? [[String: [Any]]] else { return [] }
        return drinksDetails.map { Drinks(drinksDetails: $0)}
    }
}

struct Drink: Decodable {
    let strDrink: String
    let strCategory: String
    let strAlcoholic: String
    let strInstructions: String
    let strDrinkThumb: String
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
    
    init(
        strDrink: String,
        strCategory: String,
        strAlcoholic: String,
        strInstructions: String,
        strDrinkThumb: String,
        strIngredient1: String,
        strIngredient2: String,
        strIngredient3: String,
        strIngredient4: String,
        strIngredient5: String,
        strIngredient6: String,
        strIngredient7: String,
        strMeasure1: String,
        strMeasure2: String,
        strMeasure3: String,
        strMeasure4: String,
        strMeasure5: String,
        strMeasure6: String,
        strMeasure7: String
    ) {
        self.strDrink = strDrink
        self.strCategory = strCategory
        self.strAlcoholic = strAlcoholic
        self.strInstructions = strInstructions
        self.strDrinkThumb = strDrinkThumb
        self.strIngredient1 = strIngredient1
        self.strIngredient2 = strIngredient2
        self.strIngredient3 = strIngredient3
        self.strIngredient4 = strIngredient4
        self.strIngredient5 = strIngredient5
        self.strIngredient6 = strIngredient6
        self.strIngredient7 = strIngredient7
        self.strMeasure1 = strMeasure1
        self.strMeasure2 = strMeasure2
        self.strMeasure3 = strMeasure3
        self.strMeasure4 = strMeasure4
        self.strMeasure5 = strMeasure5
        self.strMeasure6 = strMeasure6
        self.strMeasure7 = strMeasure7
    }
    
    init(drinkDetails: [String: Any]) {
        strDrink = drinkDetails["strDrink"] as? String ?? ""
        strCategory = drinkDetails["strCategory"] as? String ?? ""
        strAlcoholic = drinkDetails["strAlcoholic"] as? String ?? ""
        strInstructions = drinkDetails["strInstructions"] as? String ?? ""
        strDrinkThumb = drinkDetails["strDrinkThumb"] as? String ?? ""
        strIngredient1 = drinkDetails["strIngredient1"] as? String ?? ""
        strIngredient2 = drinkDetails["strIngredient2"] as? String ?? ""
        strIngredient3 = drinkDetails["strIngredient3"] as? String ?? ""
        strIngredient4 = drinkDetails["strIngredient4"] as? String ?? ""
        strIngredient5 = drinkDetails["strIngredient5"] as? String ?? ""
        strIngredient6 = drinkDetails["strIngredient6"] as? String ?? ""
        strIngredient7 = drinkDetails["strIngredient7"] as? String ?? ""
        strMeasure1 = drinkDetails["strMeasure1"] as? String ?? ""
        strMeasure2 = drinkDetails["strMeasure2"] as? String ?? ""
        strMeasure3 = drinkDetails["strMeasure3"] as? String ?? ""
        strMeasure4 = drinkDetails["strMeasure4"] as? String ?? ""
        strMeasure5 = drinkDetails["strMeasure5"] as? String ?? ""
        strMeasure6 = drinkDetails["strMeasure6"] as? String ?? ""
        strMeasure7 = drinkDetails["strMeasure7"] as? String ?? ""
    }
}
