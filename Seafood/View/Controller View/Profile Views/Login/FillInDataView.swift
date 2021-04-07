//
//  FillInDataView.swift
//  Seafood
//
//  Created by Riza on 3/11/21.
//

import UIKit

class FillInDataView: UIView {
    
    //MARK: - Adding UI
    
    let seafoodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "seafood")?.withRenderingMode(.alwaysTemplate)
        imageView.backgroundColor = .white
        imageView.tintColor = #colorLiteral(red: 0.631372549, green: 0.0431372549, blue: 0.168627451, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let fillInLabel: UILabel = {
        let label = UILabel()
        label.text = "Заполните личные данные"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.numberOfLines = 1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Чтобы использовать все\nфункции приложения,\nзаполните свой\nпрофиль пользователя"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fillInButtonContainer: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0.2137516676, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        return view
    }()
    
    let fillInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Заполнить личные данные", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Пропустить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = #colorLiteral(red: 0.06399380009, green: 0.02715566892, blue: 0.4435279187, alpha: 1)
        return scrollView
    }()
    
    //MARK: - Init Functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    //MARK: - Setting up UI
    
    func setupViews() {
        
        self.backgroundColor = #colorLiteral(red: 0.06399380009, green: 0.02715566892, blue: 0.4435279187, alpha: 1)
        
        self.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: self.frame.width, height: scrollView.intrinsicContentSize.height)
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        scrollView.addSubview(seafoodImageView)
        seafoodImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100).isActive = true
        seafoodImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        seafoodImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        seafoodImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        scrollView.addSubview(fillInLabel)
        fillInLabel.topAnchor.constraint(equalTo: seafoodImageView.bottomAnchor, constant: 30).isActive = true
        fillInLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        fillInLabel.widthAnchor.constraint(equalToConstant: fillInLabel.intrinsicContentSize.width).isActive = true
        
        scrollView.addSubview(textInfoLabel)
        textInfoLabel.topAnchor.constraint(equalTo: fillInLabel.bottomAnchor, constant: 30).isActive = true
        textInfoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        textInfoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        textInfoLabel.heightAnchor.constraint(equalToConstant: textInfoLabel.intrinsicContentSize.height).isActive = true
        
        scrollView.addSubview(fillInButtonContainer)
        fillInButtonContainer.topAnchor.constraint(equalTo: textInfoLabel.bottomAnchor, constant: 35).isActive = true
        fillInButtonContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        fillInButtonContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        fillInButtonContainer.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        fillInButtonContainer.addSubview(fillInButton)
        fillInButton.centerYAnchor.constraint(equalTo: fillInButtonContainer.centerYAnchor).isActive = true
        fillInButton.centerXAnchor.constraint(equalTo: fillInButtonContainer.centerXAnchor).isActive = true
        fillInButton.heightAnchor.constraint(equalTo: fillInButtonContainer.heightAnchor).isActive = true
        fillInButton.widthAnchor.constraint(equalTo: fillInButtonContainer.widthAnchor).isActive = true
        
        scrollView.addSubview(skipButton)
        skipButton.topAnchor.constraint(equalTo: fillInButtonContainer.bottomAnchor, constant: 20).isActive = true
        skipButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        skipButton.widthAnchor.constraint(equalToConstant: skipButton.intrinsicContentSize.width).isActive = true
        
    }
    
    
}


