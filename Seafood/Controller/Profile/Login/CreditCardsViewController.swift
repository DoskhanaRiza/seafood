//
//  CreditCardsViewController.swift
//  Seafood
//
//  Created by Riza on 2/20/21.
//

import UIKit

class CreditCardsViewController: UIViewController {
    
    override func loadView() {
        self.view = CreditCardsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Банковские карты"
        
    }
    
   
    

}
