//
//  MainViewController.swift
//  MargaritaRecipes
//
//  Created by Ксения Загарьева on 02.02.2024.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var margaritaButton: UIButton!
    
    private let networkManager = NetworkManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        margaritaButton.doGlowAnimation(withColor: UIColor.white)
    }
}

// MARK: - Networking
extension MainViewController {
}
