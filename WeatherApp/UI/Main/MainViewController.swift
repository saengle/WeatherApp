//
//  MainViewController.swift
//  WeatherApp
//
//  Created by 쌩 on 7/10/24.
//

import UIKit

class MainViewController:  UIViewController {
    
    let mainView = MainView()
    
    lazy var newReminder = {
        let item = UIBarButtonItem(image: UIImage(systemName: "map"), style: .plain, target: self, action: #selector(tabbarButtonClicked(_:)))
        item.tag = 0
        item.tintColor = .black
        return item
    }()
    lazy var flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
    lazy var addList = {
        let item = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(tabbarButtonClicked(_:)))
        item.tag = 1
        item.tintColor = .black
        return item
    }()
    
    override func loadView() { view = mainView }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNav()
        configureVC()
    }
}

extension MainViewController {
    func configureVC() {
        mainView.mainTableView.delegate = self
        mainView.mainTableView.dataSource = self
        mainView.mainTableView.register(TVMainCell.self, forCellReuseIdentifier: TVMainCell.id)
        mainView.mainTableView.register(TVMainHeader.self, forHeaderFooterViewReuseIdentifier: TVMainHeader.id)
    }
    private func configureNav() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.isToolbarHidden = false
        var items = [UIBarButtonItem]()
        
        [newReminder, flexibleSpace, addList].forEach {items.append($0)}
        
        self.toolbarItems = items
    }
    
    @objc private func tabbarButtonClicked(_ sender: UIBarButtonItem) {}
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TVMainCell.id, for: indexPath) as? TVMainCell else { return UITableViewCell() }
        
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TVMainHeader.id) as? TVMainHeader else {return UITableViewHeaderFooterView()}
            return header
        } else { return nil }
    }
}
