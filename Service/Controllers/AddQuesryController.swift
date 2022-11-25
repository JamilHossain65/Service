//
//  addQuesryController.swift
//  Service
//
//  Created by Hamza on 01/10/2022.
//

import UIKit
import KMPageControl

class AddQuesryController: BaseController {
    
    lazy var pageControl: KMPageControl = {
        let control = KMPageControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.activeSize = CGSize(width: 30, height: 10)
        control.inactiveSize = CGSize(width: 30, height: 10)
        control.activeColor = theme_color()
        control.inactiveColor = theme_color()
        return control
    }()
    
    lazy var addQueryLbl = Label(text: "Add your query", font: Font.semiBold(16), color: .black)
    lazy var queryTxtView = createTxtView(rad: 20)
    lazy var uploadLbl = Label(text: "Upload (Photo / Video)", font: Font.semiBold(16), color: .black)
    lazy var uploadCV = createCV()
    lazy var proceedBtn = createcustomeBtn(text:  "Proceed")
    
    var headingTitle: String = ""
    var categoryId: Int = 0
    var date: String = ""
    var hour: String = ""
    var time: String = ""
    
    var mediaList: [UIImage] = [UIImage(named: "plus_ic")!]

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }
    
    private func initUI() {
        baseHeadingLbl.text = headingTitle
        searchButtomView.isHidden = true
        showBackbtn(true)
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        uploadCV.delegate = self
        uploadCV.dataSource = self
        uploadCV.register(MediaCVCell.self, forCellWithReuseIdentifier: MediaCVCell.identifier)
        proceedBtn.addTarget(self, action: #selector(proceedBtnTapped), for: .touchUpInside)
        
    }
    
    private func setup() {
        childView.addSubview(pageControl)
        childView.addSubview(addQueryLbl)
        childView.addSubview(queryTxtView)
        childView.addSubview(uploadLbl)
        childView.addSubview(uploadCV)
        childView.addSubview(proceedBtn)
        
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 14 * appConstant.heightRatio),
            pageControl.centerXAnchor.constraint(equalTo: childView.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            pageControl.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            
            addQueryLbl.topAnchor.constraint(equalTo: childView.topAnchor, constant: 88 * appConstant.heightRatio),
            addQueryLbl.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            
            queryTxtView.leadingAnchor.constraint(equalTo: addQueryLbl.leadingAnchor),
            queryTxtView.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -11 * appConstant.widthRatio),
            queryTxtView.topAnchor.constraint(equalTo: addQueryLbl.bottomAnchor, constant: 11 * appConstant.heightRatio),
            queryTxtView.heightAnchor.constraint(equalToConstant: 120 * appConstant.heightRatio),
            
            uploadLbl.topAnchor.constraint(equalTo: queryTxtView.bottomAnchor, constant: 30 * appConstant.heightRatio),
            uploadLbl.leadingAnchor.constraint(equalTo: addQueryLbl.leadingAnchor, constant: 0 * appConstant.widthRatio),
            
            uploadCV.leadingAnchor.constraint(equalTo: addQueryLbl.leadingAnchor),
            uploadCV.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -11 * appConstant.widthRatio),
            uploadCV.topAnchor.constraint(equalTo: uploadLbl.bottomAnchor, constant: 11 * appConstant.heightRatio),
            uploadCV.heightAnchor.constraint(equalToConstant: 100 * appConstant.heightRatio),
            
            proceedBtn.bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: -29 * appConstant.heightRatio),
            proceedBtn.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 77 * appConstant.widthRatio),
            proceedBtn.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -77 * appConstant.widthRatio),
            proceedBtn.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
        ])
        
    }
    
    @objc func proceedBtnTapped() {
        if queryTxtView.text.isEmpty {
            self.showErrorView(message: "Please add query first")
            return
        } else if mediaList.count == 1 {
            self.showErrorView(message: "Please upload Image first")
            return
        }
        
        let vc = ProviderController()
        vc.date = date
        vc.time = time
        vc.hour = hour
        vc.categoryId = categoryId
        vc.note = queryTxtView.text.stringValue
        vc.headingTitle = headingTitle
        if mediaList.count > 1 {
            self.mediaList.removeFirst()
            vc.mediaList = self.mediaList
        }
        self.navigationController?.pushViewController(vc, animated: false)
    }
}

extension AddQuesryController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mediaList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediaCVCell.identifier, for: indexPath) as! MediaCVCell
        cell.serviceImg.image = mediaList[indexPath.row]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            openGallery()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100 * appConstant.widthRatio, height: 100 * appConstant.heightRatio )
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 * appConstant.widthRatio
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0 * appConstant.widthRatio, bottom: 0 * appConstant.heightRatio, right: 2 * appConstant.widthRatio)
    }
    
}

extension AddQuesryController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private func openGallery() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[.originalImage] as? UIImage {
            mediaList.append(image)
            uploadCV.reloadData()
        }
        picker.dismiss(animated: true)
    }
}
