//
//  MenuView.swift
//  Seafood
//
//  Created by Riza on 3/14/21.
//

import UIKit

class MenuDetailsView: UIView {
    
    //MARK: - Adding Views
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = #colorLiteral(red: 0.9171851277, green: 0.9205198884, blue: 0.9522905946, alpha: 1)
        scrollView.isPagingEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let wholeScrollView: UIScrollView = {
        let wholeScrollView = UIScrollView()
        wholeScrollView.backgroundColor = #colorLiteral(red: 0.9171851277, green: 0.9205198884, blue: 0.9522905946, alpha: 1)
        wholeScrollView.translatesAutoresizingMaskIntoConstraints = false
        return wholeScrollView
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.backgroundColor = .lightGray
        pageControl.layer.cornerRadius = 10
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    let menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        
        
        let screenSize = UIScreen.main.bounds
        let width = screenSize.width
        let height = screenSize.height
        
        self.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9529411765, alpha: 1)

        self.addSubview(wholeScrollView)
        wholeScrollView.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9529411765, alpha: 1)
        wholeScrollView.contentSize = CGSize(width: self.frame.size.width, height: 600)
        wholeScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        wholeScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        wholeScrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        wholeScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        wholeScrollView.addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: wholeScrollView.topAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 300).isActive = true
//        scrollView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 300)
        scrollView.contentSize = CGSize(width: width * 2,
                                        height: scrollView.frame.size.height)
        
        wholeScrollView.addSubview(pageControl)
        pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20).isActive = true
        pageControl.widthAnchor.constraint(equalToConstant: 150).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        wholeScrollView.addSubview(nameLabel)
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        nameLabel.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 30).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 15).isActive = true
        
        wholeScrollView.addSubview(priceLabel)
        priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 15).isActive = true
        
        wholeScrollView.addSubview(descriptionLabel)
        descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 30).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 15).isActive = true
        
        scrollView.addSubview(menuImageView)
//        menuImageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
//        menuImageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true

//        menuImageView.image = UIImage(named: "dogs")

    }
}
