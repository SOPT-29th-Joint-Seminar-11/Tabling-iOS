//
//  NamjoonMainVC.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/14.
//

import UIKit

class NamjoonMainVC: UIViewController {
    
    // MARK: - Properties
    
    let mainTV = UITableView()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setUpAutoLayout()
        setUpTableView()
    }
    
    // MARK: - Custom Method
    
    func configureUI() {
        // 모서리 둥글기나 그밖의 찐 설정...
    }
    
    func setUpAutoLayout() {
        view.addSubviews([mainTV])
        
        if #available(iOS 15, *) {
            mainTV.sectionHeaderTopPadding = 0
        }
        
        mainTV.translatesAutoresizingMaskIntoConstraints = false
        
        mainTV.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        mainTV.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        mainTV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        mainTV.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    }
    
    func setUpTableView() {
        mainTV.delegate = self
        mainTV.dataSource = self
        //tableView.register(NamjoonAddressTVC.self, forCellReuseIdentifier: NamjoonAddressTVC.className)
        NJAddressTVC.register(target: mainTV) // UITableViewRegisterable Extension을 활용해서 짧게!
        NJCafeTVC.register(target: mainTV)
        NJReviewTVC.register(target: mainTV)
        NJStoreTVC.register(target: mainTV)
        NJBannerTVC.register(target: mainTV)
    }
}

// MARK: - UITableViewDelegate

extension NamjoonMainVC: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 1:
            return NamjoonComponent()
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1:
            return UITableView.automaticDimension
        default:
            return 0
        }
    }
    
    // footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
}

// MARK: - UITableViewDataSource

extension NamjoonMainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return 4
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 1:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: NJCafeTVC.className, for: indexPath) as? NJCafeTVC
                else { return UITableViewCell() }
                
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: NJReviewTVC.className, for: indexPath) as? NJReviewTVC
                else { return UITableViewCell() }
                
                return cell
            case 2:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: NJStoreTVC.className, for: indexPath) as? NJStoreTVC
                else { return UITableViewCell() }
                
                return cell
            default:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: NJBannerTVC.className, for: indexPath) as? NJBannerTVC
                else { return UITableViewCell() }
                
                return cell
            }
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NJAddressTVC.className, for: indexPath) as? NJAddressTVC
            else { return UITableViewCell() }
            
            return cell
        }
    }
}
