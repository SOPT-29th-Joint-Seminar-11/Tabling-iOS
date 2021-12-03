//
//  DetailVC.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/14.
//

import UIKit

import SnapKit
import Then

class DetailVC: UIViewController, ReserveButtonDelegate {
    
    // MARK: - Properties
    
    public var cafeID = 1
    
    private var networkMG = DetailManager.shared
    
    private var messeage = ""
    
    private lazy var detailTV = UITableView().then {
        $0.allowsSelection = false
        $0.separatorStyle = .none
        $0.delegate = self
        $0.dataSource = self
        BannerTVC.register(target: $0)
        TopDetailTVC.register(target: $0)
        BottomDetailTVC.register(target: $0)
    }
    
    private lazy var bottomView = BottomButtonView().then {
        $0.reserveDelegate = self
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setupAutoLayout()
        networkMG.fetchDetail {
            self.detailTV.reloadData()
        }
    }
    
    // MARK: - UI + Layout
    
    func configUI() {
        tabBarController?.tabBar.isHidden = true
    }
    
    func setupAutoLayout() {
        view.addSubviews([detailTV, bottomView])
        
        detailTV.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
        
        bottomView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    // MARK: - Custom Method
    
    func clickReserveButton() {
        networkMG.postReserve(cafeID: cafeID) {
            guard let reserveData = self.networkMG.reserveData else { return }
            
            if reserveData.flag == false {
                self.messeage = "즉시 예약하겠습니다."
            } else if reserveData.flag == true {
                self.messeage = "이미 예약하셨습니다."
            }
            
            let alertVC = UIAlertController(title: "예약 가능 여부", message: self.messeage, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default)
            alertVC.addAction(okAction)
            self.present(alertVC, animated: true, completion: nil)
            
        }
    }
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
            cell.setData()
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TopDetailTVC.className, for: indexPath) as? TopDetailTVC
            else { return UITableViewCell() }
            cell.setData()
            cell.starImageView.image = cell.setStarImage()
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BottomDetailTVC.className, for: indexPath) as? BottomDetailTVC
            else { return UITableViewCell() }
            cell.setData()
            return cell
        }
    }
}
