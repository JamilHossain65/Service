//
//  CustomTabbatController.swift
//  Service
//
//  Created by Hamza on 29/09/2022.
//

import UIKit
import SOTabBar

class CustomTabbarController: SOTabBarController {
    
    override func loadView() {
        super.loadView()
        SOTabBarSetting.tabBarHeight = 80.0
        SOTabBarSetting.tabBarBackground = UIColor.black
        SOTabBarSetting.tabBarTintColor = theme_color()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstVC = HomeController()
        let secondVC = ShopNewController()
        let thirdVC = ChatListController()
        let fourthVC = RequestListController()
        let fifthVC = ProfileController()
        
        firstVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home_tab"), selectedImage: UIImage(named: "home_tab_ic"))
        secondVC.tabBarItem = UITabBarItem(title: "Shop", image: UIImage(named: "shop_tab"), selectedImage: UIImage(named: "shop_tab_ic"))
        thirdVC.tabBarItem = UITabBarItem(title: "Chat", image: UIImage(named: "chat_tab"), selectedImage: UIImage(named: "chat_tab_ic"))
        fourthVC.tabBarItem = UITabBarItem(title: "Request", image: UIImage(named: "request_tab"), selectedImage: UIImage(named: "request_tab_ic"))
        fifthVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile_tab"), selectedImage: UIImage(named: "profile_tab_ic"))
        viewControllers = [firstVC, secondVC, thirdVC, fourthVC, fifthVC]
    }
    
     func soTabBar(_ tabBar: SOTabBar, didSelectTabAt index: Int) {
         tabBar.rootVC?.viewDidLoad()
         print("did Tapped On \(index)")
     }

}
