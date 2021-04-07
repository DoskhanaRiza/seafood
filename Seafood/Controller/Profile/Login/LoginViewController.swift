//
//  LoginViewController.swift
//  Zoo
//
//  Created by Riza on 2/16/21.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class LoginViewController: UIViewController {

    let loginVCModel = LoginVCModel()
    var ref: DatabaseReference!
    // IBOutlets
    unowned var loginView: LoginView { return self.view as! LoginView }
    unowned var phoneNumberTextField: UITextField { return loginView.phoneNumberTextField as UITextField}
    unowned var confrimButton: UIButton { return loginView.confrimButton as UIButton }
    unowned var confirmButtonContainer: UIView { return loginView.confirmButtonContainer as UIView }
    unowned var cancelButton: UIButton { return loginView.cancelButton as UIButton }
    
    override func loadView() {
        self.view = LoginView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        phoneNumberTextField.delegate = self
        handleConfirmButton()
        handleActions()
        ref = Database.database().reference()
        
    }
    
    func handleActions() {
        
        cancelButton.addTarget(self, action: #selector(goBackToProfileVC), for: .touchUpInside)
        confrimButton.addTarget(self, action: #selector(confirmTapped), for: .touchUpInside)
        
    }
    
    //MARK: - @objc funcs
  
    @objc func confirmTapped() {
        loginVCModel.goToPasswordVC(vc: self)
    }
    
    @objc func goBackToProfileVC() {
        dismiss(animated: true, completion: nil)
    }
    
    // handling confirm button if the textfield is empty or not
    func handleConfirmButton() {
        
        confrimButton.isEnabled = false
        confirmButtonContainer.backgroundColor = #colorLiteral(red: 0.5462722865, green: 0.8354948605, blue: 1, alpha: 1)
        
        phoneNumberTextField.addTarget(self, action: #selector(enableConfirmButton), for: .editingChanged)
        
    }
    
    // enabling confirm button
    @objc func enableConfirmButton(sender: UITextField) {
        
        loginVCModel.enableConfirmButton(sender: sender,
                                         phoneNumberTextField: phoneNumberTextField,
                                         confrimButton: confrimButton,
                                         confirmButtonContainer: confirmButtonContainer,
                                         vc: self,
                                         ref: ref)
    }
    
    
}

//MARK: - TextField Extension

extension LoginViewController: UITextFieldDelegate {
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }

}

//MARK: - String Extension

extension String {
    
    func applyPatternOnNumbers(pattern: String, replacmentCharacter: Character) -> String {
        
        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        
        for index in 0 ..< pattern.count {
            
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = pattern.index(self.startIndex, offsetBy: index)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacmentCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
            
        }
        return pureNumber
    }
    
}
