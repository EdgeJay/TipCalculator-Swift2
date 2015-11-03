//
//  ViewController.swift
//  TipCalculator
//
//  Created by Wu Huijie on 2/11/15.
//  Copyright © 2015 Intertouch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtTotal: UITextField!
    @IBOutlet weak var sliderTaxPct: UISlider!
    @IBOutlet weak var lblTaxPct: UILabel!
    @IBOutlet weak var txtResult: UITextView!
    @IBOutlet weak var btnBackground: UIButton!
    
    let tipCalc: TipCalculatorModel = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.view.sendSubviewToBack(btnBackground)
        self.view.sendSubviewToBack(txtResult)
        
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onBackgroundClicked(sender: AnyObject) {
        txtTotal.resignFirstResponder()
        txtResult.resignFirstResponder()
    }
    
    @IBAction func onSliderTaxPctChanged(sender: AnyObject) {
        tipCalc.taxPct = Double(sliderTaxPct.value) / 100.0
        refreshUI()
    }
    
    @IBAction func onCalculate(sender: AnyObject) {
        tipCalc.total = (txtTotal.text! as NSString).doubleValue
        let possibleTips = tipCalc.returnPossibleTips()
        var results = "", formattedValue = "", grandTotal = ""
        
        for (tipPct, tipResult) in possibleTips {
            formattedValue = String(format: "%0.2f", tipResult.tipAmt)
            grandTotal = String(format: "%0.2f", tipResult.total)
            results += "\(tipPct)%: $\(formattedValue) (Grand Total: $\(grandTotal))\n"
        }
        txtResult.text = results
    }
    
    func refreshUI() {
        txtTotal.text = String(format: "%0.2f", tipCalc.total)
        sliderTaxPct.value = Float(tipCalc.taxPct) * 100.0
        lblTaxPct.text = "Tax Percentage (\(Int(sliderTaxPct.value))%)"
    }
}

