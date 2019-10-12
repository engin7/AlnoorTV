//
//  RepoCell.swift
//  AlnoorTV
//
//  Created by Onur Yıldırım on 12.10.2019.
//  Copyright © 2019 Teknoloji. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {

    var repoObject = RepoModel()
    
    private let viewBottomLine: UIView = {
       let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private var lblDescription: UILabel = {
        let label = UILabel()
        label.text = "Description: "
        return label
    }()
    private var lblDescriptionData = UILabel()
    private var lblStar = UILabel()
    private var lblLanguage: UILabel = {
        let label = UILabel()
        label.text = "Language: "
        return label
    }()
    private var lblLanguageData = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
    }
    
    func initUI() {
        self.addSubview(lblDescription)
        
        self.lblDescriptionData.text = repoObject.description
        self.lblDescriptionData.numberOfLines = 2
        self.addSubview(lblDescriptionData)
        self.addSubview(self.lblLanguage)
        self.lblLanguageData.text = repoObject.language
        self.addSubview(self.lblLanguageData)
        
        self.lblStar.text = String(describing: repoObject.stargazers_count!) + " star"
        self.lblStar.textColor = .blue
        self.addSubview(self.lblStar)
        self.addSubview(viewBottomLine)
    }
    
    override func layoutSubviews() {
        lblDescription.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(5)
            make.left.equalTo(self.snp.left).offset(5)
        }
        lblDescriptionData.snp.makeConstraints { (make) in
            make.top.equalTo(self.lblDescription.snp.top)
            make.left.equalTo(self.lblDescription.snp.right).offset(5)
            make.right.equalTo(self.snp.right).offset(-5)
        }
        lblLanguage.snp.makeConstraints { (make) in
            make.top.equalTo(self.lblDescription.snp.bottom).offset(25)
            make.left.equalTo(self.snp.left).offset(5)
        }
        lblLanguageData.snp.makeConstraints { (make) in
            make.top.equalTo(self.lblLanguage.snp.top)
            make.left.equalTo(self.lblLanguage.snp.right).offset(5)
            make.right.equalTo(self.snp.right).offset(-5)
        }
        lblStar.snp.makeConstraints { (make) in
            make.top.equalTo(self.lblLanguage.snp.top)
            make.right.equalTo(self.snp.right).offset(-5)
        }
        viewBottomLine.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.left.equalTo(self.snp.left).offset(5)
            make.right.equalTo(self.snp.right).offset(-5)
            make.bottom.equalTo(self.snp.bottom)
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
