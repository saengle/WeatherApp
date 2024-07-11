//
//  SearchView.swift
//  WeatherApp
//
//  Created by 쌩 on 7/11/24.
//

import UIKit

import SnapKit

class SearchView: UIView {
    
    let tableView = {
        let tb = UITableView()
        tb.backgroundColor = .black
        return tb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierachy()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchView {
    private func configureHierachy(){
        self.addSubview(tableView)
    }
    private func configureLayout(){
        self.tableView.snp.makeConstraints { make in
            make.verticalEdges.equalTo(self.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(16)
        }
    }
    func configureView(){
        self.backgroundColor = .black
    }
}
