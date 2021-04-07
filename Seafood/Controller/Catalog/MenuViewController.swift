//
//  MenuViewController.swift
//  Seafood
//
//  Created by Riza on 2/22/21.
//

import UIKit
import Firebase

class MenuViewController: UIViewController {

    let collectionView = UICollectionView(frame: UIView().frame, collectionViewLayout: UICollectionViewLayout())
    var menus = [Menu]()
    var ref: DatabaseReference!
    let menuDetails = MenuDetails()
    var menuDataModel: Menu?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9529411765, alpha: 1)
        setupCollectionView()
        ref = Database.database().reference()
        
    }
    
    func setupCollectionView() {
        
        view.addSubview(collectionView)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 2.5, right: 10)
        layout.itemSize = CGSize(width: view.frame.width, height: 270)
        
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.frame = self.view.frame
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
        collectionView.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9529411765, alpha: 1)
        collectionView.alwaysBounceVertical = true
        
    }

}

extension MenuViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier,
                                                         for: indexPath) as? MenuCollectionViewCell {
            
            cell.configureMenuCell(cell: cell, menuArray: menus, indexPath: indexPath)
            
            return cell
        }
        
        return MenuCollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2 - 20, height: 270)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let menuDetailsVC = MenuDetailsViewController()
        let name = menus[indexPath.row].name
        menuDetailsVC.title = name
        menuDetailsVC.menuDetails = menuDetails.showMenuDetails(name: name, indexPath: indexPath)
        self.navigationController?.pushViewController(menuDetailsVC, animated: true)
        
    }
    
    
    
}
