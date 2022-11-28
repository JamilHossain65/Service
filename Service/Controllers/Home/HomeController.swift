//
//  HomeController.swift
//  Service
//
//  Created by Hamza on 28/09/2022.
//

import UIKit

class Attach {
    static let shared = Attach()
    
    var youtube_url : String = ""
    var imageUrl    : String = ""
}

class HomeController: BaseController {
    
    lazy var repareView = ServiceView.init()
    lazy var architecturalView = ServiceView.init()
    lazy var popularView = ServiceView.init()
    lazy var scrollbgView =  View()
    lazy var scrollView = UIScrollView()
    
    var musicDataArray: [Attach] = []
    
    lazy var tableview: UITableView = {
        let table = UITableView()
//        table.dataSource = self
//        table.delegate   = self
//        table.separatorColor  = AppColors.transparent
//        table.backgroundColor = AppColors.transparent
//        table.register( MusicCell.self, forCellReuseIdentifier: "\(MusicCell.self)")
        table.register(AttachCell.self, forCellReuseIdentifier: "\(AttachCell.self)")
        return table
    }()
    
    
    var homeVM = HomeVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
        
    }
    
    private func initUI() {
        scrollbgView.backgroundColor = viewController_color()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        architecturalView.backgroundColor = .white
        repareView.serviceText = "REPAIR SERVICES"
        architecturalView.serviceText = "ARCHITECTURAL  SERVICES"
        popularView.serviceText = "POPULAR SERVICES"
        repareView.delegate = self
        architecturalView.delegate = self
        popularView.delegate = self
        getData()
    }
    
    private func setup() {
        childView.addSubview(scrollView)
        scrollView.addSubview(scrollbgView)
        scrollbgView.addSubview(repareView)
        scrollbgView.addSubview(architecturalView)
        scrollbgView.addSubview(popularView)
        
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
            
            repareView.topAnchor.constraint(equalTo: scrollbgView.topAnchor, constant: 80 * appConstant.heightRatio),
            repareView.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor),
            repareView.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor),
            repareView.heightAnchor.constraint(equalToConstant: 200 * appConstant.heightRatio),
            
            architecturalView.topAnchor.constraint(equalTo: repareView.bottomAnchor, constant: 0 * appConstant.heightRatio),
            architecturalView.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor),
            architecturalView.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor),
            architecturalView.heightAnchor.constraint(equalToConstant: 200 * appConstant.heightRatio),
            
            popularView.topAnchor.constraint(equalTo: architecturalView.bottomAnchor, constant: 0 * appConstant.heightRatio),
            popularView.leadingAnchor.constraint(equalTo: scrollbgView.leadingAnchor),
            popularView.trailingAnchor.constraint(equalTo: scrollbgView.trailingAnchor),
            popularView.heightAnchor.constraint(equalToConstant: 200 * appConstant.heightRatio),
            popularView.bottomAnchor.constraint(equalTo: scrollbgView.bottomAnchor, constant: -12 * appConstant.heightRatio)
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
            self.repareView.category = self.homeVM.catgoriesList.first
            self.architecturalView.category = self.homeVM.catgoriesList[1]
            self.popularView.category = self.homeVM.catgoriesList[2]
        }
    }
}

extension HomeController: ServiceViewDelegate {
    
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

//MARK: - TABLE VIEW DELEGATE METHOD
extension HomeController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.musicDataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        let music = musicDataArray[indexPath.section]
//        if music.isSelected,indexPath.row == 1{
//            return 56
//        }
        return 64
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let music = self.musicDataArray[indexPath.section]
        
//        if music.isSelected && indexPath.row == 1 {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AttachCell", for: indexPath) as? AttachCell else { return UITableViewCell() }
//            cell.tag = indexPath.section + indexPath.row
//           // cell.attachTextField.delegate = self
//            cell.attachTextField.text = Attach.shared.youtube_url
//            return cell
//        }
        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath) as? MusicCell else { return UITableViewCell() }
//        cell.tag = indexPath.section
//        cell.playButton.tag  = 10000 + indexPath.section
//        cell.music = music
//
//        cell.selectButtonCallback = { button in
//
//        }
        
        return UITableViewCell()
    }
}

