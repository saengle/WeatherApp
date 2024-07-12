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
    
    lazy var menuButton = {
        let item = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: #selector(menuButtonClicked(_:)))
        item.tintColor = .white
        return item
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureNav()
    }
    
}
extension SearchViewController{
    private func configureVC() {
        searchView.tableView.delegate = self
        searchView.tableView.dataSource = self
    }
    private func configureNav() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.backItem?.title = ""
        self.navigationItem.rightBarButtonItem = menuButton
    }
    @objc
    private func menuButtonClicked(_ sender: UIBarButtonItem) {print("테스트")}
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: .none)
        cell.textLabel?.text = "Seoul"
        cell.textLabel?.font = .boldSystemFont(ofSize: 17)
        cell.detailTextLabel?.text = "KR"
        cell.detailTextLabel?.textColor = .systemGray
        cell.imageView?.image = UIImage(systemName: "number")
        cell.imageView?.tintColor = .white
        return cell
    }
}
