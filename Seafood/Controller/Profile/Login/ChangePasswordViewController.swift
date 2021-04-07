//
//  ChangePasswordViewController.swift
//  Seafood
//
//  Created by Riza on 2/20/21.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    
    let changePasswordVCModel = ChangePasswordVCModel()
    //IBOutlets
    unowned var changePasswordView: ChangePasswordView { return self.view as! ChangePasswordView }
    unowned var oldPasswordTextField: UITextField { return changePasswordView.oldPasswordTextField as UITextField }
    unowned var newPasswordTextField: UITextField { return changePasswordView.newPasswordTextField as UITextField }
    unowned var repeatNewPasswordTextField: UITextField { return changePasswordView.repeatNewPasswordTextField as UITextField }
    unowned var saveButton: UIButton { return changePasswordView.saveButton as UIButton }
    unowned var cancelButton: UIButton { return changePasswordView.cancelButton as UIButton }

    override func loadView() {
        self.view = ChangePasswordView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItem()
        handleTextFields()
        
    }
    
 
    
    //MARK: - Handling Functions
    
    func setupNavigationItem() {
        
        navigationItem.title = "Изменение пароля"
        navigationItem.hidesBackButton = true
        
        saveButton.addTarget(self, action: #selector(handleSaveButton), for: .touchUpInside)
        let saveBtn = UIBarButtonItem(customView: saveButton)
        self.navigationItem.rightBarButtonItem = saveBtn
        
        cancelButton.addTarget(self, action: #selector(handleCancelButton), for: .touchUpInside)
        let cancelBtn = UIBarButtonItem(customView: cancelButton)
        self.navigationItem.leftBarButtonItem = cancelBtn
        
    }
    
    @objc func handleCancelButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func handleSaveButton() {
        
        guard let oldPassword = UserDefaults.standard.string(forKey: "password") else { return }
        
        if let old = oldPasswordTextField.text,
           let new = newPasswordTextField.text,
           let repeated = repeatNewPasswordTextField.text {
            
            if old == "" || new == "" || repeated == "" && new == repeated {
                changePasswordVCModel.handleEmptyTextFields(vc: self)
                
            } else if new.count < 6 {
                changePasswordVCModel.handleNewPasswordCountAlert(vc: self)
                
            } else if (old != "" && new != "" && repeated != "") && new != repeated {
                changePasswordVCModel.handleNewPasswordAlert(vc: self)
                
            } else if old != oldPassword {
                changePasswordVCModel.handleOldPasswordAlert(vc: self)
                
            } else {
                UserDefaults.standard.setValue(new, forKey: "password")
                self.navigationController?.popViewController(animated: true)
            }
        }
        
    }
    
}

//MARK: - TextField Delegate

extension ChangePasswordViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func handleTextFields() {
        
        oldPasswordTextField.delegate = self
        newPasswordTextField.delegate = self
        repeatNewPasswordTextField.delegate = self
        
    }
}
