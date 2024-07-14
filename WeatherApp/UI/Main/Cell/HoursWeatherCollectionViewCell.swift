//
//  HoursCollectionViewCell.swift
//  WeatherApp
//
//  Created by 쌩 on 7/14/24.
//

import UIKit

import Kingfisher

class HoursWeatherCollectionViewCell: UICollectionViewCell {
    
   private let sv = {
        let sv = UIStackView()
        sv.axis = .vertical
        return sv
    }()
    
    private let timeLabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.textAlignment = .center
        lb.font = .boldSystemFont(ofSize: 17)
        return lb
    }()
    
    private let weatherImageView = {
        let iv = UIImageView()
        iv.tintColor = .white
        return iv
    }()
    
    private let tempLabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.textAlignment = .center
        lb.font = .boldSystemFont(ofSize: 20)
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierchy()
        configurelayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configureHierchy() {
        contentView.addSubview(sv)
        [timeLabel, weatherImageView, tempLabel].forEach{sv.addArrangedSubview($0)}
    }
    
    private func configurelayout() {
        sv.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        timeLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
        }
        weatherImageView.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.width.equalTo(timeLabel.snp.width).multipliedBy(0.6)
            make.height.equalTo(weatherImageView.snp.width)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
        }
    }
    
    func configureCell(time: String, image: String, temp: Int) {
        let url = URL(string: "https://openweathermap.org/img/wn/" + image + "@2x.png")
        timeLabel.text = time
        weatherImageView.kf.setImage(with: url)
        tempLabel.text = "\(temp)°"
    }
}
