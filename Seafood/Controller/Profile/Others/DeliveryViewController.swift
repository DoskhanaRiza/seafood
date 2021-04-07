//
//  DeliveryViewController.swift
//  Zoo
//
//  Created by Riza on 2/16/21.
//

import UIKit

class DeliveryViewController: UIViewController {

    override func loadView() {
        self.view = DeliveryView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Условия доставки"
        
    }
    
    
}
