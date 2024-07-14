//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by 쌩 on 7/11/24.
//

import UIKit

import Alamofire

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    let searchViewModel = SearchViewModel()
    
    let searchView = SearchView()
    override func loadView() {
        view = searchView
    }
    
    lazy var menuButton = {
        let item = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: #selector(menuButtonClicked(_:)))
        item.tintColor = .white
        return item
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureNav()
        bindData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
}
extension SearchViewController{
    private func bindData() {
        self.searchViewModel.outputCities.bind { value in
            self.searchView.tableView.reloadData()
        }
    }
    private func configureVC() {
        searchView.tableView.delegate = self
        searchView.tableView.dataSource = self
        searchView.searchBar.delegate = self
    }
    private func configureNav() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.backItem?.title = ""
        self.navigationItem.rightBarButtonItem = menuButton
    }
    @objc
    private func menuButtonClicked(_ sender: UIBarButtonItem) {
        print("메뉴버튼 클릭됨")
    }
}

extension SearchViewController {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchBar.text else { return }
        searchViewModel.inputKeyword.value = text
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchViewModel.outputCities.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data =  self.searchViewModel.outputCities.value[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: .none)
        cell.textLabel?.text = data?.name
        cell.textLabel?.font = .boldSystemFont(ofSize: 17)
        cell.detailTextLabel?.text = data?.country.rawValue
        cell.detailTextLabel?.textColor = .systemGray
        cell.imageView?.image = UIImage(systemName: "number")
        cell.imageView?.tintColor = .white
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data =  self.searchViewModel.outputCities.value[indexPath.row]
        if let lat = data?.coord.lat,
           let lon = data?.coord.lon {
            UserManager.lat = lat
            UserManager.lon = lon
        }
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        let vc = MainViewController()
        let nvc = UINavigationController(rootViewController: vc)
        sceneDelegate?.window?.rootViewController = nvc   // entrypoint
        sceneDelegate?.window?.makeKeyAndVisible()  //show
    }
}
