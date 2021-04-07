//
//  HistoryViewController.swift
//  Zoo
//
//  Created by Riza on 2/15/21.
//

import UIKit
import Firebase

class HistoryViewController: UIViewController {

    let historyDataModel = HistoryDataModel()
    var ref: DatabaseReference!
    var history = [History]()
    //IBOutlets
    unowned var historyView: HistoryView { return self.view as! HistoryView }
    unowned var tableView: UITableView { return historyView.tableView as UITableView }
    unowned var goToCatalogButton: UIButton { return historyView.goToCatalogButton as UIButton }
    unowned var activityView: UIActivityIndicatorView { return historyView.activityView as UIActivityIndicatorView }
    unowned var emptyBoxImageView: UIImageView { return historyView.emptyBoxImageView as UIImageView }
    unowned var emptyListLabel: UILabel { return historyView.emptyListLabel as UILabel }
    unowned var buttonContainer: UIView { return historyView.buttonContainer as UIView }
    
    override func loadView() {
        self.view = HistoryView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "История заказов"
        ref = Database.database().reference()

        handleViews()
        handleActions()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchHistory()
        handleViews()
        
    }

    
    func fetchHistory() {
        
        historyDataModel.fetchOrderDetails(ref: ref) { [self] history in
            
            DispatchQueue.main.async {
                
                self.history = history
                    
                    historyView.setupFilledViews()
                    setupTableView()
                    tableView.reloadData()
                    activityView.stopAnimating()

            }
            
        }
        
        
    }
    
    func handleViews() {
        
        historyView.scrollView.isHidden = true
        historyView.backgroundColor = #colorLiteral(red: 0.9484669566, green: 0.9483965039, blue: 0.9680580497, alpha: 1)
        
        if history.count == 0 {
            print("it is 0")
            historyView.scrollView.isHidden = false
            historyView.setupEmptyView()
            activityView.stopAnimating()

        }
        
    }
    
    func handleActions() {
        goToCatalogButton.addTarget(self, action: #selector(goToCatalog), for: .touchUpInside)
    }
    
    @objc func goToCatalog() {
        self.tabBarController?.selectedIndex = 0
    }

}

//MARK: - Table View Extension

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier,
                                                    for: indexPath) as? HistoryTableViewCell {
            
            let order = history[indexPath.row]
            
            cell.addressLabel.text = order.address
            cell.dateLabel.text = order.date
            cell.sumLabel.text = "\(order.sum) тг"
            cell.orderNumberLabel.text = "N \(indexPath.row + 1)"
            
            return cell
        }
        
        return HistoryTableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let order = history[indexPath.row]
        
        let orderDetailsVC = OrderDetailsViewController()
        historyDataModel.setOrderDetails(orderDetailsVC: orderDetailsVC, order: order)
        
        self.navigationController?.pushViewController(orderDetailsVC, animated: true)
        
    }
    
    func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 350)
        
    }
    
    
}

