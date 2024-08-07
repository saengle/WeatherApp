//
//  MainView.swift
//  WeatherApp
//
//  Created by 쌩 on 7/10/24.
//

import UIKit

import SnapKit

class MainView: UIView {
    
    let mainTableView = {
        let tb = UITableView(frame: .zero, style: .insetGrouped)
        tb.backgroundColor = .clear
        tb.backgroundView = nil
        return tb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightGray
        configureHierachy()
        configureLayout()
        mainTableView.register(TVTitleCell.self, forCellReuseIdentifier: TVTitleCell.id)
        mainTableView.register(TVMainHeader.self, forHeaderFooterViewReuseIdentifier: TVMainHeader.id)
        mainTableView.register(TVHoursWeatherCell.self, forCellReuseIdentifier: TVHoursWeatherCell.id)
        mainTableView.register(TVDaysWeatherCell.self, forCellReuseIdentifier: TVDaysWeatherCell.id)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHierachy() {
        addSubview(mainTableView)
    }
    private func configureLayout() {
        mainTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    func configureView() {
        
    }
}
