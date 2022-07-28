//
//  GalleryViewController.swift
//  TabBarProgramatically
//
//  Created by bitcot on 15/06/22.
//

import UIKit

class GalleryViewController: UIViewController {
    
    
    @IBOutlet weak var navigationBaar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    var galleries = [Gallery]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        galleries = Constants.galleries
        setUpTblView()
        
    }
    
    func setUpTblView(){
        tableView.dataSource = self
        tableView.delegate = self
        let uiNib = UINib(nibName: "GalleryVcTableViewCell", bundle: nil)
        tableView.register(uiNib, forCellReuseIdentifier: GalleryVcTableViewCell.identifier)
    }
    
}

extension GalleryViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return galleries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: GalleryVcTableViewCell.identifier, for: indexPath) as! GalleryVcTableViewCell
        
        cell.configure(gallery: galleries[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "GalleryDetailViewController") as! GalleryDetailViewController
        let gallery = galleries[indexPath.row]
        nextVc.gallery = gallery
        nextVc.galleryTitle = gallery.title
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
}
