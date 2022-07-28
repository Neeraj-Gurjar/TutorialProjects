//
//  EventsViewController.swift
//  TabBarProgramatically
//
//  Created by bitcot on 15/06/22.
//

import UIKit

class EventsViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var tableView:UITableView!
    
    var events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        events = Constants.events
        setUpTblView()
        
        
    }
    
    func setUpTblView(){
        tableView.dataSource = self
        tableView.delegate = self
        let uiNib = UINib(nibName: "EventsTableViewCell", bundle: nil)
        tableView.register(uiNib, forCellReuseIdentifier: EventsTableViewCell.identifier)
    }


}

extension EventsViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventsTableViewCell.identifier, for: indexPath) as! EventsTableViewCell
        cell.configureEventCell(event: events[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "EventDetailViewController") as! EventDetailViewController
        nextVc.event = events[indexPath.row]
        print(events[indexPath.row])
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
}
