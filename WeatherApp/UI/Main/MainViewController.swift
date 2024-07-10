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
    
    override func loadView() { view = mainView}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNav()
    }
    
   
}
extension MainViewController {
    func configureVC() {
        
    }
    private func configureNav() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.isToolbarHidden = false
       var items = [UIBarButtonItem]()

       [newReminder, flexibleSpace, addList].forEach {
           items.append($0)
       }

       self.toolbarItems = items
    }
    
    @objc private func tabbarButtonClicked(_ sender: UIBarButtonItem) {}
}

