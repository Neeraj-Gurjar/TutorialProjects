//
//  NoteListViewController.swift
//  ToDoTask
//
//  Created by bitcot on 13/06/22.
//

import UIKit

class NoteListViewController: UIViewController {
    
    @IBOutlet weak var tblNoteList:UITableView!
    @IBOutlet weak var btnAdd:UIButton!
    
    var titleDataArray:[String] = ["AAgra", "Ujjain", "Chennai", "Kolkata"]
    var subDataArray:[String ] = ["1111","2222","3333","4444"]
    var keyData:[String:String] = [:]
    var titleData:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        tblNoteList.dataSource = self
        tblNoteList.delegate = self
        btnAdd.addTarget(self, action: #selector(goToAdd), for: .touchUpInside)
    }
    
    @objc func goToAdd(){
        
        let nextView = self.storyboard?.instantiateViewController(withIdentifier: "AddNoteViewController") as! AddNoteViewController
        nextView.delegate = self
        self.present(nextView, animated: true, completion: nil)
    }

    
}
extension NoteListViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblNoteList.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = titleDataArray[indexPath.row]
        cell.detailTextLabel?.text = subDataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let alert = UIAlertController(title: "Alert", message: "", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(cancel)
        let delete = UIAlertAction(title: "Delete", style: .destructive) { UIAlertAction in
            self.titleDataArray.remove(at: index)
            self.subDataArray.remove(at: index)
            self.tblNoteList.reloadData()
        }
        alert.addAction(delete)
        self.present(alert, animated: true, completion: nil)
    }
}

extension NoteListViewController: AddNoteViewControllerDelegate{
    func getData(title: String, subTitle: String) {
        titleDataArray.append(title ?? "")
        subDataArray.append(subTitle ?? "")

        tblNoteList.reloadData()
    }
    
    
}
