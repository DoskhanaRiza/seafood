//
//  ZooTabBarController.swift
//  Zoo
//
//  Created by Riza on 2/15/21.
//

import UIKit

class SeafoodTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let catalogVC = UINavigationController(rootViewController: CatalogViewController())
        catalogVC.tabBarItem.image = UIImage(named: "catalog")
        catalogVC.tabBarItem.title = "Каталог"
        
        let cartVC = UINavigationController(rootViewController: CartViewController())
        cartVC.tabBarItem.image = UIImage(named: "cart")
        cartVC.tabBarItem.title = "Корзина"
        
        let salesVC = UINavigationController(rootViewController: SalesViewController())
        salesVC.tabBarItem.image = UIImage(named: "sales")
        salesVC.tabBarItem.title = "Акции"
        
        let historyVC = UINavigationController(rootViewController: HistoryViewController())
        historyVC.tabBarItem.image = UIImage(named: "history")
        historyVC.tabBarItem.title = "История"
        
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        profileVC.tabBarItem.image = UIImage(named: "profile")
        profileVC.tabBarItem.title = "Профиль"
        
        viewControllers = [catalogVC, cartVC, salesVC, historyVC, profileVC]
        
    }

   
    

}
