//
//  ProfileController.swift
//  Service
//
//  Created by Hamza on 02/10/2022.
//

import UIKit

class ProfileController: UIViewController {
    
    lazy var headerView = View(backgroundColor: theme_color(),cornerRadius: 30)
    lazy var roleView = View(backgroundColor: .white,cornerRadius: 20)
    lazy var profileImg = ImageView(imageName: "profile_dummy_ic")
    lazy var editbtn = Button(imageName: "edit_ic")
    lazy var userNameLbl = Label(text: "Fazmila Mohammed", font: Font.bold(20), color: .black)
    lazy var userEmailLbl = Label(text: "fazmila@gmail.com", font: Font.medium(14), color: .black)
    lazy var roleLbl = Label(text: "Join Provider", font: Font.medium(16), color: .black)
    lazy var roleSwitch = createSwitch()
    lazy var profiletable = creatTable()
    
    let profileList = ProfileList.allCases
    var profileVM = ProfileVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }
    
    private func initUI() {
        view.backgroundColor = viewController_color()
        getData()
        profiletable.delegate = self
        profiletable.dataSource = self
        profiletable.register(ProfileTVCell.self, forCellReuseIdentifier: ProfileTVCell.cellidentifier)
        editbtn.isHidden = true
    }
    
    private func setup() {
        let margin = view.layoutMarginsGuide
        view.addSubview(headerView)
        view.addSubview(roleView)
        headerView.addSubview(profileImg)
        headerView.addSubview(editbtn)
        headerView.addSubview(userNameLbl)
        headerView.addSubview(userEmailLbl)
        roleView.addSubview(roleLbl)
        roleView.addSubview(roleSwitch)
        view.addSubview(profiletable)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0 * appConstant.heightRatio),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0  * appConstant.heightRatio),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0  * appConstant.heightRatio),
            headerView.heightAnchor.constraint(equalToConstant: 290 * appConstant.heightRatio),
            
            roleView.centerYAnchor.constraint(equalTo: headerView.bottomAnchor),
            roleView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 28 * appConstant.heightRatio),
            roleView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -28 * appConstant.heightRatio),
            roleView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            profileImg.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 60 * appConstant.heightRatio),
            profileImg.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            profileImg.heightAnchor.constraint(equalToConstant: 120 * appConstant.heightRatio),
            profileImg.widthAnchor.constraint(equalToConstant: 120 * appConstant.heightRatio),
            
            editbtn.trailingAnchor.constraint(equalTo: profileImg.trailingAnchor),
            editbtn.bottomAnchor.constraint(equalTo: profileImg.bottomAnchor),
            editbtn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            editbtn.widthAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            userNameLbl.topAnchor.constraint(equalTo: profileImg.bottomAnchor, constant: 10 * appConstant.heightRatio),
            userNameLbl.centerXAnchor.constraint(equalTo: profileImg.centerXAnchor),
            
            userEmailLbl.topAnchor.constraint(equalTo: userNameLbl.bottomAnchor, constant: 4 * appConstant.heightRatio),
            userEmailLbl.centerXAnchor.constraint(equalTo: profileImg.centerXAnchor),
            
            roleLbl.centerYAnchor.constraint(equalTo: roleView.centerYAnchor),
            roleLbl.leadingAnchor.constraint(equalTo: roleView.leadingAnchor, constant: 16 * appConstant.widthRatio),
            
            roleSwitch.centerYAnchor.constraint(equalTo: roleView.centerYAnchor),
            roleSwitch.trailingAnchor.constraint(equalTo: roleView.trailingAnchor, constant: -16 * appConstant.widthRatio),
            roleSwitch.widthAnchor.constraint(equalToConstant: 44 * appConstant.widthRatio),
            roleSwitch.heightAnchor.constraint(equalToConstant: 35 * appConstant.heightRatio),
            
            profiletable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profiletable.topAnchor.constraint(equalTo: roleView.bottomAnchor, constant: 12 * appConstant.heightRatio),
            profiletable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profiletable.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -14 * appConstant.heightRatio),
        ])
    }
    
    func getData() {
        self.showProgres()
        profileVM.getUser { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            self.userNameLbl.text = LoggedUserDetails.shared.user?.firstName
            self.userEmailLbl.text = LoggedUserDetails.shared.user?.email
        }
    }
}

extension ProfileController: UITableViewDelegate,UITableViewDataSource{
   
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        profileList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTVCell.cellidentifier, for: indexPath) as! ProfileTVCell
        cell.setupCellData(profileList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60 * appConstant.heightRatio
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let type = profileList[indexPath.row]
        if type == .logout {
            logout()
        } else if type == .terms {
            openTermsVC()
        } else if type == .contactUs {
            openContactusVC()
        } else if type == .aboutUs {
            abouttusVC()
        } else if type == .language {
            languageVC()
        } else if type == .chat {
            chatVC()
        } else if type == .pushNotification {
            notificationVC()
        } else if type == .editProfile {
            editProfileVC()
        } else if type == .productOrder {
            productOrderVC()
        } else if type == .serviceOrder {
            serviceVC()
        } else if type == .savedAddress {
            addressVC()
        }
    }
    
    private func openTermsVC() {
        self.navigationController?.pushViewController(TermsController(), animated: true)
    }
    
    private func openContactusVC() {
        self.navigationController?.pushViewController(ContactusController(), animated: true)
    }
    
    private func abouttusVC() {
        self.navigationController?.pushViewController(AboutUsController(), animated: true)
    }
    
    private func languageVC() {
        self.navigationController?.pushViewController(LanguageController(), animated: true)
    }
    
    private func chatVC() {
        let vc = ChatListController()
        vc.isFromMenu = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func notificationVC() {
        self.navigationController?.pushViewController(PushNotificationController(), animated: true)
    }
    
    private func editProfileVC() {
        self.navigationController?.pushViewController(EditProfileController(), animated: true)
    }
    
    private func productOrderVC() {
        self.navigationController?.pushViewController(ProductOrderController(), animated: true)
    }
    
    private func serviceVC() {
        let vc = RequestListController()
        vc.isFromMenu = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func addressVC() {
        self.navigationController?.pushViewController(AddressListController(), animated: true)
    }
    
    private func logout() {
        self.presentAlertWithAction(title: "Attention!", message: "Are you sure you want to logout?", positive: "YES", negative: "NO") {
            LoggedUserDetails.shared.logoutUser()
            self.setRootVC(OnBoardingController())
        }
    }
}

