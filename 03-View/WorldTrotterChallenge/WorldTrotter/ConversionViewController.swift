//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by 何洲 on 2021/8/19.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    var layer: CAGradientLayer!
    
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    var celsiusValue: Measurement<UnitTemperature>? {
        if fahrenheitValue != nil {
            return fahrenheitValue?.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumIntegerDigits = 0
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
        super.viewDidLoad();
        layer =  CAGradientLayer()
        layer.colors = [
            UIColor.purple.cgColor,
            UIColor.blue.cgColor,
            UIColor.green.cgColor,
            UIColor.yellow.cgColor,
            UIColor.red.cgColor
        ];
        layer.zPosition = -1;
        
        view.layer.addSublayer(layer);
        
        updateCelsiusLabel()
    }
    
    override func viewWillLayoutSubviews() {
        layer.frame = view.bounds;
    }
    
    @IBAction func textFieldChanged(_ textField: UITextField) {
        if let text = textField.text,  let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        celsiusLabel.text = celsiusValue != nil ? numberFormatter.string(from: NSNumber(value: celsiusValue!.value)) : "???"
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("Current text: \(String(describing: textField.text))")
        print("Replacement text: \(string)")
        
        // 无法退格
//        if !NSPredicate(format: "SELF MATCHES %@", "[0-9.]").evaluate(with: string) {
//            return false
//        }
        
        if string.range(of: "[a-zA-Z]", options: .regularExpression) != nil{
            return false
        }
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        return existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil ? false : true
    }
}
