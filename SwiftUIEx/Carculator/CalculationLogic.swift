//
//  CalculationLogic.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2023/01/04.
//

import Foundation

final class CalcLogic {
    var digit1: Double? = nil
    var digit2: Double? = nil
    
    var result: Double? = nil
    
    var rememberSymbol: String? = nil
    
    func logic() -> Double? {
        switch rememberSymbol {
        case "+":
            result = digit1! + digit2!
        case "-":
            result = digit1! - digit2!
        case "+-":
            result = -digit1!
        case "%":
            result = digit1! * 0.01
        default:
            break
        }
        
        return result
    }
}
