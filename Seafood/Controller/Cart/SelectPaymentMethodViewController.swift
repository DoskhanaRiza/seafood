//
//  SelectPaymentMethodViewController.swift
//  Seafood
//
//  Created by Riza on 2/23/21.
//

import UIKit
import Firebase

class SelectPaymentMethodViewController: UIViewController {

    var ref: DatabaseReference!
    //IBOutlets
    unowned var selectPaymentMethodView: SelectPaymentMethodView { return self.view as! SelectPaymentMethodView }
    unowned var checkingPaymentButton: UIButton { return selectPaymentMethodView.checkingPaymentButton as UIButton }
    unowned var kaspiButton: UIButton { return selectPaymentMethodView.kaspiButton as UIButton }
    unowned var onlinePaymentButton: UIButton { return selectPaymentMethodView.onlinePaymentButton as UIButton }
    unowned var transferButton: UIButton { return selectPaymentMethodView.transferButton as UIButton }
    unowned var cardAccountNumberLabel: UILabel { return selectPaymentMethodView.cardAccountNumberLabel as UILabel }
    unowned var cardAccountLabelContainer: UIView { return selectPaymentMethodView.cardAccountLabelContainer as UIView }
    unowned var checkingCheckImageView: UIImageView { return selectPaymentMethodView.checkingCheckImageView as UIImageView }
    unowned var kaspiCheckImageView: UIImageView { return selectPaymentMethodView.kaspiCheckImageView as UIImageView }
    unowned var transferCheckImageView: UIImageView { return selectPaymentMethodView.transferCheckImageView as UIImageView }
    unowned var onlinePaymentCheckImageView: UIImageView { return selectPaymentMethodView.onlinePaymentCheckImageView as UIImageView }
    unowned var sumLabel: UILabel { return selectPaymentMethodView.sumLabel as UILabel }
    unowned var confirmOrderButton: UIButton { return selectPaymentMethodView.confirmOrderButton as UIButton }
    
    override func loadView() {
        self.view = SelectPaymentMethodView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        fetchSum()
        navigationItem.title = "Оплата"
//        setupCheckingView()
        handleActions()
        
    }
   
    func handleActions() {
        
        confirmOrderButton.addTarget(self, action: #selector(confirmOrder), for: .touchUpInside)
        checkingPaymentButton.addTarget(self, action: #selector(checkingPaymentButtonPressed(sender:)), for: .touchUpInside)
        kaspiButton.addTarget(self, action: #selector(kaspiButtonPressed(sender:)), for: .touchUpInside)
        onlinePaymentButton.addTarget(self, action: #selector(onlinePaymentButtonPressed(sender:)), for: .touchUpInside)
        transferButton.addTarget(self, action: #selector(transferButtonPressed(sender:)), for: .touchUpInside)
        
    }
    
    @objc func confirmOrder() {
        
        showAlert()
        clearDatabase()
        NotificationCenter.default.post(name: Notification.Name("clear"), object: "clear", userInfo: nil)
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "Спасибо",
                                      message: "Ваш заказ принят",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Продолжить",
                                      style: .default,
                                      handler: { (action) in
                                        self.goToCatalogVC()
        }))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func goToCatalogVC() {
        self.tabBarController?.selectedIndex = 0
    }
    
    func clearDatabase() {
        
        let selectedRef = ref.child("selectedMenu")
        selectedRef.removeValue()
            
    }
    
    @objc func checkingPaymentButtonPressed(sender: UIButton) {
        
        selectPaymentMethodView.setupCheckingView()
        let paymentRef = ref.child("Orders").child("OrderNumber\(1)").child("PaymentMethod")
        paymentRef.setValue("На расчетный счет")
        
    }
    
    @objc func kaspiButtonPressed(sender: UIButton) {
        
        selectPaymentMethodView.setupKaspiView()
        let paymentRef = ref.child("Orders").child("OrderNumber\(1)").child("PaymentMethod")
        paymentRef.setValue("Kaspi QR / Kaspi Red")
        
    }
    
    @objc func transferButtonPressed(sender: UIButton) {
        
        selectPaymentMethodView.setupTransferView()
        let paymentRef = ref.child("Orders").child("OrderNumber\(1)").child("PaymentMethod")
        paymentRef.setValue("Перевод на карту")
        
    }
    
    @objc func onlinePaymentButtonPressed(sender: UIButton) {
        
        selectPaymentMethodView.setupOnlineView()
        let paymentRef = ref.child("Orders").child("OrderNumber\(1)").child("PaymentMethod")
        paymentRef.setValue("Онлайн оплата")
        
    }
    
}

extension SelectPaymentMethodViewController {
    
    private func fetchSum() {
        
        let sumRef = ref.child("selectedMenu").child("totalSum")
        
        sumRef.observeSingleEvent(of: .value) { [self] (snapshot) in
            let sum = snapshot.value as! Int
            sumLabel.text = "\(sum.description) тг"
            let sumRef = ref.child("Orders").child("OrderNumber\(1)").child("TotalSum")
            sumRef.setValue(sum)
            
        }
    }
    
    
}
