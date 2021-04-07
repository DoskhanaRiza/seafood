//
//  OrderDetailsViewController.swift
//  Seafood
//
//  Created by Riza on 3/9/21.
//

import UIKit
import Firebase

class OrderDetailsViewController: UIViewController {
    
    let historyDataModel = HistoryDataModel()
    var orderMenus = [OrderDetails]()
    var ref: DatabaseReference!
    var count = 0
    //IBOutlets
    unowned var orderDetailsView: OrderDetailsView { return self.view as! OrderDetailsView }
    unowned var tableView: UITableView { return orderDetailsView.tableView as UITableView }
    unowned var scrollView: UIScrollView { return orderDetailsView.scrollView as UIScrollView }
    unowned var cartContainer: UIView { return orderDetailsView.cartContainer as UIView }
    unowned var deliveryTypeContainer: UIView { return orderDetailsView.deliveryTypeContainer as UIView }
    unowned var paymentTypeLabel: UILabel { return orderDetailsView.paymentTypeLabel as UILabel }
    unowned var paymentTypeImageView: UIImageView { return orderDetailsView.paymentTypeImageView as UIImageView }
    unowned var deliveryTypeLabel: UILabel { return orderDetailsView.deliveryTypeLabel as UILabel }
    unowned var deliveryTypeImageView: UIImageView { return orderDetailsView.deliveryTypeImageView as UIImageView }
    unowned var activityView: UIActivityIndicatorView { return orderDetailsView.activityView as UIActivityIndicatorView }
    unowned var detailedAddressLabel: UILabel { return orderDetailsView.detailedAddressLabel as UILabel }
    unowned var orderDateLabel: UILabel { return orderDetailsView.orderDateLabel as UILabel }
    unowned var sumLabel: UILabel { return orderDetailsView.sumLabel as UILabel }
    unowned var orderSumLabel: UILabel { return orderDetailsView.orderSumLabel as UILabel }
    unowned var totalOrderSumLabel: UILabel { return orderDetailsView.totalOrderSumLabel as UILabel }
    unowned var userNameLabel: UILabel { return orderDetailsView.userNameLabel as UILabel }
    unowned var phoneNumberLabel: UILabel { return orderDetailsView.phoneNumberLabel as UILabel }
    
    
    override func loadView() {
        self.view = OrderDetailsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        handleViewLoading()
        fetchOrderMenus()
        
    }
    
    func handleViewLoading() {
        
        orderDetailsView.scrollView.isHidden = true
        orderDetailsView.backgroundColor = #colorLiteral(red: 0.9171851277, green: 0.9205198884, blue: 0.9522905946, alpha: 1)
        activityView.startAnimating()
        orderDetailsView.addSubview(activityView)
        
    }
    
}





//MARK: - Table View Extension

extension OrderDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderMenus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: OrderDetailsTableViewCell.identifier,
                                                    for: indexPath) as? OrderDetailsTableViewCell {
            
            let order = orderMenus[indexPath.row]
            
            cell.foodImageView.image = UIImage(named: order.name)
            cell.nameLabel.text = order.name
            cell.priceLabel.text = "\(order.price.description) тг /"
            cell.numberLabel.text = "\(order.count.description) шт"
            
            return cell
            
        }
        
        return OrderDetailsTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isUserInteractionEnabled = false
        tableView.backgroundColor = #colorLiteral(red: 0.9171851277, green: 0.9205198884, blue: 0.9522905946, alpha: 1)
        
        let height = orderMenus.count * 80 + 30
        tableView.frame = CGRect(x: 0, y: 550, width: Int(view.frame.width), height: height)
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1500 + CGFloat(height))
        
    }
    
    
}

extension OrderDetailsViewController {
    
    func fetchOrderMenus() {
        
        historyDataModel.fetchOrderMenus(ref: ref) { [self] (orderMenus) in
            
           
            DispatchQueue.main.async {
                
                self.orderMenus = orderMenus
                setupTableView()
                tableView.reloadData()
                orderDetailsView.scrollView.isHidden = false
                activityView.stopAnimating()

            }
        }
        
        
        
    }
}
