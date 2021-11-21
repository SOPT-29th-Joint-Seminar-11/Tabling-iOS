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
    }
}

// MARK: - UITableViewDelegate

extension NamjoonMainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 106
    }
}

// MARK: - UITableViewDataSource

extension NamjoonMainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NJAddressTVC.className, for: indexPath) as? NJAddressTVC
        else { return UITableViewCell() }
        
        return cell
    }
    
    
}
