//
//  MainViewController.swift
//  WeatherApp
//
//  Created by 쌩 on 7/10/24.
//

import UIKit

class MainViewController:  UIViewController {
    
    let mainView = MainView()
    
    override func loadView() { view = mainView}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


