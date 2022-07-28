//
//  AddNoteViewController.swift
//  ToDoTask
//
//  Created by bitcot on 13/06/22.
//

import UIKit

protocol AddNoteViewControllerDelegate{
    func getData(title:String, subTitle:String)
}

class AddNoteViewController: UIViewController {
    @IBOutlet weak var tfTitle:UITextField!
    @IBOutlet weak var txtvNote:UITextView!
    @IBOutlet weak var btnSave:UIButton!
    
    var delegate:AddNoteViewControllerDelegate? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSave.layer.cornerRadius = 15
        btnSave.addTarget(self, action: #selector(saveData), for: .touchUpInside)
    }
    
    @objc func saveData(){
        if tfTitle.text != "" && txtvNote.text != ""{
            
            delegate?.getData(title: tfTitle.text ?? "", subTitle: txtvNote.text ?? "")
            self.dismiss(animated: true)
        }else{
            let alert = UIAlertController(title: "Alert", message: "Fill all the details", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnABack(){
        self.dismiss(animated: false)
    }

}
