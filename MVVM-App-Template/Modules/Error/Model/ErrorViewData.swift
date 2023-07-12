//
//  ErrorViewData.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/11/23.
//

import UIKit

enum ErrorViewData {
    
    case initial
    case success(Data)
    
    struct Data {
        let title: String
        let description: String
    }
    
}
