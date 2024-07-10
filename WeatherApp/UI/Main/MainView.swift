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
        tb.backgroundColor = .lightGray
        return tb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        configureHierachy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHierachy() {
        addSubview(mainTableView)
    }
    private func configureLayout() {
        mainTableView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
    func configureView() {
        
    }
}
