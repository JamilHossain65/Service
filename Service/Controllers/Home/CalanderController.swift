//
//  CalanderController.swift
//  Service
//
//  Created by Hamza on 01/10/2022.
//

import UIKit
import FSCalendar
import KMPageControl

class CalanderController: BaseController  {
    
    lazy var dateLbl = Label(text: "Select Date", font: Font.semiBold(16), color: .black)
    lazy var calender = FSCalendar()
    lazy var timeLbl = Label(text: "Pick time", font: Font.semiBold(16), color: .black)
    lazy var timeCV = createCV()
    lazy var hourLbl = Label(text: "Number of Hours", font: Font.semiBold(16), color: .black)
    lazy var hourCV = createCV()
    lazy var nextBtn = createcustomeBtn(text:  "Next")
    lazy var pageControl: KMPageControl = {
        let control = KMPageControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.activeSize = CGSize(width: 30, height: 10)
        control.inactiveSize = CGSize(width: 30, height: 10)
        control.activeColor = theme_color()
        control.inactiveColor = theme_gray()
        return control
    }()
    
    var timeList = ["00:00", "00:30", "01:00", "01:30", "00:30", "02:00", "02:30", "03:00", "03:30", "04:00", "04:30", "05:00", "05:30", "06:00", "06:30", "07:00", "07:30", "08:00", "08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00", "18:30", "19:00", "19:30", "20:00", "20:30", "21:00", "21:30", "22:00", "22:30", "23:00",  "23:00"]
    var hourList = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    var selectedTimeIndex = 0
    var selectedHourIndex = 0
    var selectedDate: String = Date().apiFormatDate
    var selectedTime: String = ""
    var selectedHours: String = ""
    var headingTitle: String = ""
    var categoryId: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setup()
    }
    
    private func initUI() {
        baseHeadingLbl.text = headingTitle
        searchButtomView.isHidden = true
        showBackbtn(true)
        calender.translatesAutoresizingMaskIntoConstraints = false
        calender.delegate = self
        calender.dataSource = self
        calender.tintColor = .black
        calender.appearance.selectionColor = theme_color()
        calender.appearance.weekdayTextColor = .black
        calender.appearance.todayColor = .black
        timeCV.delegate = self
        timeCV.dataSource = self
        timeCV.register(TimeCVCell.self, forCellWithReuseIdentifier: TimeCVCell.identifier)
        hourCV.delegate = self
        hourCV.dataSource = self
        hourCV.register(TimeCVCell.self, forCellWithReuseIdentifier: TimeCVCell.identifier)
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        nextBtn.addTarget(self, action: #selector(proceedBtnTapped), for: .touchUpInside)
        
    }
    
    private func setup() {
        childView.addSubview(pageControl)
        childView.addSubview(dateLbl)
        childView.addSubview(calender)
        childView.addSubview(timeLbl)
        childView.addSubview(timeCV)
        childView.addSubview(hourCV)
        childView.addSubview(hourLbl)
        childView.addSubview(nextBtn)
        
        NSLayoutConstraint.activate([
            
            pageControl.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 14 * appConstant.heightRatio),
            pageControl.centerXAnchor.constraint(equalTo: childView.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            pageControl.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            
            dateLbl.topAnchor.constraint(equalTo: childView.topAnchor, constant: 88 * appConstant.heightRatio),
            dateLbl.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            
            calender.leadingAnchor.constraint(equalTo: dateLbl.leadingAnchor),
            calender.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -11 * appConstant.widthRatio),
            calender.topAnchor.constraint(equalTo: dateLbl.bottomAnchor, constant: 11 * appConstant.heightRatio),
            calender.heightAnchor.constraint(equalToConstant: 250 * appConstant.heightRatio),
            
            timeLbl.topAnchor.constraint(equalTo: calender.bottomAnchor, constant: 20 * appConstant.heightRatio),
            timeLbl.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            
            timeCV.leadingAnchor.constraint(equalTo: timeLbl.leadingAnchor),
            timeCV.topAnchor.constraint(equalTo: timeLbl.bottomAnchor, constant: 11 * appConstant.heightRatio),
            timeCV.trailingAnchor.constraint(equalTo: calender.trailingAnchor),
            timeCV.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            hourLbl.topAnchor.constraint(equalTo: timeCV.bottomAnchor, constant: 20 * appConstant.heightRatio),
            hourLbl.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            
            hourCV.leadingAnchor.constraint(equalTo: hourLbl.leadingAnchor),
            hourCV.topAnchor.constraint(equalTo: hourLbl.bottomAnchor, constant: 11 * appConstant.heightRatio),
            hourCV.trailingAnchor.constraint(equalTo: calender.trailingAnchor),
            hourCV.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            nextBtn.bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: -29 * appConstant.heightRatio),
            nextBtn.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 77 * appConstant.widthRatio),
            nextBtn.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -77 * appConstant.widthRatio),
            nextBtn.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
        ])
    }

    @objc func proceedBtnTapped() {
        let vc = AddQuesryController()
        vc.date = selectedDate
        vc.time = selectedTime
        vc.hour = selectedHours
        vc.categoryId = categoryId
        vc.headingTitle = headingTitle
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
 
extension CalanderController: FSCalendarDelegate,FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.selectedDate = date.apiFormatDate
    }
}

extension CalanderController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (collectionView == hourCV ? hourList.count : timeList.count )
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeCVCell.identifier, for: indexPath) as! TimeCVCell
        if collectionView == hourCV {
            cell.timeLbl.text = hourList[indexPath.row]
            if indexPath.row == selectedHourIndex {
                cell.bgView.backgroundColor = theme_color()
                self.selectedHours = hourList[indexPath.row]
            } else {
                cell.bgView.backgroundColor = tf_border()
            }
        } else {
            cell.timeLbl.text = timeList[indexPath.row]
            if indexPath.row == selectedTimeIndex {
                cell.bgView.backgroundColor = theme_color()
                self.selectedTime = timeList[indexPath.row]
            } else {
                cell.bgView.backgroundColor = tf_border()
            }
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == hourCV {
            selectedHourIndex = indexPath.row
        } else {
            selectedTimeIndex = indexPath.row
        }
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == hourCV {
            return CGSize(width: 38 * appConstant.widthRatio, height: 38 * appConstant.heightRatio )
        } else {
            return CGSize(width: 100 * appConstant.widthRatio, height: 38 * appConstant.heightRatio )
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 * appConstant.widthRatio
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0 * appConstant.widthRatio, bottom: 0 * appConstant.heightRatio, right: 2 * appConstant.widthRatio)
    }
}



