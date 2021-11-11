//
//  ViewController.swift
//  prework
//
//  Created by Omar Saleh on 11/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var myShare: UILabel!
    @IBOutlet weak var numOfPeople: UISlider!
    @IBOutlet weak var numOfPeopleLabel: UILabel!
    
    
    var total = Double(0);
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.becomeFirstResponder()
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func calculateTipAmount(){
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.20]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        total = Double(bill + tip)
        
        let step: Float = 1
        let currentValue = Int(round(numOfPeople.value / step) * step)
        numOfPeopleLabel.text = "\(currentValue)"
        let myShareAmount = (total)/Double(currentValue)
        myShare.text = String(format: "$%.2f", myShareAmount)
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalAmountLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func BillAmount(_ sender: UITextField) {
        calculateTipAmount()
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        calculateTipAmount()
        
    }
    
    @IBAction func calculateMyShare(_ sender: UISlider) {
        calculateTipAmount()
    }
    
}


