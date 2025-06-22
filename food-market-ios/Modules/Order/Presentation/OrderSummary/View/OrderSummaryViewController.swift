//
//  OrderSummaryViewController.swift
//  food-market-ios
//
//  Created by Mac 2020 on 09/06/25.
//

import UIKit

class OrderSummaryViewController: ContentViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var itemOrderedLabel: UILabel!
    @IBOutlet weak var foodItemView: FoodItemView!
    @IBOutlet weak var detailsTransactionView: SummarySectionView!
    @IBOutlet weak var deliverToView: SummarySectionView!
    
    weak var presenter: OrderSummaryViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        headerView.setupData(
            data: HeaderViewData(
                title: "Payment",
                subtitle: "You deserve better meal",
                showBackButton: true
            )
        )
        
        foodItemView.setData(
            data: FoodItemViewData(
                image: DummyConstant.Image.foodSummaryDummy,
                title: "Cherry Healthy",
                price: 289000,
                qty: 14,
                isShowQtyRight: true
            )
        )
        
        detailsTransactionView.configure(
            title: "Details Transaction",
            items: [
                SummaryItemData(label: "Cherry Healthy", value: "IDR 18.390.000"),
                SummaryItemData(label: "Driver", value: "IDR 50.000"),
                SummaryItemData(label: "Tax 10%", value: "IDR 1.800.390"),
                SummaryItemData(label: "Total Price", value: "IDR 390.803.000"),
            ]
        )
        
        deliverToView.configure(
            title: "Deliver to:",
            items: [
                SummaryItemData(label: "Name", value: "Angga Risky"),
                SummaryItemData(label: "Phone No.", value: "0822 0819 9688"),
                SummaryItemData(label: "Address", value: "Setra Duta Palima"),
                SummaryItemData(label: "House No.", value: "A5 Hook"),
                SummaryItemData(label: "City", value: "Bandung")
            ]
        )
        
        setupStyles()
    }
    
    private func setupStyles() {
        itemOrderedLabel.text = "Item Ordered"
        itemOrderedLabel.textColor = ColorConstant.primaryBlack
        itemOrderedLabel.font = FontConstant.poppinsRegularSmall
    }
    
    @IBAction func checkoutButtonPressed(_ sender: Any) {
        let viewController: SuccessOrderViewController = SuccessOrderRouter.createModule()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension OrderSummaryViewController: OrderSummaryPresenterToViewProtocol {
    
}
