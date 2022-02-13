//
//  FeedView.swift
//  home-task-ios
//
//  Created by Ozan Yaldır on 12.02.2022.
//

import UIKit

class FeedView: UIView {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        let refreshControl = UIRefreshControl()
        refreshControl.accessibilityIdentifier = "saleFeedTableViewRefreshControl"
        tableView.refreshControl = refreshControl
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SaleTableViewCell.self, forCellReuseIdentifier: "saleCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.accessibilityIdentifier = "saleFeedTableView"
        return tableView
    }()
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        
        self.addSubview(self.tableView)
        
        let margins = self.safeAreaLayoutGuide
        self.tableView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }
    
}
