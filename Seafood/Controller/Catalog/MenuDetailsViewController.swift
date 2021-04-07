//
//  MenuDetailsViewController.swift
//  Seafood
//
//  Created by Riza on 3/14/21.
//

import UIKit

class MenuDetailsViewController: UIViewController {
    
    var menuDetails = [MenuDetailsModel]()
    var images: [UIImage] = []
    //IBOutltes
    unowned var menuDetailsView: MenuDetailsView { return self.view as! MenuDetailsView }
    unowned var scrollView: UIScrollView { return menuDetailsView.scrollView as UIScrollView }
    unowned var wholeScrollView: UIScrollView { return menuDetailsView.wholeScrollView as UIScrollView }
    unowned var nameLabel: UILabel { return menuDetailsView.nameLabel as UILabel }
    unowned var priceLabel: UILabel { return menuDetailsView.priceLabel as UILabel }
    unowned var descriptionLabel: UILabel { return menuDetailsView.descriptionLabel as UILabel }
    unowned var pageControl: UIPageControl { return menuDetailsView.pageControl as UIPageControl }
    unowned var menuImageView: UIImageView { return menuDetailsView.menuImageView as UIImageView }
    
    override func loadView() {
        self.view = MenuDetailsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLabels()
        configureScrollView()
        configurePageControl()
        scrollView.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configureScrollView()
        
    }
    
    
    func configureLabels() {
        
        for menu in menuDetails {
            
            nameLabel.text = menu.name
            priceLabel.text = "\(menu.priceLabel.description) тг"
            descriptionLabel.text = menu.description
            images.append(UIImage(named: menu.name)!)
            images.append(UIImage(named: menu.name)!)
            
        }
        
    }
    
    func configurePageControl() {
        
        pageControl.numberOfPages = images.count
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
        
    }
    
    @objc private func pageControlDidChange(_ sender: UIPageControl) {
        
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
        
    }
    
   
    
    private func configureScrollView() {
        
        scrollView.isPagingEnabled = true
        
        for x in 0..<images.count {
            
            let page = UIImageView(frame: CGRect(x: CGFloat(x) * view.frame.width, y: 0, width: view.frame.width, height: 300))
            page.image = images[x]
            scrollView.addSubview(page)
            
        }
        
    }

}
 

extension MenuDetailsViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        
    }
    
}
    
    

