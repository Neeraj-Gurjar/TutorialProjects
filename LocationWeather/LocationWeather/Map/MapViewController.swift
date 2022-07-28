//
//  DropLocation_ViewController.swift
//  PersonalDriver_User
//
//  Created by mac on 23/05/22.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController,MKLocalSearchCompleterDelegate,UISearchBarDelegate {
    

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var searchCompleter = MKLocalSearchCompleter()
    var searchResults = [MKLocalSearchCompletion]()
    
    var latitude:Double = 0.0
    var longitude:Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchBar.delegate = self
        searchCompleter.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        let uiNib = UINib(nibName: "SuggestionTableViewCell", bundle: nil)
        tableView.register(uiNib, forCellReuseIdentifier: "SuggestionTableViewCell")
        
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCompleter.queryFragment = searchText
    }
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
        tableView.reloadData()
    }
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
    }
    
    
    
    @IBAction func close_Action(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension MapViewController: UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchResult = searchResults[indexPath.row]
      //  let cell = dropTableView.dequeueReusableCell(withIdentifier: "SuggestionTableViewCell", for: indexPath) as! SuggestionTableViewCell
//        cell.title_Label.text! = searchResult.title
//        cell.detailed_Label.text! = searchResult.subtitle
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = searchResult.title
        cell.detailTextLabel?.text = searchResult.subtitle
        return cell
    }
}

extension MapViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let result = searchResults[indexPath.row]
        let searchRequest = MKLocalSearch.Request(completion: result)
        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            guard let coordinate = response?.mapItems[0].placemark.coordinate else {
                return
            }
            guard let name = response?.mapItems[0].name else {
                return
            }

                self.latitude = coordinate.latitude
                self.longitude = coordinate.longitude
            
            self.searchBar.text = "\(name)"
            
            let nextView = self.storyboard?.instantiateViewController(withIdentifier: "ForeCastViewController") as! ForeCastViewController
            nextView.lat = self.latitude
            nextView.log = self.longitude
            nextView.country = "\(name)"
            
            self.navigationController?.pushViewController(nextView, animated: true)
            
            print("\(self.latitude), \(self.longitude)")
        }
    }
}
