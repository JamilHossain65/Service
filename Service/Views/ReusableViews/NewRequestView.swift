//
//  NewRequestView.swift
//  Service
//
//  Created by Hamza on 08/10/2022.
//

import UIKit

class NewRequestView: UIView {
    
    lazy var requestTable = creatTable()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = false
        commonInit()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    func commonInit() {
        
        initialize_setup()
        initialize_layout()
    }
    func initialize_setup() {
        requestTable.delegate = self
        requestTable.dataSource = self
        requestTable.register(NewRequestTVCell.self, forCellReuseIdentifier: NewRequestTVCell.cellidentifier)
        
    }
    func initialize_layout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(requestTable)
        
        NSLayoutConstraint.activate([
            requestTable.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            requestTable.topAnchor.constraint(equalTo: self.topAnchor, constant: 8 * appConstant.heightRatio),
            requestTable.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            requestTable.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8 * appConstant.heightRatio),
        ])
    }
    
}

extension NewRequestView: UITableViewDelegate,UITableViewDataSource{
   
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewRequestTVCell.cellidentifier, for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        118 * appConstant.heightRatio
    }
    
}

