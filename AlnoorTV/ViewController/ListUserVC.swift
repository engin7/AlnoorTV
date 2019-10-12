//
//  ViewController.swift
//  AlnoorTV
//
//  Created by Onur Yıldırım on 12.10.2019.
//  Copyright © 2019 Teknoloji. All rights reserved.
//

import UIKit
import SDWebImage

class ListUserVC: UIViewController {
    
    fileprivate var users = [UserModel]()
    fileprivate var searchUsersIndexes = [Int]()
    fileprivate var hasReachedLimit = false
    fileprivate var requestFlag = true
    fileprivate var segueIndex: Int!
    
    private var searchTextField: UISearchTextField! {
        didSet{
            self.searchTextField.accessibilityIdentifier = "searchTextField"
            self.searchTextField.inputAccessoryView = toolBarDoneClicked()
            self.searchTextField.addTarget(self,
                                           action: #selector(searchTextFieldDidChange(textField:)),
                                           for: .editingChanged)
            self.view.addSubview(self.searchTextField)
        }
    }
    
    private var tableView: UITableView! {
        didSet{
            self.view.addSubview(self.tableView)
            
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
            tableView.tableFooterView = UIView()
            tableView.accessibilityIdentifier = "List user tableView"
            tableView.register(UserCell.self, forCellReuseIdentifier: "UserCell")
        }
    }
    
    @objc func searchTextFieldDidChange(textField: UITextField) {
        self.searchUsersIndexes = ContentAnalyzer().filterUsers(users: self.users, text: self.searchTextField.text!)
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initUI()
    }
    
    
    private func initUI() {
        self.searchTextField = UISearchTextField()
        self.tableView = UITableView()
        
        self.getUsers(id: 0)
    }
    
    fileprivate func getUsers(id: Int){
        NetworkRequest().getGitHubUsersRequest(id: id) { (error, users) in
            if (!error){
                DispatchQueue.main.async {
                    self.requestFlag = true
                    if(self.users.count > 0){
                        if(self.users.last!.id == users!.last!.id){
                            self.hasReachedLimit = true
                        }
                    }
                    self.users.append(contentsOf: users!)
                    self.searchUsersIndexes = ContentAnalyzer().filterUsers(users: self.users, text: self.searchTextField.text!)
                    self.tableView.reloadData()
                }
            } else {
                print("Probably too many request")
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        
        self.searchTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(5)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(5)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(5)
            make.height.equalTo(50)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.searchTextField.snp.bottom).offset(5)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "user_detail"){
            let user = self.users[searchUsersIndexes[segueIndex]]
            let userDetailVC = segue.destination as! UserDetailVC
            userDetailVC.user = user
        }
    }
}

extension ListUserVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchUsersIndexes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as! UserCell
        
        let urlString = users[searchUsersIndexes[indexPath.row]].avatar_url
        let url = URL(string: urlString!)!
        cell.imgProfile.sd_setImage(with: url, placeholderImage: nil)
        cell.lblUserName.text = users[searchUsersIndexes[indexPath.row]].login
        cell.accessibilityIdentifier = "myCell_\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if (indexPath.section ==  lastSectionIndex &&
            indexPath.row == lastRowIndex &&
            !hasReachedLimit &&
            searchTextField.text == "") {
            // print("this is the last cell")
            let spinner = UIActivityIndicatorView(style: .medium)
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
            
            tableView.tableFooterView = spinner
        } else {
            tableView.tableFooterView = UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.segueIndex = indexPath.row
        performSegue(withIdentifier: "user_detail", sender: self)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if tableView.contentOffset.y >= (tableView.contentSize.height - tableView.frame.size.height) && requestFlag {
            if(!hasReachedLimit && self.users.count > 0){
                requestFlag = false
                self.getUsers(id: self.users.last!.id)
            }
        }
    }
}

