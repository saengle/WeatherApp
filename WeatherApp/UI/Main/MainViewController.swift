//
//  MainViewController.swift
//  WeatherApp
//
//  Created by 쌩 on 7/10/24.
//

import UIKit

class MainViewController:  UIViewController {
    
    let mainView = MainView()
    
    lazy var mapButton = {
        let item = UIBarButtonItem(image: UIImage(systemName: "map"), style: .plain, target: self, action: #selector(tabbarButtonClicked(_:)))
        item.tag = 0
        item.tintColor = .black
        return item
    }()
    lazy var flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
    lazy var searchButton = {
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
        mainView.mainTableView.sectionHeaderHeight = UITableView.automaticDimension
    }
    private func configureNav() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.isToolbarHidden = false
        var items = [UIBarButtonItem]()
        
        [mapButton, flexibleSpace, searchButton].forEach {items.append($0)}
        
        self.toolbarItems = items
    }
    
    @objc private func tabbarButtonClicked(_ sender: UIBarButtonItem) {
        switch sender.tag {
        case 0:
            print("Map Button Tapped")
        case 1:
            print("Search Button Tapped")
            SearchButtonTapped()
        default:
            print("오류가 발생했습니다.")
        }
    }
    private func SearchButtonTapped() {
        let vc = SearchViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
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
