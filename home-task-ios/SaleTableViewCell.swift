//
//  SaleTableViewCell.swift
//  home-task-ios
//
//  Created by Sebastiano catellani on 17.05.21.
//

import UIKit

class SaleTableViewCell: UITableViewCell {

    let label = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.addSubview(self.label)

        self.label.translatesAutoresizingMaskIntoConstraints = false

        let margins = self.layoutMarginsGuide
        self.label.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        self.label.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        self.label.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        self.label.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
