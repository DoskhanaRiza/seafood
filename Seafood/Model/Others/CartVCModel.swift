//
//  CartVCModel.swift
//  Seafood
//
//  Created by Riza on 3/16/21.
//

import Foundation
import Firebase

class CartVCModel {
    
    var selectedMenus = [Menu]()

//    func getSelectedMenusCount(ref: DatabaseReference,
//                                       sumLabel: UILabel,
//                                       setupFilledView:  @escaping () -> Void,
//                                       setupTableView:  @escaping () -> Void,
//                                       setupEmptyView:  @escaping () -> Void) -> [Menu]{
//        var selectedMenus = [Menu]()
//        selectedMenus = []
//        let menuRef = ref.child("selectedMenu")
//        menuRef.observeSingleEvent(of: .value) { [self] (snapshot) in
//            
//            let count = snapshot.childrenCount
//                if count == 0 {
//                    print("it is zero")
//                    setupEmptyView()
//
//                } else {
//                    print("it is \(count)")
//                    
//                    DispatchQueue.main.async {
//                        setupFilledView()
//                        setupTableView()
//                    }
//                    
//
//                }
//        }
//    }
    
    func fetchMenu(ref: DatabaseReference,
                   completion: @escaping ([Menu]) -> Void) {
        
        self.selectedMenus = []
        let menuRef = ref.child("selectedMenu")
        menuRef.observeSingleEvent(of: .value) { [self] (snapshot) in
            
            for child in snapshot.children {
                
                let snap = child as! DataSnapshot
                if let menu = snap.value as? [String : Any] {
                    
                    if let name = menu["name"] as? String ,
                       let count = menu["count"] as? Int,
                       let price = menu["price"] as? Int {
                        
                        let newMenu = Menu(name: name, price: price, image: UIImage(named: "\(name)"), count: count)
                        selectedMenus.append(newMenu)
                        completion(selectedMenus)
                        // adding menus to ordered list
                        
                    }
                    
                }
            }
        }
        
    }
    
    func fetchSum(ref: DatabaseReference, sumLabel: UILabel) -> Int{
        
        var totalSum = 0
        
        let sumRef = ref.child("selectedMenu").child("totalSum")
        
        sumRef.observeSingleEvent(of: .value) { (snapshot) in
            if let sum = snapshot.value as? Int {
                totalSum = sum
                sumLabel.text = "\(totalSum.description) тг"
            }
        }
        return totalSum
    }
    
//    private func addToOrderedDB(name: String, price: Int, count: Int, sum: Int, ref: DatabaseReference) {
//        
//        let orderedRef = ref.child("Orders").child("OrderNumber\(1)").child("menus").child(name)
//        let values = ["name" : name, "count" : count, "price" : price, "sum" : sum] as [String : Any]
//        orderedRef.updateChildValues(values)
//        
//    }
    
    
}
