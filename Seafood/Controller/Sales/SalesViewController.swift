//
//  SalesViewController.swift
//  Zoo
//
//  Created by Riza on 2/15/21.
//

import UIKit

class SalesViewController: UIViewController {
    
    override func loadView() {
        self.view = NotificationsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9529411765, alpha: 1)
        navigationItem.title = "Акции"
    }
    

    


}
