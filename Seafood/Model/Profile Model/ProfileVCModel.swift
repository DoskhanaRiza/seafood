//
//  ProfileVCModel.swift
//  Seafood
//
//  Created by Riza on 3/23/21.
//

import UIKit

class ProfileVCModel {
    
    var observer: NSObjectProtocol?

    func handleNotifications(loginButton: UIButton) {
        
        handleLogoutButtonTitle(loginButton: loginButton)
        handleSignedInVCButtonTitle(loginButton: loginButton)
        handlePasswordVCButtonTitle(loginButton: loginButton)
        handleFillInVCButtonTitle(loginButton: loginButton)
        
    }
    
    // receiving from ChangeInfo VC
    private func handleSignedInVCButtonTitle(loginButton: UIButton) {
        
        observer = NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "newName"),
                                                          object: nil,
                                                          queue: .main,
                                                          using: { notification in
                                                            guard let title = notification.object as? String
                                                            else { return }
                                                            loginButton.setTitle(title, for: .normal)
                                                          })
        
    }

    // receiving name from Password VC when enter pressed
    private func handlePasswordVCButtonTitle(loginButton: UIButton) {
        observer = NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "button"),
                                                          object: nil,
                                                          queue: .main,
                                                          using: { notification in
                                                            guard let title = notification.object as? String
                                                            else { print("smth wrong")
                                                                return }
                                                            loginButton.setTitle(title, for: .normal)
                                                            print(title)
                                                          })
       
        
    }

    // receiving "Войти в аккаунт" when logged out
    private func handleLogoutButtonTitle(loginButton: UIButton) {
    
    observer = NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "account"),
                                                      object: nil,
                                                      queue: .main,
                                                      using: { notification in
                                                        guard let title = notification.object as? String
                                                        else { print("wrong")
                                                            return }
                                                        loginButton.setTitle(title, for: .normal)
                                                        print("Пользователь")
                                                      })
        
    }
    
    // receiving "Пользователь" when skip pressed
    private func handleFillInVCButtonTitle(loginButton: UIButton) {
        
    observer = NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "userButton"),
                                                      object: nil,
                                                      queue: .main,
                                                      using: { notification in
                                                        guard let title = notification.object as? String
                                                        else { return }
                                                        loginButton.setTitle(title, for: .normal)
                                                      })
        
    }
    
    //Handling Button Title
    func handleBtnTitle(loginButton: UIButton) {
        
        handleButtonTitle(loginButton: loginButton)
        showButtonTitle(loginButton: loginButton)

    }
    
    private func showButtonTitle(loginButton: UIButton) {
        
        if let title = UserDefaults.standard.string(forKey: "savedTitle") {
            loginButton.setTitle(title, for: .normal)
        }
        
    }
    
    private func handleButtonTitle(loginButton: UIButton) {
        
        UserDefaults.standard.removeObject(forKey: "savedTitle")
        UserDefaults.standard.setValue(loginButton.titleLabel?.text, forKey: "savedTitle")
        
    }
    
    
}
