//
//  ViewController.swift
//  Zoo
//
//  Created by Riza on 2/15/21.
//

import UIKit
import Firebase

class CatalogViewController: UIViewController {
    
    let catalogDataModel = CatalogDataModel()
    var ref: DatabaseReference!
    let notifications = Notifications()
    //IBOutlets
    unowned var catalogView: CatalogView { return self.view as! CatalogView }
    unowned var collectionView: UICollectionView { return catalogView.collectionView as UICollectionView }
    unowned var searchButton: UIButton { return catalogView.searchButton as UIButton }
    unowned var cartButton: UIButton { return catalogView.cartButton as UIButton }
    unowned var productsCountLabel: UILabel { return catalogView.productsCountLabel as UILabel }
    
    override func loadView() {
        self.view = CatalogView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notifications.sendNotifiaction()
        navigationItem.title = "Каталог"
        ref = Database.database().reference()
        checkInternetConnection()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        catalogDataModel.getSelectedMenusCount(productsCountLabel: productsCountLabel, ref: ref)
        
    }
    
    //MARK: - Loading views functions
    
    func checkInternetConnection() {
        
        if currentReachabilityStatus == .notReachable {
            showNoInternetAlert()
        } else {
            loadViews()
        }
    }
    
    func loadViews() {
        
        setupButtons()
        setupCollectionView()
        catalogDataModel.getSelectedMenusCount(productsCountLabel: productsCountLabel, ref: ref)
        
    }
    
    func showNoInternetAlert() {
        
        let alert = UIAlertController(title: "Ошибка",
                                      message: "Нет подключения к интернету",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Продолжить",
                                      style: .default,
                                      handler: { (action) in
                                        self.showAnotherNoInternetAlert()
                                      }))
        
        present(alert, animated: true, completion: nil)
    }
    
    func showAnotherNoInternetAlert() {
        
        let alert = UIAlertController(title: "Ошибка",
                                      message: "Нет подключения к интернету",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Продолжить",
                                      style: .default,
                                      handler: { (action) in
                                        self.checkInternetConnection()
                                      }))
        
        present(alert, animated: true, completion: nil)
    }
    
    func setupCollectionView() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 2.5, right: 10)
        layout.itemSize = CGSize(width: view.frame.width, height: 170)
        
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.frame = self.view.frame
        
    }
    
    func setupButtons() {
        
        searchButton.addTarget(self, action: #selector(goToSearchVC), for: .touchUpInside)
        let goToSearchButton = UIBarButtonItem(customView: searchButton)
        
        cartButton.addSubview(productsCountLabel)
        cartButton.addTarget(self, action: #selector(goToCartVC), for: .touchUpInside)
        let goToCartButton = UIBarButtonItem(customView: cartButton)
        
        self.navigationItem.rightBarButtonItems = [goToCartButton, goToSearchButton]
        
    }
    
    @objc func goToCartVC() {
        self.tabBarController?.selectedIndex = 1
    }
    
    @objc func goToSearchVC() {
        
        let searchVC = SearchViewController()
        let title = ""
        searchVC.navigationItem.backButtonTitle = title
        self.navigationController?.pushViewController(searchVC, animated: true)
        
    }
    
    
}

//MARK: - CollectionView Extension

extension CatalogViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width / 2 - 20, height: 170)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        catalogDataModel.catalog.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogCollectionViewCell.identifier,
                                                         for: indexPath) as? CatalogCollectionViewCell {
            
            let catalog = catalogDataModel.catalog[indexPath.row]
            
            cell.catalogImageView.image = catalog.image
            cell.catalogNameLabel.text = catalog.name
            
            return cell
            
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let name = catalogDataModel.catalog[indexPath.row].name
        
        let menuVC = MenuViewController()
        self.navigationController?.pushViewController(menuVC, animated: true)
        menuVC.navigationItem.title = name
        menuVC.menus = catalogDataModel.goToMenu(name: name)
        
    }
    
    
}
