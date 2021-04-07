//
//  ChangeInfoViewController.swift
//  Seafood
//
//  Created by Riza on 2/20/21.
//

import UIKit

protocol ProfileInfo {
    func saveProfileInfo(name: String, surname: String, patronymic: String, image: UIImage)
}

class ChangeInfoViewController: UIViewController {

    let chnageInfoVCDModel = ChangeInfoVCModel()
    var profileInfoDelegate: ProfileInfo?
    var imagePicker = UIImagePickerController()
    //IBOutlets
    unowned var changeInfoView: ChangeInfoView { return self.view as! ChangeInfoView }
    unowned var nameTextField: UITextField { return changeInfoView.nameTextField as UITextField }
    unowned var surnameTextField: UITextField { return changeInfoView.surnameTextField as UITextField }
    unowned var patronymicTextField: UITextField { return changeInfoView.patronymicTextField as UITextField }
    unowned var deleteButton: UIButton { return changeInfoView.deleteButton as UIButton }
    unowned var saveButton: UIButton { return changeInfoView.saveButton as UIButton }
    unowned var cancelButton: UIButton { return changeInfoView.cancelButton as UIButton }
    unowned var profileImageView: UIImageView { return changeInfoView.profileImageView as UIImageView }
    unowned var changeButton: UIButton { return changeInfoView.changeButton as UIButton }
    unowned var changeButtonContainer: UIView { return changeInfoView.changeButtonContainer as UIView }

    
    override func loadView() {
        self.view = ChangeInfoView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationItem()
        handleTextFields()
        handleActions()
        
    }
    
    func handleActions() {
        
        changeButton.addTarget(self, action: #selector(changeButtonPressed), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(deletePressed), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(handleCancelButton), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(handleSaveButton), for: .touchUpInside)
        
    }
    
//MARK: - Functions
    
    @objc func deletePressed() {
        
        let contactImage = UIImage(named: "contact")
        profileImageView.image = contactImage
        
        handleViews()

    }
    
    @objc func handleCancelButton() {
        chnageInfoVCDModel.handleCancelBtn(vc: self)
    }
    
    
    
    @objc func handleSaveButton() {
        
        chnageInfoVCDModel.handleSaveBtn(vc: self) {
            self.saveInfo()
        }
        
    }
    
    func saveInfo() {
        
        if let newName = nameTextField.text,
           let newSurname = surnameTextField.text,
           let newPatronymic = patronymicTextField.text,
           let newImage = profileImageView.image {
        
            profileInfoDelegate?.saveProfileInfo(name: newName,
                                                 surname: newSurname,
                                                 patronymic: newPatronymic,
                                                 image: newImage)
            
            let fullName = "\(newSurname) \(newName) \(newPatronymic)"
            
            UserDefaults.standard.setValue(newName, forKey: "newName")
            UserDefaults.standard.setValue(newSurname, forKey: "newSurname")
            UserDefaults.standard.setValue(newPatronymic, forKey: "newPatronymic")
            UserDefaults.standard.setValue(newImage.jpegData(compressionQuality: 1.0), forKey: "newImage")
            // sending name to login button
            NotificationCenter.default.post(name: Notification.Name("newName"), object: fullName, userInfo: nil)
        }
    }
    
    //MARK: - Setting up UI Functions
    
    func handleViews() {
        
        let contactImage = UIImage(named: "contact")
        
        if profileImageView.image == contactImage {
            changeInfoView.setupViews()
        } else {
            changeInfoView.setupProfileImagePickedView()
        }
        
    }
    
    func setupNavigationItem() {
        
        navigationItem.title = "Редактировать"
        navigationItem.hidesBackButton = true
        
        saveButton.addTarget(self, action: #selector(handleSaveButton), for: .touchUpInside)
        let saveBtn = UIBarButtonItem(customView: saveButton)
        self.navigationItem.rightBarButtonItem = saveBtn
        
        cancelButton.addTarget(self, action: #selector(handleCancelButton), for: .touchUpInside)
        let cancelBtn = UIBarButtonItem(customView: cancelButton)
        self.navigationItem.leftBarButtonItem = cancelBtn
        
    }

}

//MARK: - Text Field Extensions

extension ChangeInfoViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func handleTextFields() {
        
        nameTextField.delegate = self
        surnameTextField.delegate = self
        patronymicTextField.delegate = self
        
    }
}

//MARK: - Image Picker Delegates

extension ChangeInfoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc func changeButtonPressed() {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            profileImageView.image = image
            changeInfoView.setupProfileImagePickedView()
            
        }
    }
    
    
}
