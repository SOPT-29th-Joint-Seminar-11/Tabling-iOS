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
    let titleModel = TitleModel()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        setupAutoLayout()
        setupTableView()
    }
    
    // MARK: - UI + Layout

    func configUI() {
        
    }
    
    func setupAutoLayout() {
        view.addSubview(tableView)
        
        tableView.sectionHeaderTopPadding = 0
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0).isActive =  true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: 0).isActive = true
    }
    
    // MARK: - Custom Method
    
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(LocationTVC.self, forCellReuseIdentifier: "LocationTVC")
        tableView.register(SearchHeader.self,forHeaderFooterViewReuseIdentifier: "SearchHeader")
        tableView.register(TitleTVC.self, forCellReuseIdentifier: "TitleTVC")
        tableView.register(StoreListTVC.self, forCellReuseIdentifier: "StoreListTVC")
    }
}

    //MARK: - UITableViewDataSource

extension YujinMainVC: UITableViewDataSource{
    
    //섹션 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //헤더 뷰 모양
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
           return nil
        }
        if section == 1{
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SearchHeader") as! SearchHeader
            view.backgroundConfiguration?.backgroundColor = .white
            return view
        }
       return nil
        
    }
    
    //헤더 높이
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section{
        case 0:
            return 0
        case 1:
            return 86
        default:
            return 0
        }
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
    
    //행별 반환셀 결정
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
        case 1:
            switch indexPath.row{
            case 0,2,4://타이틀 셀
                guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTVC.identifier, for: indexPath) as? TitleTVC
                else { return UITableViewCell() }
                
                cell.setData(titleData: titleModel, index: indexPath.row/2)
                return cell
            case 1,5://상점 목록 셀
                guard let cell = tableView.dequeueReusableCell(withIdentifier: StoreListTVC.identifier, for: indexPath) as? StoreListTVC
                else { return UITableViewCell() }
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
        switch indexPath.section{
        case 0:
            switch indexPath.row{
            case 0:
                return 58
            default :
                return 100
            }
        case 1:
            switch indexPath.row{
            case 0,2,4 :
                return 53
            case 1,5:
                return 221
            case 3 :
                return 30
            case 6:
                return 180
            default:
                return 100
            }
        default:
            return 10
        }
    }
}


