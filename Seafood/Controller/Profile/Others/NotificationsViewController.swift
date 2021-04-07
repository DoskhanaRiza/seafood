//
//  NotificationsViewController.swift
//  Zoo
//
//  Created by Riza on 2/16/21.
//

import UIKit

class NotificationsViewController: UIViewController {
    
    override func loadView() {
        
        self.view = NotificationsView()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Уведомления"
        
    }
    
    
        
        
        
}


