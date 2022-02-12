//
//  SaleDetailViewControlle.swift
//  home-task-ios
//
//  Created by Ozan Yaldır on 12.02.2022.
//

import UIKit


class SaleDetailViewController: UIViewController{
    
    var sale: SaleViewModel!
    private let saleDetailView = SaleDetailView()
    
    
    // MARK: Content is not refetching here. Using the viewmodel passed from the sale feed. A spesific query was not found for details.
    init(sale: SaleViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.sale = sale
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.saleDetailView.dismissButton.addTarget(self, action: #selector(dismiss(_:)), for: .touchUpInside)
    }
    
    override func loadView() {
        self.view = self.saleDetailView
        self.saleDetailView.fillContent(sale: self.sale)
    }
    
    @objc func dismiss(_ sender: AnyObject){
        self.dismiss(animated: true, completion: nil)
    }
}
