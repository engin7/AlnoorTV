//
//  UserDetailVC.swift
//  AlnoorTV
//
//  Created by Onur Yıldırım on 12.10.2019.
//  Copyright © 2019 Teknoloji. All rights reserved.
//

import UIKit

class UserDetailVC: UIViewController {
    
    var user: UserModel!
    private var repos = [RepoModel]()
    
    private var btnSort: UIBarButtonItem! {
        didSet{
            btnSort.title = "Sort by ratings"
            btnSort.target = self
            btnSort.action = #selector(actionSortClicked)
            btnSort.accessibilityIdentifier = "Sort by ratings"
            self.navigationItem.rightBarButtonItem = btnSort
        }
    }
    
    private var tableView: UITableView! {
        didSet{
            self.view.addSubview(self.tableView)
            
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
            tableView.tableFooterView = UIView()
            tableView.register(RepoCell.self, forCellReuseIdentifier: "RepoCell")
        }
    }
    
    @objc private func actionSortClicked() {
        self.repos = ContentAnalyzer().sortReposByRating(repos: self.repos)
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initUI()
    }
    
    private func initUI() {
        self.tableView = UITableView()
        self.btnSort = UIBarButtonItem()
        getRepos()
    }
    
    override func viewDidLayoutSubviews() {
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    fileprivate func getRepos() {
        NetworkRequest().getUserRepoRequest(userLogin: user.login!) { (error, repos) in
            DispatchQueue.main.async {
                if (!error){
                    self.repos = repos!
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension UserDetailVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell") as! RepoCell
        cell.repoObject = repos[indexPath.row]
        cell.initUI()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
