//
//  ProgressButton.swift
//  TheBeats
//
//  Created by MacBook Air on 8/2/22.
//

import UIKit

enum DownloadStatus {
    case remote
    case downloading
    case paused
    case resumed
    case success
}
// MARK: extension is not ideal, a better solution should be a subclass of UIButton
class UIProgressButton: UIButton {
    var progress: Float = 0 {
        didSet {
            drawCircle()
            circleShape.strokeEnd = CGFloat(self.progress)
            clipsToBounds = true
            layoutIfNeeded()
        }
    }
    
    var circleShape = CAShapeLayer()
    public func drawCircle() {
        let x: CGFloat = 0.0
        let y: CGFloat = 0.0
        let circlePath = UIBezierPath(roundedRect: CGRect(x: x, y: y, width: self.frame.height, height: self.frame.height), cornerRadius: self.frame.height / 2).cgPath
        circleShape.path = circlePath
        circleShape.lineWidth   = 2.5
        circleShape.strokeColor = AppColors.blue.cgColor // UIColor.blue.cgColor
        circleShape.strokeStart = 0
        circleShape.strokeEnd   = 0
        circleShape.fillColor   = UIColor.clear.cgColor
        self.layer.addSublayer(circleShape)
    }
    
    // MARK: - Update the download status
    var status: DownloadStatus = .remote {
        didSet{
            var buttonImageName = ""
            switch self.status {
            case .remote:
                buttonImageName = "progress" //"DownloadButton"
            case .downloading:
                buttonImageName = "progress" //"PauseButton"
            case .success:
                buttonImageName = "play" //"DeleteButton"
            case .paused:
                buttonImageName = "progress" //"DownloadButton"
            case .resumed:
                buttonImageName = "progress" //"PauseButton"
            }
            self.setImage(UIImage(named: buttonImageName), for: .normal)
        }
    }
}
