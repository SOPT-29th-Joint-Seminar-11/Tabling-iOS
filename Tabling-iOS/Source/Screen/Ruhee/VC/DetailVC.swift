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
        $0.separatorStyle = .none
        $0.delegate = self
        $0.dataSource = self
        BannerTVC.register(target: $0)
        TopDetailTVC.register(target: $0)
        BottomDetailTVC.register(target: $0)
    }
    
    private let bottomView = BottomView()

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
        view.addSubviews([detailTV, bottomView])
        
        detailTV.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.bottom.trailing.equalToSuperview()
        }
        
        bottomView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        
    }
    
    // MARK: - Custom Method

}

// MARK: - UITableViewDelegate

extension DetailVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0: return 204
        case 1: return 311
        default: return 542
        }
    }
}

// MARK: - UITableViewDataSource

extension DetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BannerTVC.className, for: indexPath) as? BannerTVC
            else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TopDetailTVC.className, for: indexPath) as? TopDetailTVC
            else { return UITableViewCell() }
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BottomDetailTVC.className, for: indexPath) as? BottomDetailTVC
            else { return UITableViewCell() }
            return cell
        }
    }
}
