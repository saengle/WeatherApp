//
//  WeatherChatView.swift
//  WeatherApp
//
//  Created by 쌩 on 6/19/24.
//

import UIKit

import SnapKit

class WeatherChatView: UIView {
    
    let backgroundImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "background")
        return iv
    }()
    
    let dateLabel = {
        let lb = UILabel()
        return lb
    }()
    
    let locationButton = {
        let bt = UIButton()
        bt.setImage(UIImage(systemName: "location.fill"), for: .normal)
        return bt
    }
    
    let locationLable = {
        let lb = UILabel()
        lb.text = "서울, 도봉구"
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 18)
        return lb
    }()
    let shareButton = {
        let bt = UIButton()
        bt.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        return bt
    }()
    let refreshButton = {
        let bt = UIButton()
        bt.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        return bt
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierachy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WeatherChatView {
    private func configureHierachy() {
        [backgroundImageView].forEach{self.addSubview($0)}
    }
    private func configureLayout() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
