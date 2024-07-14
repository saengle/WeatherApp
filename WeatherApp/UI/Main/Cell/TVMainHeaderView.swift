//
//  TVMainHeaderView.swift
//  WeatherApp
//
//  Created by 쌩 on 7/10/24.
//

import UIKit

class TVMainHeader: UITableViewHeaderFooterView {
    
    private let mainStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .center
        return sv
    }()
    private let locationMainLabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 30)
        return lb
    }()
    private let locationSubLabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
    private let temperatureLabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 100, weight: .thin)
        return lb
    }()
    private let descriptionLabel = {
        let lb = UILabel()
        lb.textColor = .white
        return lb
    }()
    private let minmaxTempLabel = {
        let lb = UILabel()
        lb.textColor = .white
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
    func configureHeader(city: String, description: String, temp: Double, min: Double, max: Double) {
        locationMainLabel.text = city
        temperatureLabel.text = "\(temp)°"
        descriptionLabel.text = description
        minmaxTempLabel.text = "H:\(max)° L:\(min)°"
    }
}
