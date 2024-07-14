//
//  TVHoursWeatherCell.swift
//  WeatherApp
//
//  Created by 쌩 on 7/14/24.
//

import UIKit

import SnapKit

class TVHoursWeatherCell: UITableViewCell {
    
    lazy var horizontalCV = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
    private let flowLayout = {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        layout.itemSize = .init(width: (width - 32 - 64) / 5, height: 100)
        layout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        return layout
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        horizontalCV.register(HoursWeatherCollectionViewCell.self, forCellWithReuseIdentifier: HoursWeatherCollectionViewCell.id)
        configureHierchy()
        configurelayout()
        contentView.backgroundColor = .clear
        horizontalCV.backgroundColor = .clear
        horizontalCV.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHierchy() {
        contentView.addSubview(horizontalCV)
    }
    private func configurelayout() {
        horizontalCV.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(100)
        }
    }
    func configureCell() {}
}
