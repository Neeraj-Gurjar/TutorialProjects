//
//  MainWeatherViewController.swift
//  LocationWeather
//
//  Created by bitcot on 10/07/22.
//

import UIKit
import Lottie
import SnapKit
import MapKit
import CoreLocation
import ObjectMapper

class MainWeatherViewController: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var animationView:UIView!
    @IBOutlet weak var city:UILabel!
    @IBOutlet weak var latLog:UILabel!
    @IBOutlet weak var country:UILabel!
    @IBOutlet weak var temperauture:UILabel!
    @IBOutlet weak var weather:UILabel!
    @IBOutlet weak var weatherImg:UIImageView!
    @IBOutlet weak var day:UILabel!
    @IBOutlet weak var windVw:UIView!
    @IBOutlet weak var wind:UILabel!
    @IBOutlet weak var feelsLikeVw:UIView!
    @IBOutlet weak var feelsLike:UILabel!
    @IBOutlet weak var sunriseVw:UIView!
    @IBOutlet weak var sunRise:UILabel!
    @IBOutlet weak var pressureVw:UIView!
    @IBOutlet weak var pressure:UILabel!
    @IBOutlet weak var newsBtn:UIButton!
    
    
    var kelvin = 273.15
    var map: MKMapView!
    var locationManager = CLLocationManager()
    var currentLatitude:Double = 0
    var currentLogitude:Double = 0
    var zoomDistance:Double = 300
    var weatherMain:String?
    var animationViews:[AnimationView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAnimation()
        checkLocationServices()
        Timer.scheduledTimer(timeInterval: 20, target: self, selector: #selector(weatherAPICall), userInfo: nil, repeats: true)
        newsBtn.layer.cornerRadius = 5
        newsBtn.semanticContentAttribute = UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
        newsBtn.addTarget(self, action: #selector(btnANews), for: .touchUpInside)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animationViews.forEach({$0.play()})
    }
    
    override func viewDidLayoutSubviews() {
        windVw.layer.masksToBounds = true
        windVw.layer.cornerRadius = 10
        feelsLikeVw.layer.cornerRadius = 10
        sunriseVw.layer.cornerRadius = 10
        pressureVw.layer.cornerRadius = 10
    }
    
    func setAnimation(){
        
        animationViews.append(setAnimationView(animationName: "cloudyWeather", containerView: animationView))
        animationViews.append(setSubAnimation(animationName: "wind", containerView: windVw))
        animationViews.append(setSubAnimation(animationName: "hot", containerView: feelsLikeVw))
        animationViews.append(setSubAnimation(animationName: "sun", containerView: sunriseVw))
        animationViews.append(setSubAnimation(animationName: "Pressure", containerView: pressureVw))
    }
    
    @objc func btnANews(){
        let nextVc =  self.storyboard?.instantiateViewController(withIdentifier: "LiveNewsViewController") as! LiveNewsViewController
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
            checkLocationAuthorization()
        }else{
            showAlert(title: "Alert", message: "Please enable your location and restart the app")
        }
    }
    
    func checkLocationAuthorization(){
        switch CLLocationManager.authorizationStatus(){
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            break
        case .denied:
            showAlert(title: "Alert", message: "Please Enable Your Location Permission")
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestAlwaysAuthorization()
            break
        case .restricted:
            showAlert(title: "Alert", message: "Please Enable Your Location Permission")
            break
        case .authorizedAlways:
            map.showsUserLocation = true
            locationManager.startUpdatingLocation()
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        if center != nil{
            self.currentLatitude = center.latitude
            self.currentLogitude = center.longitude
            self.latLog.text = "\(self.currentLatitude)°N,\(self.currentLogitude)°E"
            weatherAPICall()
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
    @objc func weatherAPICall(){
        let url = "\(NetworkAPI.mainWeatherScreen_GET)lat=\(self.currentLatitude)&lon=\(self.currentLogitude)\(Key.key)"
        
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
                    let weatherModel = Mapper<WeatherModel>().map(JSONObject: response)
                    DispatchQueue.main.async {
                        self.city.text = weatherModel?.name
                        self.country.text = weatherModel?.sys?.country
                        self.weather.text! = weatherModel?.weather?.first?.main ?? ""
                        let icon = weatherModel?.weather?.first?.icon
                        let image = "https://openweathermap.org/img/wn/\(icon ?? "").png"
                        self.weatherImg.downloaded(from: image)
                        let time = weatherModel?.dt
                        Utility.timeStampToDate(unixtimeInterval: time ?? 00, text1: self.day, format: "EEEE, dd MMM")
                        let temp = (weatherModel?.main?.temp ?? 00) - self.kelvin
                        self.temperauture.text! = "\(String(format: "%.2f", temp))°C"
                        let feelLikeTemp = (weatherModel?.main?.feels_like ?? 00)-self.kelvin
                        self.feelsLike.text! = "\(String(format: "%.2f", feelLikeTemp))°C"
                        self.pressure.text! = "\((weatherModel?.main?.pressure)!)mbar"
                        Utility.timeStampToDate(unixtimeInterval: weatherModel?.sys?.sunrise ?? 00, text1: self.sunRise, format: "hh:mm")
                        self.wind.text! = "\((weatherModel?.wind?.speed)!)Km/j"
                    }
                }
            } catch let error {
                print(error.localizedDescription)
                self.showAlert(title: "Alert", message: "Server Disconnected")
            }
        })
        task.resume()
    }
    
    
    
    @IBAction func btnAChangeLocation(){
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    @IBAction func btnAWeeklyForeCast(_ sender: UIButton) {
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "ForeCastViewController") as! ForeCastViewController
       
        nextVc.country = "\((city.text)!),\((country.text)!)"
        nextVc.lat = currentLatitude
        nextVc.log = currentLogitude
        
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
}

