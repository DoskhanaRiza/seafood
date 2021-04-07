//
//  CheckoutViewController.swift
//  Seafood
//
//  Created by Riza on 2/23/21.
//

import UIKit
import Firebase

class CheckoutViewController: UIViewController {
   
    var ref: DatabaseReference!
    var totalSum: Int = 0
    let toolBar = UIToolbar()
    let checkoutVCModel = CheckoutVCModel()
    //IBOutlets
    unowned var checkoutView: CheckoutView { return self.view as! CheckoutView }
    unowned var selectPaymentMethodButton: UIButton { return checkoutView.selectPaymentMethodButton as UIButton }
    unowned var dateButton: UIButton { return checkoutView.dateButton as UIButton }
    unowned var addressButton: UIButton { return checkoutView.addressButton as UIButton }
    unowned var timeButton: UIButton { return checkoutView.timeButton as UIButton }
    unowned var takeawayButton: UIButton { return checkoutView.takeawayButton as UIButton }
    unowned var deliveryButton: UIButton { return checkoutView.deliveryButton as UIButton }
    unowned var clearButton: UIButton { return checkoutView.clearButton as UIButton }
    unowned var datePicker: UIDatePicker { return checkoutView.datePicker as UIDatePicker }
    unowned var timePicker: UIDatePicker { return checkoutView.timePicker as UIDatePicker }
    unowned var deliveryCheckImageView: UIImageView { return checkoutView.deliveryCheckImageView as UIImageView }
    unowned var takeawayCheckImageView: UIImageView { return checkoutView.takeawayCheckImageView as UIImageView }
    unowned var selectPaymentMethodButtonContainer: UIView { return checkoutView.selectPaymentMethodButton as UIView }
    unowned var nameTextField: UITextField { return checkoutView.nameTextField as UITextField }
    unowned var phoneTextField: UITextField { return checkoutView.phoneTextField as UITextField }
    unowned var chosenAddressLabel: UILabel { return checkoutView.chosenAddressLabel as UILabel }
    unowned var chosenDateLabel: UILabel { return checkoutView.chosenDateLabel as UILabel }
    unowned var chosenTimeLabel: UILabel { return checkoutView.chosenTimeLabel as UILabel }
    unowned var sumLabel: UILabel { return checkoutView.sumLabel as UILabel }
    unowned var activityView: UIActivityIndicatorView { return checkoutView.activityView as UIActivityIndicatorView }
    unowned var dateButtonContainer: UIView { return checkoutView.dateButtonContainer as UIView }
    unowned var bigContainer: UIView { return checkoutView.bigContainer as UIView }
    unowned var deliveryDetailsContainer: UIView { return checkoutView.deliveryDetailsContainer as UIView }

    override func loadView() {
        self.view = CheckoutView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        navigationItem.title = "Доставка"
        fetchSum()
        handleSelectPaymentMethodButton()
        handleActions()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // Handling Actions
    func handleActions() {
        
        addressButton.addTarget(self, action: #selector(goToDistrictSelection), for: .touchUpInside)
        dateButton.addTarget(self, action: #selector(handleDatePicker), for: .touchUpInside)
        timeButton.addTarget(self, action: #selector(handleTimePicker), for: .touchUpInside)
        
        deliveryButton.addTarget(self, action: #selector(deliveryButtonPressed(sender:)), for: .touchUpInside)
        takeawayButton.addTarget(self, action: #selector(takeawayButtonPressed(sender:)), for: .touchUpInside)
        
        selectPaymentMethodButton.addTarget(self, action: #selector(goToselectPaymentMethodVC), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(clearButtonPressed), for: .touchUpInside)
        
    }
    
    //MARK: - Actions
    
    @objc func clearButtonPressed() {
        
        if deliveryDetailsContainer.isHidden {
            
            bigContainer.frame = CGRect(x: 0, y: 321, width: checkoutView.frame.width, height: 252)
            chosenDateLabel.text = "Не указано"
            chosenTimeLabel.text = "Не указано"
            
        } else {
            
            bigContainer.frame = CGRect(x: 0, y: 491, width: checkoutView.frame.width, height: 252)
            chosenDateLabel.text = "Не указано"
            chosenTimeLabel.text = "Не указано"
            
        }
        
        
    }
        
    @objc func addressButtonPressed() {
        goToDistrictSelection()
    }
    
//    @objc func handleDatePicker() {
//        checkoutVCModel.handleDatePicker(datePicker: datePicker, toolBar: toolBar, deliveryDetailsContainer: deliveryDetailsContainer, bigContainer: bigContainer, tabBarController: self.tabBarController ?? UITabBarController(), view: checkoutView)
//    }
//
//    @objc func handleTimePicker() {
//        checkoutVCModel.handleTimePicker(timePicker: timePicker, toolBar: toolBar, bigContainer: bigContainer, tabBarController: self.tabBarController ?? UITabBarController(), view: checkoutView)
//    }
    
//     Date picker
    @objc func handleDatePicker() {

        self.datePicker.frame = CGRect(x: 0,
                                       y: view.frame.height - 200 - (self.tabBarController?.tabBar.frame.height ?? 100),
                                       width: view.frame.width,
                                       height: 200)

        datePicker.backgroundColor = .gray
        view.addSubview(datePicker)
        datePicker.isHidden = false

        let doneButton = UIBarButtonItem(title: "Готово", style: .plain, target: self , action: #selector(dateSelected))
        handleToolbar(picker: datePicker, doneButton: doneButton)

        print("date selected")
        if deliveryDetailsContainer.isHidden {
            bigContainer.frame = CGRect(x: 0, y: 351, width: view.frame.width, height: 252)
        } else {
            bigContainer.frame = CGRect(x: 0, y: 521, width: view.frame.width, height: 252)
        }

    }

    @objc func dateSelected() {

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        chosenDateLabel.text = dateFormatter.string(from: datePicker.date)

        toolBar.isHidden = true
        datePicker.isHidden = true

        // assigning date to the order
        let date = chosenDateLabel.text
        let dateRef = ref.child("Orders").child("OrderNumber\(1)").child("Date")
        dateRef.setValue(date)

    }

    // Time picker
    @objc func handleTimePicker() {

        self.timePicker.frame = CGRect(x: 0,
                                       y: view.frame.height - 200 - (self.tabBarController?.tabBar.frame.height ?? 100),
                                       width: view.frame.width,
                                       height: 200)

        timePicker.backgroundColor = .gray
        view.addSubview(timePicker)

        let doneButton = UIBarButtonItem(title: "Готово", style: .plain, target: self , action: #selector(timeSelected))
        handleToolbar(picker: timePicker, doneButton: doneButton)
        timePicker.isHidden = false

        bigContainer.frame = CGRect(x: 0, y: 521, width: view.frame.width, height: 252)

    }

    @objc func timeSelected() {

        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .none
        chosenTimeLabel.text = dateFormatter.string(from: timePicker.date)
        toolBar.isHidden = true
        timePicker.isHidden = true

    }

    // Toolbar
    func handleToolbar(picker: UIDatePicker, doneButton: UIBarButtonItem) {

        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()

        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([doneButton, spaceButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.frame = CGRect(x: 0,
                               y:  view.frame.height - 240 - (self.tabBarController?.tabBar.frame.height ?? 100),
                               width: view.frame.width,
                               height: 40)

        toolBar.backgroundColor = .black
        view.addSubview(toolBar)
        toolBar.isHidden = false
        picker.isHidden = false

    }
    
    
    @objc func deliveryButtonPressed(sender: UIButton) {
        
        checkoutView.setupDeliveryView()
        // assigning delivery type of the order
        let deliveryRef = ref.child("Orders").child("OrderNumber\(1)").child("DeliveryType")
        deliveryRef.setValue("Доставка")
        
    }
    
    @objc func takeawayButtonPressed(sender: UIButton) {
        
        checkoutView.setupTakeawayViews()
        // assigning delivery type of ordered menu
        let deliveryRef = ref.child("Orders").child("OrderNumber\(1)").child("DeliveryType")
        deliveryRef.setValue("Самовывоз")
        
        // assigning address of ordered menu
        let orderedRef = ref.child("Orders").child("OrderNumber\(1)").child("Address")
        let address = "г. Алматы, пр. Гагарина, 236Б"
        orderedRef.setValue(address)
    }
    
    @objc func goToselectPaymentMethodVC() {
        
        let selectPaymentMethodVC = SelectPaymentMethodViewController()
        selectPaymentMethodVC.navigationItem.backButtonTitle = title
        self.navigationController?.pushViewController(selectPaymentMethodVC, animated: true)
        
    }
    
    @objc func goToDistrictSelection() {
        
        let districtSelectionVC = DistrictSelectionViewController()
        districtSelectionVC.selectedDistrictDelegate = self
        self.navigationController?.pushViewController(districtSelectionVC, animated: true)
        
    }
    
    // Handling SelectPaymentMethod Button
    func handleSelectPaymentMethodButton() {
        
        selectPaymentMethodButton.isEnabled = false
        selectPaymentMethodButtonContainer.backgroundColor = .lightGray
        
        nameTextField.addTarget(self, action: #selector(enableSelectPaymentButton(sender:)), for: .editingChanged)
        phoneTextField.addTarget(self, action: #selector(enableSelectPaymentButton(sender:)), for: .editingChanged)
    
    }
    
    @objc func enableSelectPaymentButton(sender: UITextField) {
        
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        
        guard let name = nameTextField.text, !name.isEmpty ,
              let phoneNumber = phoneTextField.text, !phoneNumber.isEmpty,
              let address = chosenAddressLabel.text, address != "Не указано",
              let date = chosenDateLabel.text, date != "Не указано"
        else {
            selectPaymentMethodButton.isEnabled = false
            return
        }
        
        phoneTextField.text = phoneNumber.applyPatternOnNumbers(pattern:  "+# ### ### ####", replacmentCharacter: "#")
        selectPaymentMethodButton.isEnabled = true
        selectPaymentMethodButtonContainer.backgroundColor = #colorLiteral(red: 0.6317038536, green: 0.04253879189, blue: 0.1677871644, alpha: 1)
        
        // assigning phone number of order
        let numberRef = ref.child("Orders").child("OrderNumber\(1)").child("PhoneNumber")
        numberRef.setValue(phoneNumber)
        
        // assigning name of orderer
        let nameRef = ref.child("Orders").child("OrderNumber\(1)").child("Name")
        nameRef.setValue(name)
        
    }
    
    //MARK: - SelectedDistrict Protocol
 
}

extension CheckoutViewController: SelectedDistrict {
    
    func selectDistrict(district: Address) {
        
        guard let street = UserDefaults.standard.value(forKey: "street") else { return }
        guard let home = UserDefaults.standard.value(forKey: "home") else { return }
        chosenAddressLabel.text = "\(street),\(home)"
        // assigning address of the order
        let address = chosenAddressLabel.text
        let orderedRef = ref.child("Orders").child("OrderNumber\(1)").child("Address")
        orderedRef.setValue(address)
    }
    
    
}

extension UILabel {

    func addImageWith(name: String, behindText: Bool) {

        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: name)
        let attachmentString = NSAttributedString(attachment: attachment)

        guard let txt = self.text else {
            return
        }

        if behindText {
            
            let strLabelText = NSMutableAttributedString(string: txt)
            strLabelText.append(attachmentString)
            self.attributedText = strLabelText
            
        } else {
            
            let strLabelText = NSAttributedString(string: txt)
            let mutableAttachmentString = NSMutableAttributedString(attributedString: attachmentString)
            mutableAttachmentString.append(strLabelText)
            self.attributedText = mutableAttachmentString
        }
    }
}

extension CheckoutViewController {
    
    private func fetchSum() {
        let sumRef = ref.child("selectedMenu").child("totalSum")
        sumRef.observeSingleEvent(of: .value) { [self] (snapshot) in
            if let sum = snapshot.value as? Int {
                sumLabel.text = "\(sum.description) тг"

            }
        }
    }
    
}
