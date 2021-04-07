//
//  HistoryDataModel.swift
//  Seafood
//
//  Created by Riza on 3/16/21.
//

import UIKit
import Firebase

class HistoryDataModel {
    
    var orderDetails = [OrderDetails]()
    //    func handleViews(ref: DatabaseReference,
    //                     tableView: UITableView,
    //                     activityView: UIActivityIndicatorView ,
    //                     setupEmptyView: @escaping () -> Void,
    //                     setupTableView: @escaping () -> Void,
    //                     handleActions: @escaping () -> Void) -> [History]{
    //
    //        var history = [History]()
    //        let ordersRef = ref.child("Orders")
    //        ordersRef.observeSingleEvent(of: .value) { [self] (snapshot) in
    //
    //            if snapshot.exists() {
    //                print("exists")
    //                history = fetchOrderDetails(ref: ref,
    //                                            setupTableView: setupTableView,
    //                                            tableView: tableView,
    //                                            activityView: activityView)
    //
    //            } else {
    //                setupEmptyView()
    //                handleActions()
    //            }
    //        }
    //        return history
    //    }
    //
    func fetchOrderDetails(ref: DatabaseReference,
                           completion: @escaping ([History]) -> Void) {
        
        var history = [History]()
        let orderRef = ref.child("Orders").child("OrderNumber1")
        
        orderRef.observeSingleEvent(of: .value) { (snapshot) in
            
            if let values = snapshot.value as? [String : Any] {
                
                if let address = values["Address"] as? String,
                   let date = values["Date"] as? String,
                   let totalSum = values["TotalSum"] as? Int,
                   let name = values["Name"] as? String,
                   let phoneNumber = values["PhoneNumber"] as? String,
                   let paymentMethod = values["PaymentMethod"] as? String,
                   let deliveryType = values["DeliveryType"] as? String {
                    
                    let order = History(date: date,
                                        name: name,
                                        number: phoneNumber,
                                        sum: totalSum,
                                        deliveryType: deliveryType,
                                        address: address,
                                        paymentMethod: paymentMethod)
                    
                    history.append(order)
                    completion(history)
                }
            }
        }
    }
    
    
    
    func setOrderDetails(orderDetailsVC: OrderDetailsViewController, order: History) {
        
        orderDetailsVC.detailedAddressLabel.text = order.address
        orderDetailsVC.orderDateLabel.text = order.date
        orderDetailsVC.sumLabel.text = "\(order.sum.description) тг"
        orderDetailsVC.orderSumLabel.text = "\(order.sum.description) тг"
        orderDetailsVC.totalOrderSumLabel.text = "\(order.sum.description) тг"
        orderDetailsVC.userNameLabel.text = order.name
        orderDetailsVC.phoneNumberLabel.text = order.number
        
        if order.paymentMethod == "Kaspi QR / Kaspi Red" {
            orderDetailsVC.paymentTypeImageView.image = UIImage(named: "kaspi")
        } else if order.paymentMethod == "На расчетный счет" {
            orderDetailsVC.paymentTypeImageView.image = UIImage(named: "checking")
        } else if order.paymentMethod == "Перевод на карту" {
            orderDetailsVC.paymentTypeImageView.image = UIImage(named: "transfer")
        } else if order.paymentMethod == "Онлайн оплата" {
            orderDetailsVC.paymentTypeImageView.image = UIImage(named: "online")
        }
        
        if order.deliveryType == "Доставка" {
            orderDetailsVC.deliveryTypeImageView.image = UIImage(named: "delivery")
        } else {
            orderDetailsVC.deliveryTypeImageView.image = UIImage(named: "takeaway")
        }
        
    }
    
    func fetchOrderMenus(ref: DatabaseReference, completion: @escaping ([OrderDetails]) -> Void) {
        
        self.orderDetails = []
        let orderMenuRef = ref.child("Orders").child("OrderNumber\(1)").child("Order")
        
        orderMenuRef.observeSingleEvent(of: .value) { [self] (snapshot) in
            
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                
                if let menu = snap.value as? [String : Any] {
                    
                    if let count = menu["count"] as? Int,
                       let name = menu["name"] as? String,
                       let price = menu["price"] as? Int {
                        
                        let order = OrderDetails(name: name, count: count.description, price: price)
                        orderDetails.append(order)
                        completion(orderDetails)
                    }
                }
            }
            
            
        }
        
        
    }
    
    func setTableView(orderDetailsVC: OrderDetailsViewController, orderMenu: [OrderDetails]) {
        
        orderDetailsVC.orderMenus = orderMenu
        
    }
}
