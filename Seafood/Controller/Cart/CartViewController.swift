//
//  CartViewController.swift
//  Zoo
//
//  Created by Riza on 2/15/21.
//

import UIKit
import Firebase

class CartViewController: UIViewController {
    
    let cartVCModel = CartVCModel()
    var ref: DatabaseReference!
    var selectedMenus = [Menu]()
    var totalSum: Int = 0
    var menusCount: Int = 0
    
    unowned var cartView: CartView { return self.view as! CartView }
    unowned var scrollView: UIScrollView { return cartView.scrollView as UIScrollView }
    unowned var sumLabel: UILabel { return cartView.sumLabel as UILabel }
    unowned var productsCountNumberLabel: UILabel { return cartView.productsCountNumberLabel as UILabel }
    unowned var tableView: UITableView { return cartView.tableView as UITableView }
    unowned var checkoutButtonContainer: UIView { return cartView.checkoutButtonContainer as UIView }
    unowned var checkoutButton: UIButton { return cartView.checkoutButton as UIButton }
    unowned var goToCatalogButton: UIButton { return cartView.goToCatalogButton as UIButton }
    unowned var activityView: UIActivityIndicatorView { return cartView.activityView as UIActivityIndicatorView }
    unowned var buttonContainer: UIView { return cartView.buttonContainer as UIView }
    unowned var emptyCartImageView: UIImageView { return cartView.emptyCartImageView as UIImageView }
    unowned var emptyCartLabel: UILabel { return cartView.emptyCartLabel as UILabel }
    unowned var secondaryLabel: UILabel { return cartView.secondaryLabel as UILabel }
    
    override func loadView() {
        self.view = CartView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Корзина"

        ref = Database.database().reference()
        handleViewLoading()
        handleActions()
        
        handleNotifications()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
        handleFetchedMenus()
        handleViews()
        handleNotifications()
        
        
    }
    
    //MARK: - Handling Views
    
    func handleViewLoading() {

        cartView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9483965039, blue: 0.9680580497, alpha: 1)
        checkoutButtonContainer.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        checkoutButton.isEnabled = false
        
    }
    
    func handleFetchedMenus() {
        
        cartVCModel.fetchMenu(ref: ref) { selectedMenus in
            
            DispatchQueue.main.async { [self] in
                self.selectedMenus = selectedMenus
                setupFilledView()
                activityView.stopAnimating()
            }
        }
        
    }
    
    func handleViews() {
      
        if selectedMenus.count == 0 {
            cartView.setupEmptyView()
            activityView.stopAnimating()
        }
        
    }
    
    func setupFilledView() {
        
        cartView.setupFilledView()
        fetchSum()
        setupTableView()
        productsCountNumberLabel.text = selectedMenus.count.description
        tableView.reloadData()
        checkoutButtonContainer.backgroundColor = #colorLiteral(red: 0.631372549, green: 0.0431372549, blue: 0.1647058824, alpha: 1)
        checkoutButton.isEnabled = true

    }
    //MARK: - Menu Details Functions
    
    func handleNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(getSum(notification:)), name: Notification.Name("sum"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(deleteMenu(notitfication:)), name: Notification.Name("deletion"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(clearData), name: Notification.Name("clear"), object: nil)
    }
    
    @objc func clearData(notification: Notification) {
        if let _ = notification.object as? String {
            cartView.setupEmptyView()
        }
    }
    
    @objc func getSum(notification: Notification) {

        if let sum = notification.object as? Int {
            sumLabel.text = "\(sum.description) тг"

        }

    }
    
    @objc func deleteMenu(notitfication: Notification) {
        
        if let menu = notitfication.object as? String {
            
            selectedMenus = selectedMenus.filter(){$0.name != menu}
            
            handleViews()
            
            productsCountNumberLabel.text = selectedMenus.count.description
            tableView.reloadData()
            fetchSum()
            
        }
        
    }
    
    func fetchSum() {
        totalSum = cartVCModel.fetchSum(ref: ref, sumLabel: sumLabel)
    }
    
    //MARK: - IBActions
    
    func handleActions() {
        
        goToCatalogButton.addTarget(self, action: #selector(goToCatalog), for: .touchUpInside)
        checkoutButton.addTarget(self, action: #selector(goToCheckoutVC), for: .touchUpInside)
        
    }
    
    @objc func goToCatalog() {
        self.tabBarController?.selectedIndex = 0
    }
    
    @objc func goToCheckoutVC() {
        
        let checkoutVC = CheckoutViewController()
        let title = "Назад"
        checkoutVC.navigationItem.backButtonTitle = title
        
        self.navigationController?.pushViewController(checkoutVC, animated: true)
        
    }
    
    
    
}


//MARK: - Extensions

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedMenus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier,
                                                    for: indexPath) as? CartTableViewCell {
            
            cell.configureCell(with: cell, at: indexPath, with: selectedMenus)
            return cell
        }
        
        return CartTableViewCell()
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 90, width: view.frame.width, height: view.frame.height - 300)
        tableView.alwaysBounceVertical = true
        
    }
    
    
}

extension UIViewController {
    
    var topBarHeight: CGFloat {
        var top = self.navigationController?.navigationBar.frame.height ?? 0.0
        if #available(iOS 13.0, *) {
            top += UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            top += UIApplication.shared.statusBarFrame.height
        }
        return top
    }
    
}
