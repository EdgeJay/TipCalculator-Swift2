//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Wu Huijie on 2/11/15.
//  Copyright © 2015 Intertouch. All rights reserved.
//

import Foundation

class TipCalculatorModel {
    var total: Double
    var taxPct: Double
    var subTotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    // explicit style, inferred style will be let possibleTips: [] = [...]
    let possibleTips: [Double] = [0.15, 0.18, 0.20]
    
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPct(tipPct: Double) -> Double {
        return subTotal * tipPct
    }
    
    func returnPossibleTips() -> [Int: Double] {
        var retVal = [Int: Double]()
        
        for i in 0..<possibleTips.count {
            let possibleTip = possibleTips[i]
            let intPct = Int(possibleTip * 100)
            retVal[intPct] = calcTipWithTipPct(possibleTip)
        }
        
        return retVal
    }
}