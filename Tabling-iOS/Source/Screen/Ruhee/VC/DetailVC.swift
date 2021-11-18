//
//  DetailVC.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/14.
//

import UIKit

import SnapKit
import Then

class DetailVC: UIViewController {
    
    // MARK: - Properties

    private lazy var detailTV = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        BannerTVC.register(target: $0)
        DetailTVC.register(target: $0)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setupAutoLayout()
    }
    
    // MARK: - UI + Layout

    func configUI() {
        tabBarController?.tabBar.isHidden = true
    }
    
    func setupAutoLayout() {
        view.addSubviews([detailTV])
        
        detailTV.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.bottom.trailing.equalToSuperview()
        }
        
    }
    
    // MARK: - Custom Method

}

// MARK: - UITableViewDelegate

extension DetailVC: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension DetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BannerTVC.className, for: indexPath) as? BannerTVC
            else { return UITableViewCell() }
            cell.backgroundColor = .yellow
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTVC.className, for: indexPath) as? DetailTVC
            else { return UITableViewCell() }
            cell.backgroundColor = .systemPink
            return cell
        }
    }
}
