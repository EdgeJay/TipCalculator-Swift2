//: Playground - noun: a place where people can play

import UIKit

var count = 1
++count
let index = count
let price: Double = 19.99
let str = "Hello, playground"
print("The price is $\(price)")

class TipCalculator {
    let total: Double
    let taxPct: Double
    let subTotal: Double
    let possibleTips: [Double] = [0.15, 0.18, 0.20] // explicit style, inferred style will be let possibleTips: [] = [...]
    
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
        subTotal = total / (taxPct + 1)
    }
    
    func calcTipWithTipPct(tipPct: Double) -> Double {
        return subTotal * tipPct
    }
    
    func printPossibleTips() {
        for possibleTip in possibleTips {
            print("\(possibleTip * 100)%: \(calcTipWithTipPct(possibleTip))")
        }
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

let tipCalc = TipCalculator(total: 120, taxPct: 0.05)
tipCalc.returnPossibleTips()
tipCalc.printPossibleTips()

// tuples
let tipAndTotal = (4.00, 25.19)
// decomposing tuples
let (theTipAmt, theTotal) = tipAndTotal
// named tuples (inferred)
let tipAndTotalNamed = (tipAmt: 5.00, total: 27.00)
// named tuples (explicit)
let tipAndTotalNamedExplicit:(tipAmt:Double, total:Double) = (6.25, 30.20)

tipAndTotal.0
tipAndTotal.1
theTipAmt
theTotal

tipAndTotal.0 == theTipAmt
tipAndTotal.1 == theTotal

tipAndTotalNamed.tipAmt
tipAndTotalNamed.total
tipAndTotalNamedExplicit.tipAmt
tipAndTotalNamedExplicit.total

func calcTipWithTipPct(total: Double, subTotal: Double, tipPct: Double) -> (tipAmt:Double, total:Double) {
    let tipAmt = subTotal * tipPct
    let finalTotal = total + tipAmt
    return (tipAmt, finalTotal)
}

let result = calcTipWithTipPct(12.00, subTotal: 11.50, tipPct: 0.20)
result.0
result.1
result.tipAmt
result.total