//
//  FeedViewController.swift
//  home-task-ios
//
//  Created by Sebastiano catellani on 17.05.21.
//

import UIKit

class FeedView: UIView {

    let tableView = UITableView()

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)

        self.backgroundColor = .white

        self.addSubview(self.tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = self.layoutMarginsGuide
        self.tableView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }
}

class FeedViewController: UIViewController, UITableViewDataSource {

    var feedView: FeedView! = FeedView()
    var sales: [Sale] = []

    init() {
        super.init(nibName: nil, bundle: nil)
        self.feedView.tableView.dataSource = self

        self.feedView.tableView.register(SaleTableViewCell.self, forCellReuseIdentifier: "saleCell")
        self.feedView.tableView.rowHeight = UITableView.automaticDimension
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.perform { sales in
            self.sales = sales ?? []
            self.feedView.tableView.reloadData()
        }
    }

    override func loadView() {
        self.view = self.feedView
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.sales.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "saleCell", for: indexPath) as! SaleTableViewCell

        cell.label.text = self.sales[indexPath.row].title

        return cell
    }

    func perform(complete: @escaping ([Sale]?) -> ()) {

        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: nil)
        let encoder = JSONEncoder()

        var request = URLRequest(url: URL(string: "https://w7szo4xfvg.execute-api.eu-central-1.amazonaws.com/staging/graphql")!)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Content-Type": "application/json", "x-api-key": "1lVkC4YOx1acSOia7dUH093PFCeaKk0a6zEUYR3x"]
        let httpBody = try! encoder.encode(SalesRequest())
        request.httpBody = httpBody

        session.dataTask(with: request) { (data, httpUrlResponse, error) in

            guard let data = data else { return }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let data = json["data"] as? [String: Any],
                   let sales = data["sales"] as? [[String: Any]] {

                    let result = sales.map { sale in
                        Sale(id: sale["id"] as! String, title: sale["title"] as! String)
                    }

                    complete(result)
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        }.resume()
    }
}
