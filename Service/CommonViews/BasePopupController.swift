//
//  BasePopupController.swift
//  TheBeats
//
//  Created by jmlhossain65@gmail.com on 3/09/22.
//

import UIKit

open class BasePopupController: UIViewController, UIGestureRecognizerDelegate {
    
    public enum PopupPosition {
        case center(CGPoint?)
        case topLeft(CGPoint?)
        case topRight(CGPoint?)
        case bottomLeft(CGPoint?)
        case bottomRight(CGPoint?)
        case top(CGFloat)
        case left(CGFloat)
        case bottom(CGFloat)
        case right(CGFloat)
        case offsetFromView(CGPoint? = nil, UIView)
    }
    
    private(set) open var popupWidth: CGFloat?
    private(set) open var popupHeight: CGFloat?
    private(set) open var position: PopupPosition = .center(nil)
    open var backgroundAlpha: CGFloat = 0.2
    open var backgroundColor = UIColor.label
    open var canTapOutsideToDismiss = true
    open var cornerRadius: CGFloat = 0
    open var shadowEnabled = true
    private(set) open var contentController: UIViewController?
    private(set) open var contentView: UIView?
    
    private var containerView = UIView()
    private var isViewDidLayoutSubviewsCalled = false
    
    var _heightConstraint : NSLayoutConstraint!
    var _topConstraint    : NSLayoutConstraint!
    var _bottomConstraint : NSLayoutConstraint!
    
    var touchPopupY = 0.0
    var startMoveY  = 0.0
    var viewSmallerEnable = false
    var popupViewBaseHeight = 0.0
    //var selectedMusic:ResponseData?
    
    //MARK: - ==== INIT METHOD ====
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public init(contentController: UIViewController, position: PopupPosition = .center(nil), popupWidth: CGFloat?, popupHeight: CGFloat?) {
        super.init(nibName: nil, bundle: nil)
        self.contentController = contentController
        self.contentView = contentController.view
        self.popupWidth = popupWidth
        self.popupHeight = popupHeight
        self.position = position
        
        popupViewBaseHeight = self.popupHeight ?? 0.0
    
        commonInit()
    }
    
    public init(contentView: UIView, position: PopupPosition = .center(nil), popupWidth: CGFloat?, popupHeight: CGFloat?) {
        super.init(nibName: nil, bundle: nil)
        self.contentView = contentView
        self.popupWidth = popupWidth
        self.popupHeight = popupHeight
        self.position = position
        
        commonInit()
    }
    
    private func commonInit() {
        //modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .coverVertical
        
        cornerRadius = 19.s
        backgroundAlpha = 0.0
        backgroundColor = .clear
        canTapOutsideToDismiss = true
        shadowEnabled = true
        modalPresentationStyle = .custom
    }
    
    //MARK: - ==== PRIVATE METHOD ====
    func refreshPopup(height: CGFloat) {
        _heightConstraint.constant = height
        view.layoutIfNeeded()
    }
    
    func refreshPopup(top: CGFloat) {
        _topConstraint.constant = top
        view.layoutIfNeeded()
    }
    
    func refreshPopup(bottom: CGFloat) {
        _bottomConstraint.constant = bottom
        view.layoutIfNeeded()
    }

    override open func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        addDismissGesture()
        addSwipeGesture()
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if isViewDidLayoutSubviewsCalled == false {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.setupViews()
            }
        }
        
        isViewDidLayoutSubviewsCalled = true
    }
    
    private func addDismissGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissTapGesture(gesture:)))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    
    private func addSwipeGesture() {
        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(gesture:)))
        swipeUpGesture.delegate = self
        swipeUpGesture.direction = .up
        contentController?.view.addGestureRecognizer(swipeUpGesture)
        
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(gesture:)))
        swipeDownGesture.delegate = self
        swipeDownGesture.direction = .down
        contentController?.view.addGestureRecognizer(swipeDownGesture)
    }
    
    private func setupUI() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView?.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = backgroundColor.withAlphaComponent(backgroundAlpha)
        
        if cornerRadius > 0 {
            contentView?.layer.cornerRadius = cornerRadius
            contentView?.layer.masksToBounds = true
        }
        
        if shadowEnabled {
            containerView.layer.shadowOpacity = 0.2
            containerView.layer.shadowColor = UIColor.white.cgColor
            containerView.layer.shadowRadius = 3
        }
    }
    
    private func setupViews() {
        if let contentController = contentController {
            addChild(contentController)
        }
        
        addViews()
        addSizeConstraints()
        addPositionConstraints()
        
        if isDevelopment{
            let imaView = UIImageView(frame: UIScreen.main.bounds)
            imaView.image = UIImage(named: "report")
            imaView.alpha = 0.6
            //view.addSubview(imaView)
        }
    }
    
    private func addViews() {
        view.addSubview(containerView)
        
        if let contentView = contentView {
            containerView.addSubview(contentView)
            
            let topConstraint = NSLayoutConstraint(item: contentView, attribute: .top, relatedBy: .equal, toItem: containerView, attribute: .top, multiplier: 1, constant: 0)
            let leftConstraint = NSLayoutConstraint(item: contentView, attribute: .left, relatedBy: .equal, toItem: containerView, attribute: .left, multiplier: 1, constant: 0)
            let bottomConstraint = NSLayoutConstraint(item: contentView, attribute: .bottom, relatedBy: .equal, toItem: containerView, attribute: .bottom, multiplier: 1, constant: 0)
            let rightConstraint = NSLayoutConstraint(item: contentView, attribute: .right, relatedBy: .equal, toItem: containerView, attribute: .right, multiplier: 1, constant: 0)
            NSLayoutConstraint.activate([topConstraint, leftConstraint, bottomConstraint, rightConstraint])
        }
    }
    
    //MARK: - ==== ADD CONSTRAINT ====
    private func addSizeConstraints() {
        if let popupWidth = popupWidth {
            let widthConstraint = NSLayoutConstraint(item: containerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: popupWidth)
            NSLayoutConstraint.activate([widthConstraint])
        }
        
        if let popupHeight = popupHeight {
            let heightConstraint = NSLayoutConstraint(item: containerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: popupHeight)
            NSLayoutConstraint.activate([heightConstraint])
            _heightConstraint = heightConstraint
        }
    }
    
    private func addPositionConstraints() {
        switch position {
        case .center(let offset):
            addCenterPositionConstraints(offset: offset)
            
        case .topLeft(let offset):
            addTopLeftPositionConstraints(offset: offset, anchorView: nil)
            
        case .topRight(let offset):
            addTopRightPositionConstraints(offset: offset)
            
        case .bottomLeft(let offset):
            addBottomLeftPositionConstraints(offset: offset)
            
        case .bottomRight(let offset):
            addBottomRightPositionConstraints(offset: offset)
            
        case .top(let offset):
            addTopPositionConstraints(offset: offset)
            
        case .left(let offset):
            addLeftPositionConstraints(offset: offset)
            
        case .bottom(let offset):
            addBottomPositionConstraints(offset: offset)
            
        case .right(let offset):
            addRightPositionConstraints(offset: offset)
            
        case .offsetFromView(let offset, let anchorView):
            addTopLeftPositionConstraints(offset: offset, anchorView: anchorView)
        }
    }
    
    private func addCenterPositionConstraints(offset: CGPoint?) {
        let centerXConstraint = NSLayoutConstraint(item: containerView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: offset?.x ?? 0)
        let centerYConstraint = NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: offset?.y ?? 0)
        NSLayoutConstraint.activate([centerXConstraint, centerYConstraint])
    }
    
    private func addTopLeftPositionConstraints(offset: CGPoint?, anchorView: UIView?) {
        var position: CGPoint = offset ?? .zero
        
        if let anchorView = anchorView {
            let anchorViewPosition = view.convert(CGPoint.zero, from: anchorView)
            position = CGPoint(x: position.x + anchorViewPosition.x, y: position.y + anchorViewPosition.y)
        }
        
        let topConstraint = NSLayoutConstraint(item: containerView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: position.y)
        let leftConstraint = NSLayoutConstraint(item: containerView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: position.x)
        NSLayoutConstraint.activate([topConstraint, leftConstraint])
    }
    
    private func addTopRightPositionConstraints(offset: CGPoint?) {
        let topConstraint = NSLayoutConstraint(item: containerView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: offset?.y ?? 0)
        let rightConstraint = NSLayoutConstraint(item: view as Any, attribute: .right, relatedBy: .equal, toItem: containerView, attribute: .right, multiplier: 1, constant: offset?.x ?? 0)
        NSLayoutConstraint.activate([topConstraint, rightConstraint])
    }
    
    private func addBottomLeftPositionConstraints(offset: CGPoint?) {
        let bottomConstraint = NSLayoutConstraint(item: view as Any, attribute: .bottom, relatedBy: .equal, toItem: containerView, attribute: .bottom, multiplier: 1, constant: offset?.y ?? 0)
        let leftConstraint = NSLayoutConstraint(item: containerView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: offset?.x ?? 0)
        NSLayoutConstraint.activate([bottomConstraint, leftConstraint])
    }
    
    private func addBottomRightPositionConstraints(offset: CGPoint?) {
        let bottomConstraint = NSLayoutConstraint(item: view as Any, attribute: .bottom, relatedBy: .equal, toItem: containerView, attribute: .bottom, multiplier: 1, constant: offset?.y ?? 0)
        let rightConstraint = NSLayoutConstraint(item: view as Any, attribute: .right, relatedBy: .equal, toItem: containerView, attribute: .right, multiplier: 1, constant: offset?.x ?? 0)
        NSLayoutConstraint.activate([bottomConstraint, rightConstraint])
    }
    
    private func addTopPositionConstraints(offset: CGFloat) {
        let topConstraint = NSLayoutConstraint(item: containerView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: offset)
        _topConstraint = topConstraint
        let centerXConstraint = NSLayoutConstraint(item: view as Any, attribute: .centerX, relatedBy: .equal, toItem: containerView, attribute: .centerX, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([topConstraint, centerXConstraint])
    }
    
    private func addLeftPositionConstraints(offset: CGFloat) {
        let leftConstraint = NSLayoutConstraint(item: containerView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: offset)
        let centerYConstraint = NSLayoutConstraint(item: view as Any, attribute: .centerY, relatedBy: .equal, toItem: containerView, attribute: .centerY, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([leftConstraint, centerYConstraint])
    }
    
    private func addBottomPositionConstraints(offset: CGFloat) {
        let bottomConstraint = NSLayoutConstraint(item: view as Any, attribute: .bottom, relatedBy: .equal, toItem: containerView, attribute: .bottom, multiplier: 1, constant: offset)
        _bottomConstraint = bottomConstraint
        let centerXConstraint = NSLayoutConstraint(item: view as Any, attribute: .centerX, relatedBy: .equal, toItem: containerView, attribute: .centerX, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([bottomConstraint, centerXConstraint])
    }
    
    private func addRightPositionConstraints(offset: CGFloat) {
        let rightConstraint = NSLayoutConstraint(item: view as Any, attribute: .right, relatedBy: .equal, toItem: containerView, attribute: .right, multiplier: 1, constant: offset)
        let centerXConstraint = NSLayoutConstraint(item: view as Any, attribute: .centerY, relatedBy: .equal, toItem: containerView, attribute: .centerY, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([rightConstraint, centerXConstraint])
    }
    
    @objc func dismissTapGesture(gesture: UIGestureRecognizer) {
        dismiss(animated: true) {
        }
    }
    
    @objc func swipeGesture(gesture: UIGestureRecognizer) {
        
        guard let _gesture = gesture as? UISwipeGestureRecognizer else { return }
        
        switch _gesture.direction {
        case .down:
            print("swipe down")
            break
            
        default:
            print("swipe up")
            break
        }
    }
    
    //MARK: - ==== TAP GESTURE ====
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return false
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: view)
            let positionSubview = touch.location(in: contentController?.view)
            let wHeight = UIScreen.main.bounds.height
            touchPopupY = positionSubview.y
            startMoveY  = position.y
            refreshPopup(height: wHeight - position.y + touchPopupY)
        }
    }
    
    open override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: view)
            let wHeight = UIScreen.main.bounds.height
            
            var newHeight = wHeight - position.y + touchPopupY
            
            if viewSmallerEnable {
                if newHeight > popupViewBaseHeight {
                    newHeight = popupViewBaseHeight
                }
            }else{
                if newHeight < popupViewBaseHeight {
                    newHeight = popupViewBaseHeight
                }
            }
            
            refreshPopup(height: newHeight)
        }
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: view)
            let wHeight = UIScreen.main.bounds.height
            var middlePostionY = 0.5*(wHeight - popupViewBaseHeight)
            
            if viewSmallerEnable{
                middlePostionY = 0.5*popupViewBaseHeight
            }
            
            var newHeight = viewSmallerEnable ? popupViewBaseHeight : wHeight
            if viewSmallerEnable{
                if position.y - startMoveY > middlePostionY {
                    dismiss(animated: true)
                }
            }else{
                if position.y - touchPopupY > middlePostionY {
                    newHeight = popupViewBaseHeight
                }
            }
            
            refreshPopup(height:newHeight)
        }
    }
}
