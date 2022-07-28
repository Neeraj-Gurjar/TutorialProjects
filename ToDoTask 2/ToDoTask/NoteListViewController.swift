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
    
    var dataArray:[String] = ["AAgra", "Ujjain", "Chennai", "Kolkata"]
    var titleData:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        tblNoteList.dataSource = self
        tblNoteList.delegate = self
        btnAdd.addTarget(self, action: #selector(goToAdd), for: .touchUpInside)
    }
    
    @objc func goToAdd(){
        let nextView = self.storyboard?.instantiateViewController(withIdentifier: "AddNoteViewController") as! AddNoteViewController
        nextView.backViewCont = self
        self.present(nextView, animated: true, completion: nil)
    }
    func getdata(){
        dataArray.append(titleData ?? "")
        tblNoteList.reloadData()
    }
    
}
extension NoteListViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblNoteList.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let alert = UIAlertController(title: "Alert", message: "", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(cancel)
        let delete = UIAlertAction(title: "Delete", style: .destructive) { UIAlertAction in
            self.dataArray.remove(at: index)
            self.tblNoteList.reloadData()
        }
        alert.addAction(delete)
        self.present(alert, animated: true, completion: nil)
    }
}
