//
//  ProgressView.swift
//  TheBeats
//
//  Created by MacBook Air on 6/16/22.
//

import UIKit

class ProgressView: UIView {
    
    //MARK: - ===== OVERRIDE UI VERIABLE =====
    var leftPadding  = 0.s
    var rightPadding = 0.s
    var middleGap    = 5.s
    var buttonHeight = 1.5.s
    var totalWidth   = 327.s
    var buttonGapX   = 5.s
    var progress     = 0.0
    var totalSegment = 3
    
    var bgViewColor  = UIColor.white.withAlphaComponent(0.5)
    var progressViewColor = UIColor.white
    
    override func draw(_ rect: CGRect) {
        refreshTagview()
    }
    
    func refreshTagview(){
        for subview in subviews {
            subview.removeFromSuperview()
        }
        
        var startPoint = CGPoint.zero
        startPoint.x = leftPadding
        startPoint.y = 1.s
        
        for index in 0...totalSegment - 1 {
            let width = getLabelWidth()
            let progressLabel = addButton(index,startPoint)
            
            startPoint.x += CGFloat(width)
            let startX = startPoint.x - CGFloat(index) * CGFloat(buttonGapX)
            let currentProgress = progress*totalWidth
            
            if startX <= currentProgress{
                //print("selected:\(startX - CGFloat(index)*width)")
                progressLabel.backgroundColor = .white
            }else{
                if startX - width < currentProgress {
                    //print("Part selected[\(startX - width)]:\(width  - startX + currentProgress)")
                    var mFrame = progressLabel.frame
                    mFrame.size.width = width  - startX + currentProgress
                    progressLabel.frame = mFrame
                    progressLabel.backgroundColor = progressViewColor
                }else{
                    //print("not selected:0")
                    progressLabel.backgroundColor = bgViewColor
                    
                }
            }
            
            startPoint.x += CGFloat(buttonGapX)
        }
    }
    
    //MARK: - ===== PRIVATE METHOD =====
    private func addButton(_ index:Int, _ startPoint:CGPoint) -> UILabel{
        let lblWidth = getLabelWidth()
        
        let progressLabel = UILabel()
        var mFrame = CGRect(x: 0, y: 0, width: lblWidth, height: buttonHeight)
        mFrame.origin = startPoint
        progressLabel.frame = mFrame
        progressLabel.tag = index
        //progressLabel.layer.cornerRadius = 0.0
        progressLabel.backgroundColor =  progressViewColor
        
        let progressbg = UILabel()
        progressbg.backgroundColor = bgViewColor
        progressbg.frame = progressLabel.frame
        addSubview(progressbg)
        addSubview(progressLabel)
        return progressLabel
    }
    
    private func getLabelWidth() -> CGFloat{
        if totalSegment <= 0 { return 0.0 }
        
        let totalGap = CGFloat(totalSegment - 1) * buttonGapX
        let newWidth = totalWidth - totalGap
        
        if newWidth <= 0 { return 0.0 }
        
        let lblWidth = newWidth/CGFloat(totalSegment)
        return lblWidth
    }
}
