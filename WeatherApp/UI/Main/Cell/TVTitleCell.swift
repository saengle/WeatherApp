//
//  MainCell.swift
//  WeatherApp
//
//  Created by 쌩 on 7/10/24.
//

import UIKit

import SnapKit

class TVTitleCell : UITableViewCell {
    
    let stview = {
        let st = UIStackView()
        st.axis = .horizontal
        return st
    }()
    let lb = UILabel()
    let iv = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        configureHierachy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configureHierachy() {
        contentView.addSubview(stview)
        stview.addArrangedSubview(iv)
        stview.addArrangedSubview(lb)
    }
    private func configureLayout() {
        stview.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        iv.snp.makeConstraints { make in
            make.height.equalTo(lb.snp.height)
            make.width.equalTo(iv.snp.height)
        }
    }
    func configureCell(title: String, image: UIImage, color: UIColor) {
        iv.tintColor = color
        iv.image = image
        lb.text = title
        lb.textColor = color
    }
}

