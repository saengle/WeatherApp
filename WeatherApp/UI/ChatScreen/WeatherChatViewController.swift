//
//  WeatherChatViewController.swift
//  WeatherApp
//
//  Created by 쌩 on 6/19/24.
//

import UIKit

class WeatherChatViewController: UIViewController {
    
    let weatherChatView = WeatherChatView()
    
    override func loadView() {
        view = weatherChatView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
