//
//  ContactsViewController.swift
//  Zoo
//
//  Created by Riza on 2/16/21.
//

import UIKit

class ContactsViewController: UIViewController {
    
    let profileDataModel = ProfileDataModel()
    // IBOutles
    unowned var contactsView: ContactsView { return self.view as! ContactsView }
    unowned var emailLinkButton: UIButton { return contactsView.emailLinkButton as UIButton}
    unowned var instaButton: UIButton { return contactsView.instagramLinkButton as UIButton }
    unowned var phoneButton: UIButton { return contactsView.phoneButton as UIButton}
    unowned var phoneNumberButton: UIButton { return contactsView.phoneNumberButton as UIButton}
    unowned var whatsappButton: UIButton { return contactsView.whatsappPhoneNumberButton as UIButton }
    
    override func loadView() {
        self.view = ContactsView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Контакты"
        openLinks()

        
    }
    
    // IBActions
    func openLinks() {
        
        self.emailLinkButton.addTarget(self, action: #selector(openMail), for: .touchUpInside)
        self.instaButton.addTarget(self, action: #selector(openInsta), for: .touchUpInside)
        self.phoneButton.addTarget(self, action: #selector(showCallAlert), for: .touchUpInside)
        self.phoneNumberButton.addTarget(self, action: #selector(showCallAlert), for: .touchUpInside)
        self.whatsappButton.addTarget(self, action: #selector(showCallAlert), for: .touchUpInside)
        
    }
    
    // Links
    @objc func openMail() {
        
        if let url = URL(string: "mailto:\(String(describing: emailLinkButton.titleLabel?.text))"),
                            UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        
    }

    @objc func openInsta() {
        
        guard let url = URL(string: "https://instagram.com/moreprodukty.kz?igshid=r1yu3pfuwp3c") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }

    @objc func makePhoneCall() {
        
        if let url = URL(string: "tel://\(String(describing: phoneButton.titleLabel?.text))") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        
    }

    @objc func showCallAlert() {
        
        let alert = UIAlertController(title: nil,
                                      message: nil,
                                      preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Позвонить 8 (700) 545-00-00" ,
                                      style: .default,
                                      handler: { (action) in
                                        self.makePhoneCall()
                                        print("button pressed")
                                      }))
        
        alert.addAction(UIAlertAction(title: "Отменить",
                                      style: .cancel,
                                      handler: { (action) in
                                        self.dismiss(animated: true, completion: nil)
                                      }))
        
        self.present(alert, animated: true, completion: nil)
        
    }


    
    
}

