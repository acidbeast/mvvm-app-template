//
//  ErrorVM.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/5/23.
//

protocol ErrorVMProtocol: AnyObject {}


class ErrorVM: ErrorVMProtocol {
    
    var title: String
    var description: String
    
    init (
        title: String,
        description: String
    ) {
        self.title = title
        self.description = description
    }
    
}
