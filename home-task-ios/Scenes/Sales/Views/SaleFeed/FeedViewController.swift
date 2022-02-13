//
//  FeedViewController.swift
//  home-task-ios
//
//  Created by Sebastiano catellani on 17.05.21.
//

import UIKit
import Combine

class FeedViewController: BaseViewController {
    
    private let viewModel = SaleFeedViewModel()
    private let feedView = FeedView()
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.feedView.tableView.dataSource = self
        self.feedView.tableView.delegate = self
        self.feedView.tableView.refreshControl?.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        
        self.setupObservers()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refresh(nil)
    }
    
    override func loadView() {
        self.view = self.feedView
    }
    
    private func setupObservers(){
        self.viewModel.$sales
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.feedView.tableView.reloadData()
            }
            .store(in: &self.cancellables)
        
        self.viewModel.$failureMessage
            .receive(on: DispatchQueue.main)
            .sink{ [weak self] message in
                if let message = message{
                    self?.showErrorAlert(message: message, complete: nil)
                }
            }
            .store(in: &self.cancellables)
        
        self.viewModel.$isLoading
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] isLoading in
                if (isLoading == true && !(self?.feedView.tableView.refreshControl?.isRefreshing ?? false)){
                    self?.activityIndicatorBegin()
                } else if (isLoading == false){
                    self?.feedView.tableView.refreshControl?.endRefreshing()
                    self?.activityIndicatorEnd()
                }
            })
            .store(in: &self.cancellables)
    }
    
    @objc func refresh(_ sender: AnyObject?) {
        self.viewModel.fetchFeed()
    }
}

// MARK: Delegates and DataSources would be put into a Presenter. Kept moving with MVVM
extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.sales.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "saleCell", for: indexPath) as! SaleTableViewCell
        cell.sale = self.viewModel.sales[indexPath.row]
        return cell
    }
}

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) as? SaleTableViewCell,
              let sale = cell.sale else{
                  return self.showErrorAlert(message: "Something went wrong while opening Sale details.", complete: nil)
              }
        let detailVC = SaleDetailViewController.init(sale: sale)
        self.present(detailVC, animated: true, completion: nil)
    }
}
