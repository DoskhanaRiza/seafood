//
//  CheckoutVCModel.swift
//  Seafood
//
//  Created by Riza on 3/19/21.
//

import UIKit
import Firebase

class CheckoutVCModel {
    
    //    let toolBar = UIToolbar()
    //    let chosenTimeLabel = UILabel()
    //    let chosenDateLabel = UILabel()
    //    let bigContainer = UIView()
    //    let deliveryDetailsContainer = UIView()
    //    let datePicker = UIDatePicker()
    //    let timePicker = UIDatePicker()
    var ref: DatabaseReference!
    let view = CheckoutView()
    unowned var checkoutView: CheckoutView { return self.view }
    let tabBarController = UITabBarController()
    let toolBar = UIToolbar()
//    let chosenDateLabel = UILabel()
    let chosenTimeLabel = UILabel()
    unowned var datePicker: UIDatePicker {return checkoutView.datePicker }
    unowned var chosenDateLabel: UILabel { return checkoutView.chosenDateLabel }
    let timePicker = UIDatePicker()

    func handleDatePicker(datePicker: UIDatePicker,
                          toolBar: UIToolbar,
                          deliveryDetailsContainer: UIView,
                          bigContainer: UIView,
                          tabBarController: UITabBarController, view: UIView) {
        
        datePicker.frame = CGRect(x: 0,
                                  y: view.frame.height - 200 - (tabBarController.tabBar.frame.height),
                                  width: view.frame.width,
                                  height: 200)
        
        datePicker.backgroundColor = .gray
        view.addSubview(datePicker)
        datePicker.isHidden = false
        
        let doneButton = UIBarButtonItem(title: "Готово", style: .plain, target: self , action: #selector(dateSelected))
        handleToolbar(toolBar: toolBar, picker: datePicker, doneButton: doneButton, tabBarController: tabBarController, view: view)
        
        if deliveryDetailsContainer.isHidden {
            bigContainer.frame = CGRect(x: 0, y: 351, width: view.frame.width, height: 252)
        } else {
            bigContainer.frame = CGRect(x: 0, y: 521, width: view.frame.width, height: 252)
        }
        
    }
    
    @objc func dateSelected() {

//        let toolBar = UIToolbar()
//        let datePicker = checkoutView.datePicker
//        let chosenDateLabel = checkoutView.chosenDateLabel
        let ref = Database.database().reference()
        let dateFormatter = DateFormatter()
        print("done pressed")
//        print(checkoutView.chosenAddressLabel.text)
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        chosenDateLabel.text = dateFormatter.string(from: datePicker.date)

        toolBar.isHidden = true
        datePicker.isHidden = true

//         assigning date to the order
        print(datePicker.date)
        let date = chosenDateLabel.text
        let dateRef = ref.child("Orders").child("OrderNumber\(1)").child("Date")
        dateRef.setValue(date)

    }
    
    // Time picker
    func handleTimePicker(timePicker: UIDatePicker,toolBar: UIToolbar, bigContainer: UIView, tabBarController: UITabBarController, view: UIView) {
        
        timePicker.frame = CGRect(x: 0, y: view.frame.height - 200 - (tabBarController.tabBar.frame.height), width: view.frame.width, height: 200)
        timePicker.backgroundColor = .gray
        view.addSubview(timePicker)
        
        let doneButton = UIBarButtonItem(title: "Готово", style: .plain, target: self , action: #selector(timeSelected))
        handleToolbar(toolBar: toolBar, picker: timePicker, doneButton: doneButton, tabBarController: tabBarController, view: view)
        timePicker.isHidden = false
        
        bigContainer.frame = CGRect(x: 0, y: 521, width: view.frame.width, height: 252)
        
    }
    
    @objc func timeSelected() {
        
//        let toolBar = UIToolbar()
        let timePicker = UIDatePicker()
        let chosenTimeLabel = UILabel()
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .none
        chosenTimeLabel.text = dateFormatter.string(from: timePicker.date)
        toolBar.isHidden = true
        timePicker.isHidden = true
        
    }
    
    
    // Toolbar
    private func handleToolbar(toolBar: UIToolbar, picker: UIDatePicker, doneButton: UIBarButtonItem, tabBarController: UITabBarController, view: UIView) {
        
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([doneButton, spaceButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.frame = CGRect(x: 0, y:  view.frame.height - 240 - (tabBarController.tabBar.frame.height), width: view.frame.width, height: 40)
        toolBar.backgroundColor = .black
        view.addSubview(toolBar)
        toolBar.isHidden = false
        picker.isHidden = false
        
    }
    
    
}
