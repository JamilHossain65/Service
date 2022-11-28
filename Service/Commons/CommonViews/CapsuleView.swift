//
//  CapsuleView.swift
//  TheBeats
//
//  Created by MacBook Air on 6/16/22.
//

import UIKit

protocol CapsuleViewDelegate: AnyObject {
    func didTapCapsuleButton(_ button: UIButton)
    func didTapDeleteButton (_ button: UIButton)
}

class CapsuleView: UIScrollView {

    var leftPadding  = 5.0
    var rightPadding = 5.0
    var middleGap    = 5.0
    var imageWidth   = 24.0
    var padding      = 0.0
    
    //scroll view map dynamically
    var buttonGapX = 10.0
    var buttonGapY = 10.0
    var lineHeight = 34.0
    
//    var dataArray = ["#今聴くべき","#おしゃれ","#おしゃれ","#おしゃれ","#ぴえん","#今聴くべき","#おしゃれ","#おしゃれ","#おしゃれ","#ぴえん","#今聴くべき","#おしゃれ","#おしゃれ","#おしゃれ","#ぴえん"]
//    var dataStatus = [true,false,false,false,true,true,false,false,false,true,true,false,false,false,true]
    
    var dataArray = ["#今聴くべき","#おしゃれ","#おしゃれ","#おしゃれ","#おしゃれ"]
    var dataStatus = [true,false,false,false,false]
    var colorArray:[UIColor]?
    
    var feelsButton : UIButton!
    weak var delegate2: CapsuleViewDelegate?
    
//    public enum viewType {
//        case fixedRow(Int?)
//        case fixedCol(Int?)
//    }
    
    var isVerticalScroll  = true
    var buttonTouchEnable = true
    
    override func draw(_ rect: CGRect) {
        if isVerticalScroll{
            refreshVertical()
        }else{
            refreshHorizontal()
        }
    }
    
    func refreshVertical(){
        for subview in subviews {
            subview.removeFromSuperview()
        }
        
        var startPoint = CGPoint.zero
        startPoint.y = 6.0
        
        for (index,title) in dataArray.enumerated(){
            let width =  getWidth(title,dataStatus[index])
            //print("start point::\(startPoint) width::\(width)")
            addButton(index,title,dataStatus[index],startPoint)
            
            if let _ = colorArray {
                let width2 =  getWidth2(title, dataStatus[index])
                startPoint.x += CGFloat(7) + CGFloat(width2)
                
            }else{
                startPoint.x += CGFloat(buttonGapX) + CGFloat(width)
            }
            
            //check for new line
            if startPoint.x + width > frame.size.width {
                startPoint.x = 0
                startPoint.y += lineHeight + buttonGapY
            }
        }
        
        var newSize = contentSize
        newSize.height = startPoint.y + lineHeight //
        contentSize = newSize
    }
    
    func refreshHorizontal(){
        for subview in subviews {
            subview.removeFromSuperview()
        }
        
        var startPoint = CGPoint.zero
        startPoint.y = 6.0
        
        for (index,title) in dataArray.enumerated(){
            let width =  getWidth(title,dataStatus[index])
            //print("start point::\(startPoint) width::\(width)")
            addButton(index,title,dataStatus[index],startPoint)
            
            if let _ = colorArray {
                let width2 =  getWidth2(title, dataStatus[index])
                startPoint.x += CGFloat(7) + CGFloat(width2)
                
            }else{
                startPoint.x += CGFloat(buttonGapX) + CGFloat(width)
            }
            
//            //check for new line
//            if startPoint.x + width > frame.size.width {
//                startPoint.x = 0
//                startPoint.y += lineHeight + buttonGapY
//            }
        }
        
        var newSize = contentSize
        newSize.width = startPoint.x
        contentSize = newSize
    }
    
    func addButton(_ index:Int, _ title:String, _ selected:Bool, _ startPoint:CGPoint){
        let textWidth = getWidth(title,selected)
        
        //button
        feelsButton = UIButton()
        var mFrame = CGRect(x: 0, y: 0, width: textWidth, height: 34)
        mFrame.origin = startPoint
        feelsButton.frame = mFrame
        feelsButton.tag = index
        feelsButton.isSelected = selected
        feelsButton.layer.cornerRadius = 17
        feelsButton.layer.borderWidth = 0.5
        feelsButton.layer.borderColor = UIColor.init(hexString: "#A3A3A3").cgColor
        feelsButton.setTitleColor(UIColor.init(hexString: "#A3A3A3"), for: .normal)
        feelsButton.setTitleColor(.white, for: .selected)
        feelsButton.setImage(UIImage(), for: .normal)
        feelsButton.setImage(UIImage(named:"white_tick"), for: .selected)
        feelsButton.setTitle(title, for: .normal)
        feelsButton.titleLabel?.font = UIFont(name: "HiraginoSans-W3", size: 14)!.withWeight(UIFont.Weight(400))
        feelsButton.titleLabel?.setLetterSpacingBy(value: 1)
        if selected {
            feelsButton.backgroundColor = UIColor.init(hexString: "#316CFF") //#316CFF blue color
            feelsButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
            feelsButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
        }else{
            feelsButton.backgroundColor = .white
        }
        
        if let _colorArray = colorArray {
            feelsButton.layer.borderWidth = 0
            let textWidth2 = getWidth2(title,selected)
            var mFrame2 = CGRect(x: 0, y: 0, width: textWidth2, height: 28)
            mFrame2.origin = startPoint
            feelsButton.frame = mFrame2
            feelsButton.titleLabel?.font = UIFont(name: "HiraginoSans-W3", size: 12)!.withWeight(UIFont.Weight(400))
            
            if selected {
                feelsButton.setTitleColor(_colorArray[1], for: .selected)
                feelsButton.backgroundColor = _colorArray[3]
            }else{
                feelsButton.setTitleColor(.white, for: .normal)
                feelsButton.backgroundColor = _colorArray[index] //index == 2 ? AppColors.yellow : _colorArray[2] //#316CFF blue
            }
            
            feelsButton.layer.cornerRadius = 14
            //99,74,62 h:28
            //print("feelsButton::\(feelsButton.frame)")
        }
        
        if buttonTouchEnable {
            feelsButton.addTarget(self, action: #selector(feelsButtonPressed(_:)), for: .touchUpInside)
            
            //let tapGesture = UITapGestureRecognizer(target: self, action: #selector (tap))  //Tap function will call when user tap on button
            //tapGesture.numberOfTapsRequired = 2'
            //feelsButton.addGestureRecognizer(tapGesture)
            let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressed(_:)))  //Long function will call when user long press on button.
            
            longGesture.minimumPressDuration = 1.0
            feelsButton.addGestureRecognizer(longGesture)
        }
        
        addSubview(feelsButton)
    }
    
    @objc func longPressed(_ guesture:UILongPressGestureRecognizer) {
        if guesture.state != .ended {
            let parrentButton = guesture.view as! UIButton
            print("Long press:\(parrentButton.tag)")
            //add delete button
            let deleteButton = UIButton()
            var dFrame = CGRect(x: 0, y: 0, width: 20, height: 20)
            dFrame.origin.x = parrentButton.frame.size.width - 15.0
            dFrame.origin.y = -2
            
            deleteButton.frame = dFrame
            deleteButton.tag = 100 + (guesture.view?.tag ?? 0)
            deleteButton.layer.zPosition = 100 //todo not work
            deleteButton.layer.cornerRadius = 10
            deleteButton.setImage(UIImage(named:"white_cross"), for: .normal)
            deleteButton.setBackgroundImage(UIImage(named:"delete"), for: .normal)
            deleteButton.addTarget(self, action: #selector(deleteButtonPressed(_:)), for: .touchUpInside)
            parrentButton.addSubview(deleteButton)
            
            //select attempt to delete button
//            parrentButton.isSelected = true
//            feelsButtonPressed(parrentButton)
            
        }
    }
    
    func getWidth(_ text:String, _ selected:Bool) -> CGFloat{
        if selected{
            padding = leftPadding + rightPadding + middleGap + imageWidth
        }else{
            padding = 25.0
        }
        
        let textLabel = UILabel()
        textLabel.text = text //82,21
        textLabel.setLetterSpacingBy(value: 1)
        textLabel.font = UIFont(name: "HiraginoSans-W3", size: 14)!.withWeight(UIFont.Weight(400))
        let textWidth = textLabel.intrinsicContentSize.width + CGFloat(padding)
        return textWidth
    }
    
    func getWidth2(_ text:String, _ selected:Bool) -> CGFloat {
        if selected {
            padding = leftPadding + rightPadding
        }else{
            padding = 28
        }
        
        let textLabel = UILabel()
        textLabel.text = text //82,21
        textLabel.setLetterSpacingBy(value: 1)
        textLabel.font = UIFont(name: "HiraginoSans-W3", size: 12)!.withWeight(UIFont.Weight(400))
        let textWidth = textLabel.intrinsicContentSize.width + CGFloat(padding)
        return textWidth
    }
    
    @objc func feelsButtonPressed(_ sender:UIButton){
        if let _delegate2 = delegate2{
            _delegate2.didTapCapsuleButton(sender)
        }
        
        var tempArray:[Bool] = []
        
        for(index,status) in dataStatus.enumerated(){
            if index == sender.tag{
                tempArray.append(!status)
            }else{
                tempArray.append(status)
            }
        }
        
        dataStatus = tempArray
        
        refreshVertical()
    }
    
    @objc func deleteButtonPressed(_ sender:UIButton){
        print("sender::\(sender.tag)")
        if let _delegate2 = delegate2{
            _delegate2.didTapDeleteButton(sender)
        }
    }
    
    
}
