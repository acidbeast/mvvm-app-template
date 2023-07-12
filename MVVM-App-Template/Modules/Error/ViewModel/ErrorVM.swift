//
//  ErrorVM.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/5/23.
//

protocol ErrorVMProtocol: AnyObject {
    var updateViewData: ((ErrorViewData) -> Void)? { get set }
    func update()
}

final class ErrorVM: ErrorVMProtocol {
    
    public var updateViewData: ((ErrorViewData) -> Void)?
    
    private var title: String
    private var description: String
    
    init (
        title: String,
        description: String
    ) {
        self.title = title
        self.description = description
    }
    
    func update() {
        updateViewData?(.success(ErrorViewData.Data(
            title: title,
            description: description
        )))
    }
    
}
