//
//  ViewController.swift
//  WorldTrotter
//
//  Created by 何洲 on 2021/8/19.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        /**
//         Note that these values are in points, not pixels. If the values were in pixels, then they would not be
//         consistent across displays of different resolutions (i.e., Retina versus non-Retina). A point is a relative
//         unit of a measure; it will be a different number of pixels depending on how many pixels are in the
//         display. Sizes, positions, lines, and curves are always described in points to allow for differences in
//         display resolution.
//         */
//        let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150);
//        let firstView = UIView(frame: firstFrame);
//        firstView.backgroundColor = UIColor.blue;
//        view.addSubview(firstView);
//        
//        let secondFrame = CGRect(x: 20, y: 30, width: 50, height: 50)
//        let secondView = UIView(frame: secondFrame)
//        secondView.backgroundColor = UIColor.green
////        view.addSubview(secondView)
//        firstView.addSubview(secondView);
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded its view.")
        updateCelsiusLabel()
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, let number = numberFormatter.number(from: text) {
            fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder();
    }
    
    func updateCelsiusLabel() {
        if celsiusValue != nil {
//            celsiusLabel.text = "\(celsiusValue!.value)"
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue!.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print("Current text: \(String(describing: textField.text))")
//        print("Replacement text: \(string)")
//        return true;
        
        let currentLocale = Locale.current
        let decimalSeparator = currentLocale.decimalSeparator ?? "."
        let existingTextHasDecimalSeparator = textField.text?.range(of: decimalSeparator)
        let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)
        
        return existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil ? false : true
    }
}
