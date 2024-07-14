//
//  MainViewController.swift
//  WeatherApp
//
//  Created by 쌩 on 7/10/24.
//

import UIKit

class MainViewController:  UIViewController {
    
    let mainView = MainView()
    let viewModel = MainViewModel()
    
    lazy var mapButton = {
        let item = UIBarButtonItem(image: UIImage(systemName: "map"), style: .plain, target: self, action: #selector(tabbarButtonClicked(_:)))
        item.tag = 0
        item.tintColor = .white
        return item
    }()
    lazy var flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
    lazy var searchButton = {
        let item = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(tabbarButtonClicked(_:)))
        item.tag = 1
        item.tintColor = .white
        return item
    }()
    
    override func loadView() { view = mainView }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNav()
        configureVC()
        bindData()
    }
}

extension MainViewController {
    func bindData() {
        viewModel.outputWeather.bind { value in
            print(value?.list?.count)
            DispatchQueue.main.async {
                self.mainView.mainTableView.reloadData()
            }
        }
    }
    func configureVC() {
        mainView.mainTableView.delegate = self
        mainView.mainTableView.dataSource = self
        mainView.mainTableView.sectionHeaderHeight = UITableView.automaticDimension
        mainView.mainTableView.rowHeight = UITableView.automaticDimension
    }
    private func configureNav() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.isToolbarHidden = false
        var items = [UIBarButtonItem]()
        
        [mapButton, flexibleSpace, searchButton].forEach {items.append($0)}
        
        self.toolbarItems = items
    }
    
    @objc private func tabbarButtonClicked(_ sender: UIBarButtonItem) {
        switch sender.tag {
        case 0:
            print("Map Button Tapped")
        case 1:
            print("Search Button Tapped")
            SearchButtonTapped()
        default:
            print("오류가 발생했습니다.")
        }
    }
    private func SearchButtonTapped() {
        let vc = SearchViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK:  TableView Setting
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK:  섹션별 Row 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TVTitleCell.id, for: indexPath) as? TVTitleCell else { return UITableViewCell() }
            cell.configureCell(title: " 3시간 간격의 일기예보", image: UIImage(systemName: "calendar")!, color: .white)
            return cell
        } else if indexPath == [0, 1] {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TVHoursWeatherCell.id, for: indexPath) as? TVHoursWeatherCell else { return UITableViewCell() }
            
            cell.horizontalCV.delegate = self
            cell.horizontalCV.dataSource = self
            cell.horizontalCV.reloadData()
            return cell
        } else   {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TVDaysWeatherCell.id, for: indexPath) as? TVDaysWeatherCell else { return UITableViewCell() }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TVMainHeader.id) as? TVMainHeader else {return UITableViewHeaderFooterView()}
            if let name = viewModel.outputWeather.value?.city?.name,
               let weather = viewModel.outputWeather.value?.list?.first {
                header.configureHeader(city: name,  description: weather.weather!.description, temp: ((weather.main?.temp ?? 0) - 273.15).rounded() , min: ((weather.main?.tempMin ?? 0) - 273.15).rounded(), max: ((weather.main?.tempMax ?? 0) - 273.15).rounded())}
            return header
        } else { return nil }
    }
}
// MARK:   CollectionView Setting
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.outputWeather.value?.list?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HoursWeatherCollectionViewCell.id, for: indexPath) as? HoursWeatherCollectionViewCell else { return UICollectionViewCell() }
        let data = self.viewModel.outputWeather.value?.list?[indexPath.item]
        if let image = data?.weather?.first?.icon,
           let temp = (data?.main?.temp),
           let date = data?.dtTxt {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let convertDate = formatter.date(from: date)
            let myDateFormatter = DateFormatter()
            myDateFormatter.dateFormat = "HH시"
            let convertStr = myDateFormatter.string(from: convertDate!)
            cell.configureCell(time: convertStr, image: image, temp: Int(temp - 273.15))
        }
        
        return cell
    }
}
//let dateStr = "2020-08-13 16:30" // Date 형태의 String
//        
//let dateFormatter = DateFormatter()
//dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" // 2020-08-13 16:30
//        
//let convertDate = dateFormatter.date(from: dateStr) // Date 타입으로 변환
//        

