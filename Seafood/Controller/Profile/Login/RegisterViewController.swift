//
//  RegisterViewController.swift
//  Seafood
//
//  Created by Riza on 2/26/21.
//

import UIKit
import Firebase


class RegisterViewController: UIViewController {

    var observer: NSObjectProtocol?
    var verificationID: String? = nil
    let registerVCModel = RegisterVCModel()
    //IBOutlets
    unowned var registerView: RegisterView { return self.view as! RegisterView }
    unowned var codeConfirmTextField: UITextField { return registerView.codeConfirmTextField as UITextField }
    unowned var passwordTextField: UITextField { return registerView.passwordTextField as UITextField }
    unowned var repeatPasswordTextField: UITextField { return registerView.repeatPasswordTextField as UITextField }
    unowned var registerButton: UIButton { return registerView.registerButton as UIButton }
    unowned var cancelButton: UIButton { return registerView.cancelButton as UIButton }
    unowned var changeNumberButton: UIButton { return registerView.changeNumberButton as UIButton }
    unowned var registerButtonContainer: UIView { return registerView.registerButtonContainer as UIView }
    unowned var phoneNumberLabel: UILabel { return registerView.phoneNumberLabel as UILabel }
    
    override func loadView() {
        self.view = RegisterView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        handleTextFieldDelegates()
        handleRegisterButton()
        handleActions()
        
    }
    
    //MARK: - Handling Actions
    
    func handleActions() {
        
        cancelButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        changeNumberButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
    }
    
    //MARK: - @objc Functions
    
    @objc func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func registerTapped() {
        
        guard let number = phoneNumberLabel.text else { return }
        UserDefaults.standard.setValue(number, forKey: "phoneNumber")
        Auth.auth().settings?.isAppVerificationDisabledForTesting = false

        PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil) { (verificationID, error) in

            if (error != nil) {
                print("the error is \(error!)")
                return
            } else {
                self.verificationID = verificationID
            }
        }

        guard let id = self.verificationID, !id.isEmpty else {return}

            let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID!, verificationCode: codeConfirmTextField.text!)

            Auth.auth().signIn(with: credential) { (authData, error) in

                if error != nil {
                    print(error.debugDescription)
                } else {
                    print("successfully authenticated")
                }


                // saving the user's number to database
                let ref = Database.database().reference(fromURL: "https://seafood-c1483-default-rtdb.firebaseio.com/")
                let usersReference = ref.child("users").child("user")
                let values = ["number" : number]
                usersReference.updateChildValues(values) { (err, ref) in
                    if err != nil {
                        print(err!)
                        return
                    }

                }

            }
        
        handlePasswords()
        
    }
    
    func handlePasswords() {
        
        guard let password = passwordTextField.text,
              let repeatedPassword = repeatPasswordTextField.text
        else { return }
        
        if password != repeatedPassword {
            registerVCModel.showPasswordAlert(vc: self)

        } else {
            
            UserDefaults.standard.removeObject(forKey: "password")
            UserDefaults.standard.setValue(password, forKey: "password")
            tabBarController?.selectedIndex = 4
//            registerVCModel.goToFillinVC(vc: self)
            
        }
    }
    
//MARK: - Handling Register Button Methods
    
    func handleRegisterButton() {
        
        registerButton.isEnabled = false
        registerButtonContainer.backgroundColor = #colorLiteral(red: 0.5462722865, green: 0.8354948605, blue: 1, alpha: 1)
        passwordTextField.addTarget(self, action: #selector(enableRegisterBtn), for: .editingChanged)
        repeatPasswordTextField.addTarget(self, action: #selector(enableRegisterBtn), for: .editingChanged)
        codeConfirmTextField.addTarget(self, action: #selector(enableRegisterBtn), for: .editingChanged)
        
    }
    
    @objc func enableRegisterBtn(sender: UITextField) {
        
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        
        guard let password = passwordTextField.text, password.count > 5,
              let repeatedPassword = repeatPasswordTextField.text, repeatedPassword.count > 5,
              let confirmCode = codeConfirmTextField.text, confirmCode.count > 5
        else {
            registerButton.isEnabled = false
            return
        }
        registerButton.isEnabled = true
        registerButtonContainer.backgroundColor = #colorLiteral(red: 0.02352941176, green: 0.06666666667, blue: 0.8901960784, alpha: 1)
    }
   
}

//MARK: - Text Field Extension

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func handleTextFieldDelegates() {
        
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
        codeConfirmTextField.delegate = self
        
    }
}

   

