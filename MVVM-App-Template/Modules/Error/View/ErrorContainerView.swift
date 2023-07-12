//
//  ErrorContainerView.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/11/23.
//

import UIKit

final class ErrorContainerView: UIView {
    
    var viewData: ErrorViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }

    lazy var errorView = createErrorView()
    
    private var action: (()->Void)?

    init(action: (()->Void)?) {
        self.action = action
        super.init(frame: CGRectZero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        update(viewData: viewData)
    }
    
    private func update(viewData: ErrorViewData) {
        subviews.forEach { $0.removeFromSuperview() }
        switch viewData {
        case .initial:
            break
        case .success(let success):
            addSubview(errorView)
            setupErrorView()
            errorView.updateWith(title: success.title, buttonAction: self.action)
            break
        }
    }
    
}
