//
//  YujinMainVC.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/14.
//

import UIKit

class YujinMainVC: UIViewController {
    
    // MARK: - Properties
    let tableView = UITableView()
    let locationModel = LocationModel()
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
       
        setupAutoLayout()
        setDelegate()
        registerCell()
    }
    
    // MARK: - UI + Layout

    func configUI() {
        
    }
    
    func setupAutoLayout() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0).isActive =  true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: 0).isActive = true
        
        tableView.sectionHeaderHeight = 86
       
        
       
    }
    
    // MARK: - Custom Method
    
    func setDelegate(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func registerCell(){
        tableView.register(LocationTVC.self, forCellReuseIdentifier: "LocationTVC")
        tableView.register(SearchHeader.self,forHeaderFooterViewReuseIdentifier: "SearchHeader")
    }
    

}

    //MARK: - UITableViewDataSource

extension YujinMainVC: UITableViewDataSource{
    
    //섹션 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 1{
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SearchHeader") as! SearchHeader
            return view
        }
       return nil
        
    }
    
    //섹션별 셀 개수 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        case 1:
            return 8
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0://위치 정보가 있는 섹션
            switch indexPath.row{
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationTVC.identifier, for: indexPath) as? LocationTVC
                else { return UITableViewCell() }
                
                cell.setData(locationData: locationModel)
                return cell
            default :
                return UITableViewCell()
            }
        default :
            return UITableViewCell()
        }
    }
    
    
    
    
    
}

    //MARK: - UITableViewDelegate
extension YujinMainVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0:
            return 58
        default :
            return 80
        }
        
    }
}


