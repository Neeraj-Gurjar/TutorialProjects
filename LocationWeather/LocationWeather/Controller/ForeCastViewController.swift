//
//  ForeCastViewController.swift
//  LocationWeather
//
//  Created by bitcot on 11/07/22.
//

import UIKit
import SnapKit
import Lottie
import ObjectMapper

class ForeCastViewController: UIViewController {
    
    @IBOutlet weak var animationView:UIView!
    @IBOutlet weak var countryLbl:UILabel!
    @IBOutlet weak var tableView:UITableView!
    
    var country:String?
    var lat:Double?
    var log:Double?
    var forecast:ForCastModel?
    var kelvin = 273.15

    override func viewDidLoad() {
        super.viewDidLoad()
        setTblVw()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    //    setAnimationView(animationName: "summer", containerView: animationView)
        foreCastAPICall()
        countryLbl.text = country
    }
    
    func setTblVw(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func foreCastAPICall(){
        let url = "https://api.openweathermap.org/data/2.5/onecall?lat=\((self.lat)!)&lon=\((self.log)!)&appid=4cd569ffb3ecc3bffe9c0587ff02109f"
        
        let session = URLSession.shared
        let request = URLRequest(url: URL(string: url)!)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            do {
                
                if let response = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    self.forecast = Mapper<ForCastModel>().map(JSONObject: response)
                  
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            } catch let error {
                print(error.localizedDescription)
                self.showAlert(title: "Alert", message: error.localizedDescription)
            }
        })
        
        task.resume()
    }
    
    @IBAction func btnAClose(){
        self.navigationController?.popViewController(animated: true)
    }
}

extension ForeCastViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let daily = forecast?.daily{
            return daily.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForeCastTableViewCell", for: indexPath) as! ForeCastTableViewCell
        let daily = forecast?.daily?[indexPath.row]
        if let weather = daily?.weather{
            cell.weather.text = weather.first?.description
            cell.airSpeed.text = "\(daily?.wind_speed ?? 00)Km/j"
            var temp = (daily?.temp?.day ?? 00)-self.kelvin
            cell.temperature.text = "\(Int(temp))°C"
            Utility.timeStampToDate(unixtimeInterval: daily?.dt ?? 00, text1: cell.day, format: "dd/MMM/YYYY")
            let icon = weather.first?.icon
            let image = "https://openweathermap.org/img/wn/\(icon ?? "").png"
            cell.icon.downloaded(from: image)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }
}

