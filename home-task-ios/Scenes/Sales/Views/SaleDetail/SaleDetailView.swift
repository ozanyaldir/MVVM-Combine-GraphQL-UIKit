//
//  SaleDetailView.swift
//  home-task-ios
//
//  Created by Ozan Yaldır on 12.02.2022.
//

import UIKit

class SaleDetailView: UIScrollView {
    
    let containerVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    let dismissButton: UIButton = {
        let dismissButton = UIButton()
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.setTitleColor(.systemBlue, for: .normal)
        return dismissButton
    }()
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // FIXME: Some AutoLayout optimizations can be made here
    init() {
        super.init(frame: .zero)
        
        self.backgroundColor = .systemBackground
        
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
        
        let margins = self.layoutMarginsGuide
        stackView.widthAnchor.constraint(equalTo: margins.widthAnchor, constant: -32).isActive = true
        stackView.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 24).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    func fillContent(sale: SaleViewModel){
        for subview in self.containerVStackView.arrangedSubviews{
            self.containerVStackView.removeArrangedSubview(subview)
        }
        
        let idLabel = UILabel()
        idLabel.font = UIFont.boldSystemFont(ofSize: 24)
        idLabel.text = sale.id
        idLabel.lineBreakMode = .byWordWrapping
        idLabel.numberOfLines = 0
        self.containerVStackView.addArrangedSubview(idLabel)
        
        self.containerVStackView.setCustomSpacing(16.0, after: idLabel)
        
        let titleLabel = UILabel()
        titleLabel.text = sale.title
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        self.containerVStackView.addArrangedSubview(titleLabel)
        
        self.containerVStackView.setCustomSpacing(16.0, after: titleLabel)
        
        let detailLabel = UILabel()
        detailLabel.backgroundColor = .white
        detailLabel.attributedText = sale.hotelDetails.htmlToAttributedString
        detailLabel.lineBreakMode = .byWordWrapping
        detailLabel.numberOfLines = 0
        self.containerVStackView.addArrangedSubview(detailLabel)
        
        self.setNeedsLayout()
    }
    
}
