//
//  HomeController.swift
//  Service
//
//  Created by Hamza on 28/09/2022.
//

import UIKit
import SnapKit
import KMPageControl
import IQKeyboardManagerSwift

class HomeController: BaseController {
    
    lazy var serviceTable = creatTable()
    
    lazy var scrollbgView =  View()
    lazy var scrollView = UIScrollView()
    
    var selectedIndexArray = [0,0,0,0]
    
    var homeVM = HomeVM()
    var searchVM = SearchVM()
    
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
        commonInit()
    }
    
    @objc func doneButtonClicked(_ sender: Any) {
        isSearching = false
        searchTF.resignFirstResponder()
        serviceTable.reloadData()
    }
    
    func commonInit() {
        
        initialize_setup()
    }
   
    func initialize_setup() {
        searchTF.delegate = self
        searchTF.addDoneOnKeyboardWithTarget(self, action: #selector(doneButtonClicked))
        
        serviceTable.delegate = self
        serviceTable.dataSource = self
        serviceTable.register(ServiceTVCell.self, forCellReuseIdentifier: ServiceTVCell.cellidentifier)
        serviceTable.reloadData()
    }

    private func initUI() {
        scrollbgView.backgroundColor = viewController_color()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        getData()
    }
    
    private func setup() {
        childView.addSubview(scrollView)
        scrollView.addSubview(scrollbgView)
        scrollbgView.addSubview(serviceTable)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: childView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: childView.bottomAnchor),
            scrollView.widthAnchor.constraint(equalToConstant:  375 * appConstant.widthRatio),
            
            scrollbgView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 60 * appConstant.heightRatio),
            scrollbgView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollbgView.trailingAnchor.constraint(equalTo:scrollView.trailingAnchor),
            scrollbgView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollbgView.widthAnchor.constraint(equalToConstant:  375 * appConstant.widthRatio),
            
            serviceTable.topAnchor.constraint(equalTo: scrollbgView.topAnchor, constant: 80 * appConstant.heightRatio),
            serviceTable.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor),
            serviceTable.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor),
            serviceTable.heightAnchor.constraint(equalToConstant: 500 * appConstant.heightRatio),
            serviceTable.bottomAnchor.constraint(equalTo: scrollbgView.bottomAnchor),
        ])
    }
    
    func getData() {
        self.showProgres()
        homeVM.getDashboard { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            self.serviceTable.reloadData()
        }
    }
    
    func doSearchRequest(_ text:String){
       // self.showProgres()
        searchVM.getSearchedDashboard(searchText:text , completion: { errorMesage in
            //self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            
            print("searchVM::\(self.searchVM.searviceList.count)")
            self.isSearching = true
            
            self.serviceTable.reloadData()
        })
    }
}

extension HomeController: ServiceViewDelegate {
    func didTapPageControll(_ serviceView:ServiceView, currentPage: Int) {
        print("didTappedPageControll[\(serviceView.tag)]::\(currentPage)")
        selectedIndexArray[serviceView.tag] = currentPage
        serviceTable.reloadData()
    }
        
    func viewAllBtnTapped(subcategories: [SubCategoryModel], heading: String) {
        let vc = ViewAllController()
        vc.heading = heading
        vc.categories = subcategories
        if let nav:UINavigationController = self.navigationController?.visibleViewController?.parent as? UINavigationController {
            nav.pushViewController(vc, animated: true)
        }
    }
    
    func serviceSelect(id: Int, title: String) {
        let vc = CalanderController()
        vc.categoryId = id
        vc.headingTitle = title
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension HomeController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return 1
        }
        return homeVM.catgoriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ServiceTVCell.cellidentifier, for: indexPath) as! ServiceTVCell
        
        if indexPath.row % 2 == 1{
            cell.backgroundColor = .white
        }else{
            cell.backgroundColor = UIColor("#f9f9f9")
        }
        
        cell.tag = indexPath.row
        
        
        cell.repareView.delegate = self
        
        if isSearching {
            cell.repareView.isSearching = isSearching
            cell.repareView.serviceList = self.searchVM.searviceList
            cell.repareView.tag = indexPath.row
            cell.repareView.serviceText = "Search Result"
            cell.repareView.serviceCV.reloadData()
        }else{
            let category = self.homeVM.catgoriesList[indexPath.row]
            cell.repareView.category = category
            cell.repareView.tag = indexPath.row
            cell.repareView.serviceText = category.category_name ?? ""
            cell.repareView.serviceCV.reloadData()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        230 * appConstant.heightRatio
    }
    
}

extension HomeController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        
        let fullText = textField.text ?? "" + string
        if fullText.count > 0{
            print("search text:::\(fullText)")
            doSearchRequest(fullText)
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

