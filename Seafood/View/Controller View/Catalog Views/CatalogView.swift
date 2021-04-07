//
//  CatalogView.swift
//  Seafood
//
//  Created by Riza on 3/14/21.
//

import UIKit

class CatalogView: UIView {
    
    //MARK: - Adding Views
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: UIView().frame, collectionViewLayout: UICollectionViewLayout())
        collectionView.register(CatalogCollectionViewCell.self, forCellWithReuseIdentifier: CatalogCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let productsCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.backgroundColor = .blue
        label.layer.masksToBounds = true
        label.frame = CGRect(x: -5, y: -5, width: 16, height: 16)
        label.layer.cornerRadius = label.frame.width / 2
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    let cartButton: UIButton = {
        let button = UIButton()
        let cartImage = UIImage(named: "cart")
        let tintedImage = cartImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.tintColor = #colorLiteral(red: 0.1356485445, green: 0.3509331966, blue: 0.7330752269, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        let searchImage = UIImage(named: "search")
        let tintedImage = searchImage?.withRenderingMode(.alwaysTemplate)
        button.tintColor = #colorLiteral(red: 0.1356485445, green: 0.3509331966, blue: 0.7330752269, alpha: 1)
        button.setImage(tintedImage, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        
        self.backgroundColor = .white
        
        self.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        collectionView.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9529411765, alpha: 1)
        collectionView.alwaysBounceVertical = true
        
        
    }
    
}
