//
//  TVMainHeaderView.swift
//  WeatherApp
//
//  Created by 쌩 on 7/10/24.
//

import UIKit

class TVMainHeader: UITableViewHeaderFooterView {
    
    let mainStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .center
        return sv
    }()
    let locationMainLabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.text = "My Location"
        lb.font = .systemFont(ofSize: 30)
        return lb
    }()
    let locationSubLabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.text = "서울특별시"
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
    let temperatureLabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.text = "30°"
        lb.font = .systemFont(ofSize: 100, weight: .thin)
        return lb
    }()
    let descriptionLabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.text = "Mostly Sunny"
        return lb
    }()
    let minmaxTempLabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.text = "H:30° L:20°"
        return lb
    }()
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureHierachy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHierachy() {
        contentView.addSubview(mainStackView)
        [locationMainLabel, locationSubLabel, temperatureLabel, descriptionLabel, minmaxTempLabel].forEach{mainStackView.addArrangedSubview($0)}
    }
    private func configureLayout() {
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    func configureHeader() {}
}
