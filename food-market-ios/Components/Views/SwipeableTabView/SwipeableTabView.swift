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

class SwipeableTabView: UIView {
    weak var delegate: SwipeableTabViewDelegate?
    
    var tabs: [String] = [] {
        didSet {
            setupTabs()
        }
    }
    
    var views: [UIView] = [] {
        didSet {
            setupContentViews()
        }
    }
    
    private let tabStackView: UIStackView = UIStackView()
    private let indicatorView: UIView = UIView()
    private let scrollView: UIScrollView = UIScrollView()
    private let tabWidthPercentage = 0.4
    
    private var indicatorLeadingConstraint: NSLayoutConstraint?
    private var indicatorWidthConstraint: NSLayoutConstraint?
    
    private var currentIndex: Int = 0
    
    private var tabWidth: CGFloat {
        guard tabs.count > 0 else { return 0 }
        return frame.width / CGFloat(tabs.count)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        tabStackView.axis = .horizontal
        tabStackView.distribution = .fillEqually
        tabStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tabStackView)
        NSLayoutConstraint.activate([
            tabStackView.topAnchor.constraint(equalTo: topAnchor),
            tabStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tabStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tabStackView.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        indicatorView.layer.cornerRadius = indicatorView.layer.cornerRadius / 2
        indicatorView.backgroundColor = ColorConstant.primaryBlack
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorLeadingConstraint = indicatorView.leadingAnchor.constraint(equalTo: leadingAnchor)
        indicatorWidthConstraint = indicatorView.widthAnchor.constraint(equalToConstant: 0)
        addSubview(indicatorView)
        NSLayoutConstraint.activate([
            indicatorView.topAnchor.constraint(equalTo: tabStackView.bottomAnchor),
            indicatorView.heightAnchor.constraint(equalToConstant: 3),
            indicatorLeadingConstraint!,
            indicatorWidthConstraint!,
        ])
        
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: indicatorView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupTabs() {
        tabStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for (index, title) in tabs.enumerated() {
            let button: UIButton = createTabButton(title: title, index: index)
            tabStackView.addArrangedSubview(button)
        }
        
        layoutIfNeeded()
        updateIndicatorPosition(index: 0, animated: false)
        
    }
    
    private func createTabButton(title: String, index: Int) -> UIButton {
        let button: UIButton = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(ColorConstant.primaryGray, for: .normal)
        button.tag = index
        button.addTarget(self, action: #selector(tabTapped(_:)), for: .touchUpInside)
        return button
    }
    
    private func setupContentViews() {
        scrollView.subviews.forEach { $0.removeFromSuperview() }
        
        var previousView: UIView?
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(view)
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: scrollView.topAnchor),
                view.widthAnchor.constraint(equalTo: widthAnchor),
                view.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            ])
            
            if let previousView = previousView {
                view.leadingAnchor.constraint(equalTo: previousView.trailingAnchor).isActive = true
            } else {
                view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
            }
            
            previousView = view
        }
        
        if let lastView = views.last {
            lastView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        }

        updateIndicatorPosition(index: 0, animated: false)
    }
    
    private func updateIndicatorPosition(index: Int, animated: Bool) {
        guard index >= 0 && index < tabs.count else { return }
        
        let tabWidthValue: CGFloat = getTabWidthValue(width: tabWidth)
        let tabLeadingValue: CGFloat = getTabLeadingValue(width: tabWidth, index: index)
        currentIndex = index
        indicatorWidthConstraint?.constant = tabWidthValue
        
        if animated {
            UIView.animate(withDuration: 0.3) {
                self.indicatorLeadingConstraint?.constant = tabLeadingValue
                self.layoutIfNeeded()
            }
        } else {
            indicatorLeadingConstraint?.constant = tabLeadingValue
            layoutIfNeeded()
        }
    }
    
    private func getTabWidthValue(width: CGFloat) -> CGFloat {
        return width * tabWidthPercentage
    }
    
    private func getTabLeadingValue(width: CGFloat, index: Int) -> CGFloat {
        return (width * CGFloat(index)) + (width - (width * tabWidthPercentage)) / 2
    }
    
    private func animateIndicator(scrollOffsetX: CGFloat) {
        guard tabs.count > 0 else { return }

        let percentScrolled = scrollOffsetX / frame.width
        let newLeading = percentScrolled * tabWidth

        indicatorLeadingConstraint?.constant = newLeading
        layoutIfNeeded()
    }
    
    @objc 
    private func tabTapped(_ sender: UIButton) {
        let index = sender.tag
        currentIndex = index
        updateIndicatorPosition(index: index, animated: true)
        scrollView.setContentOffset(CGPoint(x: CGFloat(index) * scrollView.frame.width, y: 0), animated: true)
        delegate?.swipeableTabView(self, didSelectTabAt: index)
    }
}

extension SwipeableTabView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        animateIndicator(scrollOffsetX: scrollView.contentOffset.x)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(round(scrollView.contentOffset.x / scrollView.frame.width))
        updateIndicatorPosition(index: index, animated: true)
    }
}
