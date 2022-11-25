//
//  LoginController.swift
//  Service
//
//  Created by Hamza on 27/09/2022.
//

import UIKit
import WMSegmentControl

class LoginController: UIViewController {
    
    lazy var headerImg = ImageView(imageName: "splash_ic")
    lazy var topView = View(backgroundColor: theme_lightGray(),cornerRadius: 30 * appConstant.heightRatio)
    let segment = WMSegment()
    lazy var scrollViewContainer =  View()
    var scrollView = UIScrollView()
    lazy var pageController : UIPageControl = {
        let page = UIPageControl()
        page.backgroundColor = .clear
        page.translatesAutoresizingMaskIntoConstraints = false
        page.tintColor = .red
        page.pageIndicatorTintColor = .lightGray
        page.currentPageIndicatorTintColor = theme_color()
        return page
    }()
    
    lazy var signupView = SignupView()
    lazy var loginView = LoginView()
    
    var profileVM = ProfileVM()
    var loginVM = LoginVM()
    var registerVM = RigsterVM()
    var slideX = 0
    var slides:[UIView] = []
    var currentPage = 0
    var firstPage = false
    var secondPage = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmentControl()
        view.backgroundColor = viewController_color()
        slides = createSlides()
        scrollView.contentSize = CGSize(width: self.scrollViewContainer.frame.width * 1,height: self.scrollViewContainer.frame.height)
        scrollView.delegate = self
        scrollView.showsVerticalScrollIndicator = false
        setupSlideScrollView(slides: slides)
        pageController.numberOfPages = slides.count
        scrollViewContainer.bringSubviewToFront(pageController)
        pageController.currentPage = 0
        scrollView.isScrollEnabled = false
        initUI()
    }
    
    func initUI() {
        setup()
        loginView.isHidden = false
        signupView.isHidden = true
        loginView.delegate = self
        signupView.delegate = self
        loginVM.vc = self
        loginView.appleBtn.addTarget(self, action: #selector(appleBtnTapped), for: .touchUpInside)
        loginView.googleBtn.addTarget(self, action: #selector(googleBtnTapped), for: .touchUpInside)
        
//        setupSlides()
    }
    
    func setupSlides() {
        slides = createSlides()
        scrollView.contentSize = CGSize(width: self.scrollViewContainer.frame.width * 2,height: self.scrollViewContainer.frame.height)
        scrollView.delegate = self
        setupSlideScrollView(slides: slides)
        scrollView.isScrollEnabled = false
    }
    
    func setupSegmentControl() {
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.type = .normal
        segment.selectorType = .normal
        segment.isRounded = true
        segment.buttonTitles = "Login,Register"
        segment.textColor = .black
        segment.selectorTextColor = .black
        segment.selectorColor = theme_color()
        segment.SelectedFont = Font.semiBold()
        segment.normalFont = Font.regular()
        
        segment.onValueChanged = { index in
            if index == 0 {
                self.loginView.isHidden = false
                self.signupView.isHidden = true
            } else {
                self.loginView.isHidden  = true
                self.signupView.isHidden  = false
            }
        }
        
    }
    
    func setup() {
        let margin = view.layoutMarginsGuide
       
        view.addSubview(headerImg)
        view.addSubview(topView)
        topView.addSubview(segment)
        view.addSubview(signupView)
        view.addSubview(loginView)
//        view.addSubview(scrollViewContainer)
//        scrollViewContainer.addSubview(scrollView)
//        view.addSubview(pageController)
        
        NSLayoutConstraint.activate([
            headerImg.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0 * appConstant.widthRatio),
            headerImg.topAnchor.constraint(equalTo: margin.topAnchor, constant: 14 * appConstant.heightRatio),
            headerImg.widthAnchor.constraint(equalToConstant: 77 * appConstant.widthRatio),
            headerImg.heightAnchor.constraint(equalToConstant: 115 * appConstant.heightRatio),
            
            topView.topAnchor.constraint(equalTo: headerImg.bottomAnchor, constant: 40 * appConstant.heightRatio),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18 * appConstant.widthRatio),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18 * appConstant.widthRatio),
            topView.heightAnchor.constraint(equalToConstant: 70 * appConstant.heightRatio),
            
            segment.topAnchor.constraint(equalTo: topView.topAnchor, constant: 8 * appConstant.heightRatio),
            segment.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 8 * appConstant.widthRatio),
            segment.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -8 * appConstant.widthRatio),
            segment.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -8 * appConstant.heightRatio),
            
            loginView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 8 * appConstant.heightRatio),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
            loginView.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: 0 * appConstant.heightRatio),
            
            signupView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 8 * appConstant.heightRatio),
            signupView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            signupView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
            signupView.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: 0 * appConstant.heightRatio),
            
//            scrollViewContainer.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 8 * appConstant.heightRatio),
//            scrollViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
//            scrollViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
//            scrollViewContainer.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: 0 * appConstant.heightRatio),
            
//            scrollView.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor),
//            scrollView.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: scrollViewContainer.bottomAnchor,constant: 0 * appConstant.heightRatio),
//
//            pageController.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant:  -12 * appConstant.heightRatio),
//            pageController.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            pageController.heightAnchor.constraint(equalToConstant: 12 * appConstant.heightRatio),
        ])
    }
    
    func createSlides() -> [UIView] {
        let slide1 = LoginView.init()
        let slide2 = SignupView.init()
        return [slide2,slide1]
    }
    
    func setupSlideScrollView(slides : [UIView]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: scrollViewContainer.frame.height)
        scrollView.isPagingEnabled = false
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i * 2), y: 0, width: scrollViewContainer.frame.width, height: scrollViewContainer.frame.height)
            
            scrollView.addSubview(slides[i])
        }
    }

    @objc func appleBtnTapped() {
        loginVM.handleAppleIdRequest()
    }
    
    @objc func googleBtnTapped() {
        loginVM.googlebtn_press()
    }
}

extension LoginController : UIScrollViewDelegate{

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageController.currentPage = Int(pageIndex)
    }
    @objc func moveToNextPage() {
        //width of scrollView
        let pageWidth:CGFloat = self.scrollView.frame.width
        //Maximum width of scrollView based on number of images needed to animate
        let maxWidth:CGFloat = pageWidth * CGFloat(slides.count)
        let contentOffset:CGFloat = self.scrollView.contentOffset.x
        var slideX = contentOffset + pageWidth
        if contentOffset + pageWidth == maxWidth{
        //When attain maximum width of scrollView make X = 0 to start from beginning.
            slideX = 0
        }
        
        currentPage = currentPage + 1
//        self.scrollView.setContentOffset(bottomOffset, animated: true)
        self.scrollView.setContentOffset(CGPoint(x:slideX, y:0/*, width:pageWidth, height:self.scrollView.frame.height)*/), animated: true)
    }

}

extension LoginController: LoginDelegate, RegisterDelegate {
    
    func loginBtnTapped(loginRequest: LoginRequest) {
        let hasErrorMessage = loginVM.validate(email: loginRequest.email, password: loginRequest.password)
        if let message = hasErrorMessage {
            self.showErrorView(message: message)
            return
        }
        self.showProgres()
        loginVM.login(request: loginRequest) { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            } else {
                self.getData()
            }
            
        }
    }
    
    func getData() {
        self.showProgres()
        profileVM.getUser { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            }
            self.setRootVC(CustomTabbarController())
        }
    }
    
    func registerBtnTapped(registerRequest: RegisterRequest) {
        let hasErrorMessage = registerVM.validate(firstName: registerRequest.firstName, lastName: registerRequest.lastName, mobail:  registerRequest.mobile, email: registerRequest.email, password: registerRequest.password, confirmPassword: registerRequest.confirmPassword)
        if let message = hasErrorMessage {
            self.presentAlert(title: "Error", message: message)
            return
        }
        self.showProgres()
        registerVM.register(request: registerRequest) { errorMesage in
            self.dissmisProgress()
            if let message = errorMesage {
                self.showErrorView(message: message)
                return
            } else {
                self.loginView.isHidden = false
                self.signupView.isHidden = true
            }
            
        }
    }
}
