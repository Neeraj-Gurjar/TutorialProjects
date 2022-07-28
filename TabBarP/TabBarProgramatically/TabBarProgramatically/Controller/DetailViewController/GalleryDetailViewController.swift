//
//  GalleryDetailViewController.swift
//  TabBarProgramatically
//
//  Created by bitcot on 22/06/22.
//

import UIKit

class GalleryDetailViewController: UIViewController {
    

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lbltitle:UILabel!
    
    let backBtn = UIButton(type: .system)
    var gallery : Gallery!
    var galleries = [Gallery]()
    var galleryTitle : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        galleries = [gallery]
        setUpCollectionView()
        setUpLbl()
        Utility.navBarLeftButton(button: backBtn, imgName: "BackBtnArrow", btnTitle: "Back", navBar: navigationBar)
        backBtn.addTarget(self, action: #selector(btnABack), for: .touchUpInside)
        navigationBar.topItem?.title = galleryTitle
    }
    
    func setUpCollectionView(){
        collectionView.dataSource = self
        
        let uinib = UINib(nibName: "GalleryDetailCollectionViewCell", bundle: nil)
        collectionView.register(uinib, forCellWithReuseIdentifier: GalleryDetailCollectionViewCell.identifier)
    }
    
    func setUpLbl(){
        lbltitle.layer.masksToBounds = true
        lbltitle.layer.cornerRadius = 5
        lbltitle.text = galleryTitle
    }
    
    @objc func btnABack(){
        self.navigationController?.popViewController(animated: false)
    }

}

extension GalleryDetailViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryDetailCollectionViewCell.identifier, for: indexPath) as! GalleryDetailCollectionViewCell
        cell.configureCell(gallery: galleries[indexPath.row])
        
        return cell
    }
    
    
}
