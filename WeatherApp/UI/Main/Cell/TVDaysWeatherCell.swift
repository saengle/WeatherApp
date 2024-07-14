//
//  TVDaysWeatherCell.swift
//  WeatherApp
//
//  Created by 쌩 on 7/14/24.
//

import UIKit

import SnapKit

class TVDaysWeatherCell: UITableViewCell {
    
    let stView = {
        let st = UIStackView()
        st.axis = .horizontal
        st.spacing = 20
        st.alignment = .center
        return st
    }()
    
    let dayLabel = {
        let lb = UILabel()
        lb.text = "Today"
        return lb
    }()
    
    let weatherImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "sun.max.fill")
        iv.tintColor = .yellow
        return iv
    }()
    
    let minLabel = {
        let lb = UILabel()
        lb.text = "22°"
        return lb
    }()
    
    let maxLabel = {
        let lb = UILabel()
        lb.text = "30°"
        return lb
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierachy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHierachy() {
        contentView.addSubview(stView)
        [dayLabel, weatherImageView, minLabel, maxLabel].forEach{stView.addArrangedSubview($0)}
    }
    private func configureLayout() {
        stView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureCell() {}
}
