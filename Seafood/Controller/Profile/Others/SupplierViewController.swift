//
//  SupplierViewController.swift
//  Zoo
//
//  Created by Riza on 2/16/21.
//

import UIKit

class SupplierViewController: UIViewController {
    
    override func loadView() {
        
        self.view = SupplierView()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Поставщикам"
            
    }
    
   
    

}
