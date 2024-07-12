//
//  SearchView.swift
//  WeatherApp
//
//  Created by 쌩 on 7/11/24.
//

import UIKit

import SnapKit

class SearchView: UIView {
    
    let titleLabel = {
        let lb = UILabel()
        lb.text = "City"
        lb.font = .boldSystemFont(ofSize: 30)
        lb.textColor = .white
        return lb
    }()
    
    let searchBar = {
        let sb = UISearchBar()
        return sb
    }()
    
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
        self.addSubview(titleLabel)
        self.addSubview(searchBar)
        self.addSubview(tableView)
    }
    private func configureLayout(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(16)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.bottom.equalTo(self.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(16)
        }
    }
    func configureView(){
        self.backgroundColor = .black
    }
}
