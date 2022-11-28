//
//  ConfirmAlertController.swift
//  TheBeats
//
//  Created by MacBook Air on 6/22/22.
//

import UIKit

enum ALERT_TYPE {
    case FEEL_DELETE_TYPE
    case EMOTION_BACK_TYPE
    case SONG_CONFIRM_TYPE
    case CONFIRM_TYPE
    case OKAY_TYPE
}

class ConfirmAlertController: UIViewController {

    @IBOutlet weak var alertSubview  : UIView!
    @IBOutlet weak var messagelabel  : UILabel!
    @IBOutlet weak var cancelButton  : UIButton!
    @IBOutlet weak var confirmButton : UIButton!
    
    var cancelCompletion : ((_ button: UIButton) -> ())?
    var confirmCompletion: ((_ button: UIButton) -> ())?
    
    var alertType:ALERT_TYPE = .FEEL_DELETE_TYPE
    
    var alertTitle   = "Title"
    var alertMessage = "Message"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertSubview.layer.cornerRadius  = 20
        cancelButton.layer.cornerRadius  = 26
        confirmButton.layer.cornerRadius = 26
        
        var mFrame = alertSubview.frame
        mFrame.origin.x = 20.scale()
        alertSubview.frame = mFrame
 
        if let _window = view.window {
            alertSubview.center = _window.center
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        switch alertType{
        case .EMOTION_BACK_TYPE:
            discardNoteAlert()
            break
        case .SONG_CONFIRM_TYPE:
            songConfirmAlert()
            break
        case .CONFIRM_TYPE:
            yesNoAlert()
            break
        case .OKAY_TYPE:
            okayAlert()
            break
        default:
            print("default")
        }
        
    }
    
    func discardNoteAlert(){
//        投稿をキャンセルしますか？
//        このまま破棄すると、
//        現在入力中の内容が失われます。
        
        //破棄
        //続ける
        var mFrame = alertSubview.frame
        mFrame.size.height += 31
        alertSubview.frame = mFrame
        
        mFrame = messagelabel.frame
        mFrame.origin.y = 31
        mFrame.size.height = 100
        messagelabel.frame = mFrame
        //270,73
        messagelabel.numberOfLines = 0
        
        messagelabel.text = "投稿をキャンセルしますか？\nこのまま破棄すると、\n現在入力中の内容が失われます。"
        cancelButton.setTitle("破棄", for: .normal)
        confirmButton.setTitle("続ける", for: .normal)
    }
    
    func songConfirmAlert(){
        var mFrame = alertSubview.frame
        mFrame.size.width  = 335.s
        mFrame.size.height = 145.s
        alertSubview.frame = mFrame
        
        mFrame = messagelabel.frame
        mFrame.origin.y = 30.s
        mFrame.size.height = 40.s
        messagelabel.frame = mFrame
        messagelabel.numberOfLines = 1
        
        messagelabel.text = AppTexts.translate_id_0009.rawValue.tr
        cancelButton.setTitle(AppTexts.translate_id_0010.rawValue.tr, for: .normal)
        confirmButton.setTitle(AppTexts.translate_id_0011.rawValue.tr, for: .normal)
    }
    
    func okayAlert(){
        var mFrame = alertSubview.frame
        mFrame.size.width  = 335.s
        mFrame.size.height = 145.s
        alertSubview.frame = mFrame
        
        mFrame = messagelabel.frame
        mFrame.origin.y = 30.s
        mFrame.size.height = 40.s
        messagelabel.frame = mFrame
        messagelabel.numberOfLines = 0
        
        cancelButton.isHidden = true
        confirmButton.center.x = alertSubview.center.x - 20.s
        
        messagelabel.text = alertMessage
        confirmButton.setTitle(AppTexts.translate_id_0029.rawValue.tr, for: .normal)
    }
    
    func yesNoAlert(){
        var mFrame = alertSubview.frame
        mFrame.size.width  = 335.s
        mFrame.size.height = 145.s
        alertSubview.frame = mFrame
        
        mFrame = messagelabel.frame
        mFrame.origin.y = 30.s
        mFrame.size.height = 40.s
        messagelabel.frame = mFrame
        messagelabel.numberOfLines = 0
        
        messagelabel.text = alertMessage
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        if let _ = cancelCompletion {
            cancelCompletion?(sender)
        }else{
            view.removeFromSuperview()
        }
    }
    
    @IBAction func confirmButtonPressed(_ sender: UIButton) {
        if let _ = confirmCompletion{
            confirmCompletion?(sender)
        }else{
            view.removeFromSuperview()
        }
    }
}
