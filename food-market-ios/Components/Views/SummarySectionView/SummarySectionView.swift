//
//  SummarySectionView.swift
//  food-market-ios
//
//  Created by Mac 2020 on 21/06/25.
//

import UIKit

struct SummaryItemData {
    let label: String
    let value: String
}

@IBDesignable
class SummarySectionView: UIView {
    private let titleLabel = UILabel()
    private let stackView = UIStackView()
    
    @IBInspectable var titleText: String = "" {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    private var items: [SummaryItemData] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func configure(title: String, items: [SummaryItemData]) {
        titleLabel.text = title
        self.items = items
        reloadRows()
    }

    private func setupView() {
        titleLabel.text = titleText
        titleLabel.font = FontConstant.poppinsRegularSmall
        titleLabel.textColor = ColorConstant.primaryBlack

        stackView.axis = .vertical
        stackView.spacing = 6

        let containerStack = UIStackView(arrangedSubviews: [titleLabel, stackView])
        containerStack.axis = .vertical
        containerStack.spacing = 8

        addSubview(containerStack)
        containerStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerStack.topAnchor.constraint(equalTo: topAnchor),
            containerStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func reloadRows() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        for item in items {
            let row = SummaryItemView(label: item.label, value: item.value)
            stackView.addArrangedSubview(row)
        }
    }
}

class SummaryItemView: UIView {
    private let titleLabel = UILabel()
    private let valueLabel = UILabel()

    init(label: String, value: String) {
        super.init(frame: .zero)
        setupView(label: label, value: value)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupView(label: String, value: String) {
        let hStack = UIStackView(arrangedSubviews: [titleLabel, valueLabel])
        hStack.axis = .horizontal
        hStack.distribution = .equalSpacing
        hStack.alignment = .firstBaseline

        addSubview(hStack)
        hStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: topAnchor),
            hStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        titleLabel.text = label
        valueLabel.text = value

        titleLabel.font = FontConstant.poppinsRegularSmall
        titleLabel.textColor = ColorConstant.primaryGray
        valueLabel.font = FontConstant.poppinsRegularSmall
        valueLabel.textColor = ColorConstant.primaryBlack
    }
}
