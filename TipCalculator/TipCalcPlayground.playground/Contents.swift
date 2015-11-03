// based on Swift 2 tutorial:
// http://www.raywenderlich.com/115253/swift-2-tutorial-a-quick-start
// http://www.raywenderlich.com/115300/swift-2-tutorial-part-3-tuples-protocols-delegates-and-table-views

import UIKit

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
    
    func calcTipWithTipPct(tipPct: Double) -> (tipAmt:Double, total:Double) {
        let tipAmt = subTotal * tipPct
        let finalTotal = total + tipAmt
        return (tipAmt, finalTotal)
    }
    
    func returnPossibleTips() -> [Int: (tipAmt:Double, total:Double)] {
        var retVal = [Int: (tipAmt:Double, total:Double)]()
        
        for i in 0..<possibleTips.count {
            let possibleTip = possibleTips[i]
            let intPct = Int(possibleTip * 100)
            retVal[intPct] = calcTipWithTipPct(possibleTip)
        }
        
        return retVal
    }
}

let tipCalc = TipCalculatorModel(total: 120, taxPct: 0.05)
tipCalc.returnPossibleTips()

// Testing with UITableView
class TestDataSource: NSObject, UITableViewDataSource {
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    var possibleTips = [Int: (tipAmt: Double, total: Double)]()
    var sortedKeys: [Int] = []
    
    override init() {
        possibleTips = tipCalc.returnPossibleTips()
        sortedKeys = Array(possibleTips.keys).sort()
        super.init()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedKeys.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: nil)
        let tipPct = sortedKeys[indexPath.row]
        let tipAmt = possibleTips[tipPct]!.tipAmt
        let total = possibleTips[tipPct]!.total
        
        cell.textLabel?.text = "\(tipPct)%"
        cell.detailTextLabel?.text = String(format: "Tip: $%0.2f, Total: $%0.2f", tipAmt, total)
        
        return cell
    }
}

let dataSource = TestDataSource()
let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 320, height: 320), style: .Plain)
tableView.dataSource = dataSource
tableView.reloadData()

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
