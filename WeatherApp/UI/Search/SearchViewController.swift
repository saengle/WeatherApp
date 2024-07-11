//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by 쌩 on 7/11/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchView = SearchView()
    override func loadView() {
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }
}
extension SearchViewController{
    private func configureVC() {
        searchView.tableView.delegate = self
        searchView.tableView.dataSource = self
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .blue
        return cell
    }
}
