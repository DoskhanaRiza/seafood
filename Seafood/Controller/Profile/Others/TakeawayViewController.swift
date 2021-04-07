//
//  TakeawayViewController.swift
//  Zoo
//
//  Created by Riza on 2/16/21.
//

import UIKit

class TakeawayViewController: UIViewController {

    override func loadView() {
        
        self.view = TakeawayView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Условия самовывоза"

    }
    
    
    

}
