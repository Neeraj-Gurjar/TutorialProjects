//
//  LiveNewsViewController.swift
//  LocationWeather
//
//  Created by bitcot on 15/07/22.
//

import UIKit

class LiveNewsViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView:UITableView!
    
    var news = [News]()

    override func viewDidLoad() {
        super.viewDidLoad()
        news = Constants.news
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LiveTableViewCell", for: indexPath) as! LiveTableViewCell
        let image = news[indexPath.row].channelImg
        cell.img.image = UIImage(named: "\(image)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 296
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = news[indexPath.row].channelUrl
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        nextVc.webURL = URL(string: url)
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    @IBAction func btnABack(){
        self.navigationController?.popViewController(animated: false)
    }

}
