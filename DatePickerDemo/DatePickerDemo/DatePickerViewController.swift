//
//  DatePickerViewController.swift
//  DatePickerDemo
//
//  Created by bitcot on 29/06/22.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var textField:UITextField!

    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            self.textField.setDatePickerAsInputViewFor(target: self, selector: #selector(dateSelected))
        }
        
        @objc func dateSelected() {
            if let datePicker = self.textField.inputView as? UIDatePicker {
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .medium
                self.textField.text = dateFormatter.string(from: datePicker.date)
            }
            self.textField.resignFirstResponder()
        }
}


extension UITextField {
    
    func setDatePickerAsInputViewFor(target:Any, selector:Selector) {
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 200.0))
        datePicker.datePickerMode = .date
        self.inputView = datePicker
        
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 40.0))
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(tapCancel))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: "Done", style: .done, target: nil, action: selector)
        toolBar.setItems([cancel,flexibleSpace, done], animated: false)
//        self.inputView = toolBar
        self.inputAccessoryView = toolBar
        inputAccessoryView?.frame = CGRect(x: 0, y: 600, width: screenWidth, height: 400)
        
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
}
