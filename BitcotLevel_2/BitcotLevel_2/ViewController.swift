//
//  ViewController.swift
//  BitcotLevel_2
//
//  Created by bitcot on 02/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var top_Label:UILabel!
    @IBOutlet weak var airLineTableView:UITableView!

    var dataArray:[Any] = []
    
    var totalPage = 1
    var currentBatchSize = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        
        //tableView refresh control
        self.airLineTableView.refreshControl = UIRefreshControl()
        self.airLineTableView.refreshControl?.addTarget(self, action: #selector(refreshControler), for: .valueChanged)
        currentBatchSize = 20
        apiCall(batchSize: 20, refresh: true)
    }
    @objc func refreshControler(){
      //  self.dataArray.removeAll()
        currentBatchSize = 20
        apiCall(batchSize: 20, refresh: true)
    }
    
    func setUpTableView(){
        airLineTableView.dataSource = self
        airLineTableView.delegate = self
        
        airLineTableView.separatorStyle = .none
        
        let uinib = UINib(nibName: "AirDataTableViewCell", bundle: nil)
        airLineTableView.register(uinib, forCellReuseIdentifier: "AirDataTableViewCell")
        
        let uinib_2 = UINib(nibName: "LoadingTableViewCell", bundle: nil)
        airLineTableView.register(uinib_2, forCellReuseIdentifier: "LoadingTableViewCell")
        
    }

    func apiCall(batchSize:Int, refresh:Bool = false){
        if refresh{
            airLineTableView.refreshControl?.beginRefreshing()
        }
        
        let url = "https://api.instantwebtools.net/v1/passenger?page=0&size=\(batchSize)"
        let session = URLSession.shared
        let request = URLRequest(url: URL(string: url)!)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else { return }
            guard let data = data else { return }
            do {
                if let response = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:Any] {
                  //  print(response)
            if response != nil{
                    self.dataArray = response["data"] as! [Any]
                        print("COUNTDOWNnPages \(self.dataArray.count)")
                    DispatchQueue.main.async {
                        self.totalPage = response["totalPages"] as! Int
                        if refresh{
                            self.airLineTableView.refreshControl?.endRefreshing()
                        }
                        self.airLineTableView.reloadData()
                    }
                }
            }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
}

//TableView Methods
extension ViewController:UITableViewDataSource,UITableViewDelegate{
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return dataArray.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          if currentBatchSize < totalPage && indexPath.row == dataArray.count - 1 {
              let cell = airLineTableView.dequeueReusableCell(withIdentifier: "LoadingTableViewCell", for: indexPath) as! LoadingTableViewCell
              return cell
             }else{
              let cell = airLineTableView.dequeueReusableCell(withIdentifier: "AirDataTableViewCell", for: indexPath) as! AirDataTableViewCell
              let dict = dataArray[indexPath.row] as! [String:Any]
              let airlinedata = dict["airline"] as! [Any]
              let airline = airlinedata[0] as! [String:Any]
              let logo = airline["logo"] as! String
        
                  cell.titleNameLabel.text! = dict["name"] as! String
                  cell.airLineName_Label.text! = airline["name"] as! String
                  cell.numberofPasse_Label.text! = "\(dict["trips"] ?? 0)"
              let image:URL = URL(string: logo)!
                  cell.airLineImage.downloaded(from: image)
              
                  cell.selectionStyle = .none
              return cell
          }
      }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if currentBatchSize < totalPage && indexPath.row == dataArray.count - 1{
            currentBatchSize = currentBatchSize + 20
            apiCall(batchSize: currentBatchSize, refresh: false)
        }
    }
}

//Extension for image download
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

