//
//  MainCell.swift
//  WeatherApp
//
//  Created by 쌩 on 7/10/24.
//

import UIKit

import SnapKit

class TVMainCell : UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

