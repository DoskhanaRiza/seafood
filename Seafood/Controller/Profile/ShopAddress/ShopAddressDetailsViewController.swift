//
//  AddressDetailsViewController.swift
//  Zoo
//
//  Created by Riza on 2/16/21.
//

import UIKit

class ShopAddressDetailsViewController: UIViewController {

    override func loadView() {
        
        self.view = ShopAddressDetailsView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Морепродукты КЗ"
        
    }
    
  
}
