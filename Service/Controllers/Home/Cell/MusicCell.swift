//
//  MusicCell.swift
//  TheBeats
//
//  Created by MacBook Air on 6/22/22.
//

import UIKit
import AlamofireImage
import AVFoundation
import SnapKit

class MusicCell: UITableViewCell {
    
    lazy var profileButton: UIImageView = {
        let button = UIImageView()
        button.layer.cornerRadius = 24.r
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var selectButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 24.r
        //button.backgroundColor = .white.withAlphaComponent(0.4)
        button.setImage(UIImage(named: "blue_white_tik"), for: .normal)
        button.setImage(UIImage(named: "unselect"), for: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(selectButtonPressed), for: .touchUpInside)
        return button
    }()

    lazy var playButton: UIProgressButton = {
        let button = UIProgressButton()
        button.drawCircle()
        button.progress = 0.7
        button.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = AppTexts.translate_id_0001.rawValue.tr
        label.textColor = .black
        label.numberOfLines = 0
        label.attributedText = label.text?.subText(AppTexts.translate_id_0002.rawValue.tr, color: AppColors.blueText)
        label.font = AppFonts.HiraginoSansW7(ofSize: 13.sp)
        label.letterSpacing(spacing: 2.1)
        label.setLineHeight(lineHeight: 1.3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = AppTexts.translate_id_0001.rawValue.tr
        label.textColor = .white
        label.numberOfLines = 0
        label.attributedText = label.text?.subText(AppTexts.translate_id_0002.rawValue.tr, color: AppColors.blueText)
        label.font = AppFonts.HiraginoSansW7(ofSize: 13.sp)
        label.letterSpacing(spacing: 2.1)
        label.setLineHeight(lineHeight: 1.3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var profileButtonCallback : ((_ button: UIButton) -> ())?
    var playButtonCallback    : ((_ button: UIButton) -> ())?
    var selectButtonCallback  : ((_ button: UIButton) -> ())?
    
    var music: Music?
    var layoutCalled = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = AppColors.transparent
        
        [   titleLabel,
            subtitleLabel,
            profileButton,
            playButton,
            selectButton,
        ].forEach { view in
            contentView.addSubview(view)
        }

        playButton   .setTitle("", for: .normal)
        playButton   .setTitle("", for: .selected)
        selectButton .setTitle("", for: .normal)
        
        selectButton.setImage(UIImage(named: "unselect"), for: .normal)
        
        //set color
        titleLabel.textColor    = AppColors.app_black
        subtitleLabel.textColor = AppColors.grayText
        
        if tag <= 2 { //this is only for ui design
            var mFrame = selectButton.frame
            mFrame.origin.y += CGFloat(tag)
            selectButton.frame = mFrame
            //
            mFrame = playButton.frame
            mFrame.origin.y += CGFloat(tag)
            playButton.frame = mFrame
            //playButton.tag = 1000 + tag
            
            playButton.drawCircle()
            playButton.progress = 0.0
            //musicDownloadProgress()
        }
        
        //font
        titleLabel.font = AppFonts.HiraginoSansW6(ofSize: 14.sp)
        subtitleLabel.font = AppFonts.HiraginoSansW3(ofSize: 12.sp)
        
        //set corner radius
        profileButton.layer.masksToBounds = true
        profileButton.layer.cornerRadius = 5.r
        
        //set profile button corner radius
        profileButton.clipsToBounds = true
        profileButton.layer.cornerRadius = 5.r
        
        playButton.clipsToBounds = true
        playButton.layer.cornerRadius = 15.r
        playButton.backgroundColor = .white
        
        defineLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !layoutCalled {
            layoutCalled = true
        }
        
        bindingView()
    }
    
    func getType(_ music:Music)-> String{
        var type = ""
        switch music.music_type{
        case "tracks":
            type = AppTexts.translate_id_0079.rawValue.tr + " . " + music.artist_name
            break
        case "artists":
            type = AppTexts.translate_id_0080.rawValue.tr
            break
        case "playlists":
            type = AppTexts.translate_id_0081.rawValue.tr
            break
        case "albums":
            type = AppTexts.translate_id_0082.rawValue.tr
            break
            
        default:
            type = ""
            break
        }
        return type
    }
    
    //MARK: - Button action
    @objc func profileButtonPressed(sender:UIButton){
        sender.tag = tag
        profileButtonCallback?(sender)
    }
    
    @objc func playButtonPressed(sender:UIButton){
        //sender.tag = tag
        playButtonCallback?(sender)
    }
    
    @objc func selectButtonPressed(_ sender:UIButton){
        sender.tag = tag
        selectButtonCallback?(sender)
    }
    
    //MARK: - ==== BINDING VIEW ====
    private func bindingView() {
        if let _music = music {
            titleLabel.text = _music.music_name
            subtitleLabel.text = "\(self.getType(_music))"
            
            //set profile image
            if _music.artwork.count > 0 {
                if let url = URL(string: _music.artwork){
                    profileButton.af.setImage(withURL: url)
                }
            }
            
            if _music.isSelected {
                selectButton.setImage(UIImage(named: "blue_white_tik"), for: .normal)
            }else{
                selectButton.setImage(UIImage(named: "unselect"), for: .normal)
            }
        }
    }
    
    //MARK: - ==== DEFINE LAYOUT ====
    private func defineLayout() {
        profileButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(0.s) 
            make.leading.equalToSuperview().offset(0.s)
            make.width.equalTo(55.s)
            make.height.equalTo(54.s)
        }
        
        selectButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(0.s)
            make.trailing.equalToSuperview().offset(-4.s)
            make.width.equalTo(30.s)
            make.height.equalTo(30.s)
        }
        
        playButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(0.s)
            make.trailing.equalTo(selectButton.snp.leading).offset(-16.s)
            make.width.equalTo(30.s)
            make.height.equalTo(30.s)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16.s)
            make.leading.equalTo(profileButton.snp.trailing).offset(10.s)
            make.trailing.equalTo(playButton.snp.leading).offset(-10.s)
            make.width.equalTo(147.s)
            make.height.equalTo(20.s)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2.s)
            make.leading.equalTo(profileButton.snp.trailing).offset(10.s)
            make.trailing.equalTo(playButton.snp.leading).offset(-10.s)
            make.width.equalTo(147.s)
            make.height.equalTo(15.s)
        }
    }
}
