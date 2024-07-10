//
//  UIView+Extension.swift
//  WeatherApp
//
//  Created by 쌩 on 7/10/24.
//

import UIKit

protocol ReuseIdentifying {
    static var id: String { get }
}

extension UIView: ReuseIdentifying {
    static var id: String {
        return String(describing: self)
    }
}
