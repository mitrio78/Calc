//
//  Model.swift
//  Calc
//
//  Created by Дмитрий Гришечко on 19.02.2022.
//

import Foundation
import UIKit

enum Calculator: Int {
    
    case addition
    case substraction
    case multiply
    case divide
    
    func evaluate(savedValue: Double, currentValue: Double) -> Double {
        switch self {
        case .addition:
            return savedValue + currentValue
        case .substraction:
            return savedValue - currentValue
        case .multiply:
            return savedValue * currentValue
        case .divide:
            return savedValue / currentValue
        }
    }
}

