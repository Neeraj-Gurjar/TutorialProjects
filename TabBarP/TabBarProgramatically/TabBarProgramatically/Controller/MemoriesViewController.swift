//
//  MemoriesViewController.swift
//  TabBarProgramatically
//
//  Created by bitcot on 15/06/22.
//

import UIKit

class MemoriesViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    var memories = [Memory]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memories = Constants.memories
        setUpTblView()
    }
    
    func setUpTblView(){
        tableView.dataSource = self
        tableView.delegate = self
        let uiNib = UINib(nibName: "MemoriesVcTableViewCell", bundle: nil)
        tableView.register(uiNib, forCellReuseIdentifier: MemoriesVcTableViewCell.identifier)
    }
    
}

extension MemoriesViewController:UITableViewDataSource,UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return memories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: MemoriesVcTableViewCell.identifier, for: indexPath) as! MemoriesVcTableViewCell
    
        let memory = memories[indexPath.row]
        cell.configureCell(memory: memory)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "MemoryDetailViewController") as! MemoryDetailViewController
        nextVc.memory = memories[indexPath.row]
        
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
}
