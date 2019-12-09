//
//  PostsTableViewController.swift
//  EngineerAiTest
//
//  Created by Techment bhuvan on 09/12/19.
//  Copyright © 2019 Techment bhuvan. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {
    private var page = 1
    private let apiManager = PostApiServiceManager()
    private var postsList = [PostModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("DEFAULT_TITLE",tableName:"localizableString" ,comment: "") + "0"
        // MARK: - Get initial post List
        GetPostData()
    }
   
    // MARK: - Get post data page wise
    func GetPostData(){
        apiManager.getPostsList(page: page, completionHandler: {(postData) in
            DispatchQueue.main.async {
                self.postsList.append(contentsOf: postData)
                self.title = NSLocalizedString("DEFAULT_TITLE",tableName:"localizableString" ,comment: "") + "\(self.postsList.count)"
                self.tableView.reloadData()
            }
        }, errorHandler: {
            // MARK: - Display if api throughs an error
            self.displayAlertView(message: NSLocalizedString("GENRIC_ERROR",tableName:"localizableString" ,comment: ""), title: NSLocalizedString("ALERT_TITLE",tableName:"localizableString" ,comment: ""))
        })
    }
}



extension PostsTableViewController{
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postsList.count
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
        if (indexPath.row == postsList.count - 1) {
            page += 1
            GetPostData()
        }
        let post = postsList[indexPath.row]
        // MARK: - Configure the cell
        cell.configCell(post: post)
        return cell
     }
 
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // MARK: - Configure the Indicator

        let lastPostsectionIndex = tableView.numberOfSections - 1
        let lastPostRowIndex = tableView.numberOfRows(inSection: lastPostsectionIndex) - 1
        if indexPath.section == lastPostsectionIndex && indexPath.row == lastPostRowIndex{
            let Indicator = UIActivityIndicatorView(style: .gray)
            Indicator.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 30)
            tableView.tableFooterView = Indicator
            tableView.tableFooterView?.isHidden = false
        }
        
    }
    

}
