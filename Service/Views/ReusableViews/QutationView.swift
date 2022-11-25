//
//  Qutation.swift
//  Service
//
//  Created by Hamza on 08/10/2022.
//

import UIKit

class QutationView: UIView {
    
    lazy var qutationTable = creatTable()
    
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
        qutationTable.delegate = self
        qutationTable.dataSource = self
        qutationTable.register(QutationTVCell.self, forCellReuseIdentifier: QutationTVCell.cellidentifier)
        
    }
    func initialize_layout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(qutationTable)
        
        NSLayoutConstraint.activate([
            qutationTable.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            qutationTable.topAnchor.constraint(equalTo: self.topAnchor, constant: 8 * appConstant.heightRatio),
            qutationTable.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            qutationTable.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8 * appConstant.heightRatio),
        ])
    }
    
}

extension QutationView: UITableViewDelegate,UITableViewDataSource{
   
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QutationTVCell.cellidentifier, for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        118 * appConstant.heightRatio
    }
    
}

