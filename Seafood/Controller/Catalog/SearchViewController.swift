//
//  SearchViewController.swift
//  Seafood
//
//  Created by Riza on 2/22/21.
//

import UIKit
import Firebase

class SearchViewController: UIViewController {
    
    var ref: DatabaseReference!
    var queries = [String]()
    let catalogDataModel = CatalogDataModel()
    var menus = [Menu]()
    //IBOulets
    unowned var searchView: SearchView { return self.view as! SearchView }
    unowned var tableView: UITableView { return searchView.tableView as UITableView }
    unowned var searchLabel: UILabel { return searchView.searchLabel as UILabel }
    unowned var seacrhTextField: UITextField { searchView.seacrhTextField as UITextField }
    
    override func loadView() {
        self.view = SearchView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        hideShowSearchLabel()
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.titleView = seacrhTextField
        navigationItem.backButtonTitle = title
        navigationController?.navigationBar.backgroundColor = .gray
        seacrhTextField.delegate = self

                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchQueries()
        hideShowSearchLabel()
        
    }
    
    func hideShowSearchLabel() {
        
        if queries.count == 0 {
            searchLabel.isHidden = true
        } else {
            searchLabel.isHidden = false
        }
    }
    
    func fetchQueries() {
        
        catalogDataModel.fetchQueries(ref: ref) { [self] queries in
            
            DispatchQueue.main.async {
                self.queries = queries
                hideShowSearchLabel()
                tableView.reloadData()
            }
            
        }
    }
    
    //MARK: - Handling search

    func handleSearch(_ query: String) {
        
        for menu in catalogDataModel.allMenus {
            
            if menu.name.lowercased().contains(query.lowercased()) {
                
                if !queries.contains(query) {
                    queries.append(query)
                    catalogDataModel.addQueryToFirebase(ref: ref, query: query)
                }
                
                menus.removeAll()
                menus.append(menu)
                goToSearchResults(menu: menu)
                
            }
        } 
        
    }
    
    func showNotFoundAlert() {
        
        let alert = UIAlertController(title: "Извините",
                                      message: "Ничего не найдено",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Продолжить",
                                      style: .default,
                                      handler: { (action) in
                                        self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func goToSearchResults(menu: Menu) {
        
        let menuVC = MenuViewController()
        menuVC.navigationItem.title = menu.name
        menuVC.menus = [menu]
        self.navigationController?.pushViewController(menuVC, animated: true)
        
    }
    
    
}

//MARK: - Table View Extension

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return queries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier,
                                                    for: indexPath) as? SearchTableViewCell {
            
            let query = queries[indexPath.row]
            cell.searchStringLabel.text = query
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let query = queries[indexPath.row]
        handleSearch(query)
        
        
    }
    
}

//MARK: - TextField Delegate Extension

extension SearchViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        handleSearch(textField.text ?? "")
        textField.resignFirstResponder()
        return true
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.endEditing(true)
    }
    
}

