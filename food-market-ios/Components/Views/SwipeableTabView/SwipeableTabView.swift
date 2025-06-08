//
//  SwipeableTabView.swift
//  food-market-ios
//
//  Created by Mac 2020 on 31/05/25.
//

import UIKit

protocol SwipeableTabViewDelegate: AnyObject {
    func swipeableTabView(_ tabView: SwipeableTabView, didSelectTabAt index: Int)
}

final class SwipeableTabView: UIView {
    // MARK: - UI Elements
    private let tabScrollView = UIScrollView()
    private let tabContainerView = UIView()
    private let indicatorView = UIView()
    private let contentScrollView = UIScrollView()
    private let contentView = UIStackView()

    private var tabButtons: [UIButton] = []

    weak var delegate: SwipeableTabViewDelegate?

    private var currentIndex: Int = 0

    // MARK: - Public Properties
    public var tabs: [String] = [] {
        didSet {
            setupTabs()
        }
    }

    public var views: [UIView] = [] {
        didSet {
            setupViews()
        }
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // MARK: - Setup View
    private func setupView() {
        // Tab Scroll View
        tabScrollView.showsHorizontalScrollIndicator = false
        tabScrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tabScrollView)

        NSLayoutConstraint.activate([
            tabScrollView.topAnchor.constraint(equalTo: topAnchor),
            tabScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tabScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tabScrollView.heightAnchor.constraint(equalToConstant: 50)
        ])

        // Tab Container View
        tabContainerView.translatesAutoresizingMaskIntoConstraints = false
        tabScrollView.addSubview(tabContainerView)

        NSLayoutConstraint.activate([
            tabContainerView.topAnchor.constraint(equalTo: tabScrollView.topAnchor),
            tabContainerView.bottomAnchor.constraint(equalTo: tabScrollView.bottomAnchor),
            tabContainerView.leadingAnchor.constraint(equalTo: tabScrollView.leadingAnchor),
            tabContainerView.trailingAnchor.constraint(equalTo: tabScrollView.trailingAnchor),
            tabContainerView.heightAnchor.constraint(equalTo: tabScrollView.heightAnchor)
        ])

        // Indicator View
        indicatorView.backgroundColor = ColorConstant.primaryBlack
        indicatorView.translatesAutoresizingMaskIntoConstraints = true
        tabScrollView.addSubview(indicatorView)

        // Content Scroll View
        contentScrollView.isPagingEnabled = true
        contentScrollView.showsHorizontalScrollIndicator = false
        contentScrollView.delegate = self
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentScrollView)

        NSLayoutConstraint.activate([
            contentScrollView.topAnchor.constraint(equalTo: tabScrollView.bottomAnchor),
            contentScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentScrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        // Content View
        contentView.axis = .horizontal
        contentView.distribution = .fillEqually
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentScrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: contentScrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor),
            contentView.heightAnchor.constraint(equalTo: contentScrollView.heightAnchor)
        ])
    }

    private func setupTabs() {
        tabButtons.removeAll()
        tabContainerView.subviews.forEach { $0.removeFromSuperview() }

        var previousButton: UIButton?

        for (index, title) in tabs.enumerated() {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.setTitleColor(ColorConstant.primaryGray, for: .normal)
            button.titleLabel?.font = FontConstant.poppinsMediumSmall
            button.tag = index
            button.addTarget(self, action: #selector(tabTapped(_:)), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false

            tabContainerView.addSubview(button)
            tabButtons.append(button)

            if let previous = previousButton {
                button.leadingAnchor.constraint(equalTo: previous.trailingAnchor, constant: 24).isActive = true
            } else {
                button.leadingAnchor.constraint(equalTo: tabContainerView.leadingAnchor, constant: 24).isActive = true
            }

            NSLayoutConstraint.activate([
                button.centerYAnchor.constraint(equalTo: tabContainerView.centerYAnchor)
            ])

            previousButton = button
        }

        previousButton?.trailingAnchor.constraint(equalTo: tabContainerView.trailingAnchor, constant: -24).isActive = true

        layoutIfNeeded()
        updateIndicatorPosition(index: 0, animated: false)
        updateTabButtonStyle(selectedIndex: 0)
    }

    private func setupViews() {
        contentView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            contentView.addArrangedSubview(view)
            view.widthAnchor.constraint(equalTo: contentScrollView.widthAnchor).isActive = true
        }
    }

    // MARK: - Actions
    @objc private func tabTapped(_ sender: UIButton) {
        let index = sender.tag
        currentIndex = index
        let offset = CGFloat(index) * contentScrollView.frame.width
        contentScrollView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        updateTabButtonStyle(selectedIndex: index)
        updateIndicatorPosition(index: index, animated: true)
        delegate?.swipeableTabView(self, didSelectTabAt: index)
    }

    private func updateTabButtonStyle(selectedIndex: Int) {
        for (index, button) in tabButtons.enumerated() {
            if index == selectedIndex {
                button.setTitleColor(ColorConstant.primaryBlack, for: .normal)
                button.titleLabel?.font = FontConstant.poppinsMediumSmall
            } else {
                button.setTitleColor(ColorConstant.primaryGray, for: .normal)
                button.titleLabel?.font = FontConstant.poppinsMediumSmall
            }
        }
    }

    private func updateIndicatorPosition(index: Int, animated: Bool) {
        guard index < tabButtons.count else { return }
        let button = tabButtons[index]

        let indicatorWidth: CGFloat = 40
        let indicatorX = button.frame.midX - (indicatorWidth / 2)
        let indicatorY = tabScrollView.frame.height - 2

        let updateFrame = {
            self.indicatorView.frame = CGRect(x: indicatorX, y: indicatorY, width: indicatorWidth, height: 3)
            self.indicatorView.layer.cornerRadius = self.indicatorView.frame.height / 2
            self.indicatorView.clipsToBounds = true
        }

        if animated {
            UIView.animate(withDuration: 0.25, animations: updateFrame)
        } else {
            updateFrame()
        }

        scrollTabToVisible(index: index)
    }

    private func scrollTabToVisible(index: Int) {
        guard index < tabButtons.count else { return }
        let button = tabButtons[index]
        tabScrollView.scrollRectToVisible(button.frame.insetBy(dx: -24, dy: 0), animated: true)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateIndicatorPosition(index: currentIndex, animated: false)
    }
}

// MARK: - UIScrollViewDelegate
extension SwipeableTabView: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(round(scrollView.contentOffset.x / scrollView.frame.width))
        currentIndex = index
        updateTabButtonStyle(selectedIndex: index)
        updateIndicatorPosition(index: index, animated: true)
        delegate?.swipeableTabView(self, didSelectTabAt: index)
    }
}
