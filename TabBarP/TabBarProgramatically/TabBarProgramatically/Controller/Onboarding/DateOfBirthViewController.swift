//
//  DateOfBirthViewController.swift
//  Task3
//
//  Created by bitcot on 13/06/22.
//

import UIKit

class DateOfBirthViewController: UIViewController {
   
    @IBOutlet weak var btnDone:UIButton!
    @IBOutlet weak var datepicker: UIDatePicker!
  //  var backController:SignUpViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let yesterdayDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        datepicker.maximumDate = yesterdayDate
        btnDone.layer.cornerRadius = 15
        btnDone.addTarget(self, action: #selector(doneDateSelection), for: .touchUpInside)
    }
    @objc func doneDateSelection(){
            let dateFormatter:DateFormatter=DateFormatter()
            dateFormatter.dateFormat="dd-MM-yyyy"
            let date = dateFormatter.string(from: datepicker.date)
//        backController?.tfDateOfBirth.text = "\(date)"
        self.navigationController?.popViewController(animated: true)
    }
  
}
