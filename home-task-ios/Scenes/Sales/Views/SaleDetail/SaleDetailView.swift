//
//  SaleDetailView.swift
//  home-task-ios
//
//  Created by Ozan Yaldır on 12.02.2022.
//

import UIKit

class SaleDetailView: UIScrollView {
    
    private let containerVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    let dismissButton: UIButton = {
        let dismissButton = UIButton()
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.setTitleColor(.systemBlue, for: .normal)
        dismissButton.accessibilityIdentifier = "saleDetailPageDismissButton"
        return dismissButton
    }()
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        
        self.backgroundColor = .systemBackground
        self.accessibilityIdentifier = "saleDetailPageScrollView"
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let topBarStackView = UIStackView()
        topBarStackView.axis = .horizontal
        topBarStackView.alignment = .trailing
        
        let spacer = UIView()
        spacer.backgroundColor = .clear
        topBarStackView.addArrangedSubview(spacer)
        
        topBarStackView.addArrangedSubview(dismissButton)
        
        stackView.addArrangedSubview(topBarStackView)
        stackView.addArrangedSubview(self.containerVStackView)
        self.addSubview(stackView)
        stackView.setNeedsLayout()
        
        stackView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    func fillContent(sale: SaleViewModel){
        for subview in self.containerVStackView.arrangedSubviews{
            self.containerVStackView.removeArrangedSubview(subview)
        }
        
        let idLabel = UILabel()
        idLabel.font = UIFont.boldSystemFont(ofSize: 24)
        idLabel.text = sale.id
        idLabel.accessibilityIdentifier = "saleDetailPageIdLabel"
        self.containerVStackView.addArrangedSubview(idLabel)
        
        self.containerVStackView.setCustomSpacing(16.0, after: idLabel)
        
        let titleLabel = UILabel()
        titleLabel.text = sale.title
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        titleLabel.accessibilityIdentifier = "saleDetailPageTitleLabel"
        self.containerVStackView.addArrangedSubview(titleLabel)
        
        self.containerVStackView.setCustomSpacing(16.0, after: titleLabel)
        
        // TODO: HTML visualization.
        let detailLabel = UILabel()
        detailLabel.backgroundColor = .white
        detailLabel.attributedText = sale.hotelDetails.htmlToAttributedString
        detailLabel.lineBreakMode = .byWordWrapping
        detailLabel.numberOfLines = 0
        detailLabel.accessibilityIdentifier = "saleDetailPageDetailLabel"
        self.containerVStackView.addArrangedSubview(detailLabel)
        
        self.layoutSubviews()
    }
    
}
