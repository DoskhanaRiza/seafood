//
//  FillinDataViewController.swift
//  Seafood
//
//  Created by Riza on 2/28/21.
//

import UIKit

class FillinDataViewController: UIViewController {
    
    //IBOutlets
    unowned var fillInDataView: FillInDataView { return self.view as! FillInDataView }
    unowned var fillInButton: UIButton { return fillInDataView.fillInButton as UIButton }
    unowned var skipButton: UIButton { return fillInDataView.skipButton as UIButton }
    
    override func loadView() {
        self.view = FillInDataView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        handleActions()
        
    }
    
    func handleActions() {
        
        skipButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        fillInButton.addTarget(self, action: #selector(goToChangeInfoVC), for: .touchUpInside)
        
    }
  
    @objc func goToChangeInfoVC() {
        
        let changeInfoVC = ChangeInfoViewController()
        changeInfoVC.modalPresentationStyle = .fullScreen
        present(changeInfoVC, animated: true, completion: nil)
        
    }
    
    @objc func dismissVC() {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        // sending "Пользователь" to Login Button
        NotificationCenter.default.post(name: Notification.Name(rawValue: "userButton"), object: "Пользователь", userInfo: nil)
    }
    
   

}
