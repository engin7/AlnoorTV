//
//  UserCell.swift
//  AlnoorTV
//
//  Created by Onur Yıldırım on 12.10.2019.
//  Copyright © 2019 Teknoloji. All rights reserved.
//

import UIKit
import SnapKit

class UserCell: UITableViewCell {

    private let imgProfileHeightAndWidth = 50
    private let imgProfileLeftOffset = 20
    private let lblUserNameLeftOffset = 15
    
    var imgProfile = UIImageView()
    var lblUserName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.initUI()
    }
    
    private func initUI() {
        self.selectionStyle = .none
        
        imgProfile.layer.cornerRadius = CGFloat(imgProfileHeightAndWidth / 2)
        imgProfile.layer.masksToBounds = true
        self.addSubview(imgProfile)
        
        self.addSubview(lblUserName)
    }
    
    override func layoutSubviews() {
        self.imgProfile.snp.makeConstraints { (make) in
            make.height.equalTo(imgProfileHeightAndWidth)
            make.width.equalTo(imgProfileHeightAndWidth)
            make.centerY.equalTo(self.snp.centerY)
            make.left.equalTo(self.snp.left).offset(imgProfileLeftOffset)
        }
        
        self.lblUserName.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.left.equalTo(self.imgProfile.snp.right).offset(lblUserNameLeftOffset)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
