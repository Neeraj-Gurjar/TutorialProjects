//
//  ClassmatesViewController.swift
//  TabBarProgramatically
//
//  Created by bitcot on 15/06/22.
//

import UIKit
import SideMenu

class ClassmatesViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var segmentedControl:UISegmentedControl!
    @IBOutlet weak var collectionVwClassmates:UICollectionView!
    @IBOutlet weak var lblNoFavorite:UILabel!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var users = [User]()
    var filteredUsers: [User] = []
    var favoritedUsers:[User] = []
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.users = Constants.users
        if let user = UserSession.sharedInstance.user{
            self.users.append(user)
        }
        setUpCollectionView()
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search"
        searchController.searchResultsUpdater = self
        navigationBar.topItem?.searchController = searchController
        searchController.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
    
    func setUpCollectionView(){
        collectionVwClassmates.dataSource = self
        collectionVwClassmates.delegate = self
        
        let nib = UINib(nibName: ClassmatesCollectionViewCell.identifier, bundle: nil)
        collectionVwClassmates.register(nib, forCellWithReuseIdentifier: ClassmatesCollectionViewCell.identifier)
    }
    
    func filterContentForSearchText(_ searchText: String, category: User? = nil) {
        filteredUsers = users.filter { user in
            return user.name.lowercased().contains(searchText.lowercased())
        }
        collectionVwClassmates.reloadData()
    }
    
    @IBAction func didChangeSegmentControl(_ sender: UISegmentedControl) {
        collectionVwClassmates.reloadData()
    }
    
}
extension ClassmatesViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if segmentedControl.selectedSegmentIndex == 1 {
            if isFiltering {
                return filteredUsers.count
            }else{
                return favoritedUsers.count
            }
        }else {
            if isFiltering {
                return filteredUsers.count
            }else{
                return users.count
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionVwClassmates.dequeueReusableCell(withReuseIdentifier: ClassmatesCollectionViewCell.identifier, for: indexPath) as! ClassmatesCollectionViewCell
        cell.delegate = self
        var user : User!
        if segmentedControl.selectedSegmentIndex == 1 {
            user = isFiltering ? filteredUsers[indexPath.row] : favoritedUsers[indexPath.row]
        }else{
            user = isFiltering ? filteredUsers[indexPath.row] : users[indexPath.row]
        }
        cell.configureCell(user: user, isFavourited: favoritedUsers.contains(where: {$0.contactNo == user.contactNo}))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (collectionVwClassmates.frame.size.width-30)/2
        return CGSize(width: size, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "ClassMateDetailViewController") as! ClassMateDetailViewController
        
        if isFiltering{
            let user = isFiltering ? filteredUsers[indexPath.row] : users[indexPath.row]
            nextVc.user = user
        }else{
            nextVc.user = users[indexPath.row]
        }
        
        self.navigationController?.pushViewController(nextVc, animated: true)
       
    }
}

extension ClassmatesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}

extension ClassmatesViewController: ClassmatesCollectionViewCellDelegate{
    
    func didTapOnFavouriteButton(cell: ClassmatesCollectionViewCell) {
        if let indexpath = collectionVwClassmates.indexPath(for: cell){
            print(indexpath)
            if segmentedControl.selectedSegmentIndex == 1 {
                if isFiltering{
                    let selectedUser = filteredUsers[indexpath.row]
                    if favoritedUsers.contains(where: {$0.contactNo == selectedUser.contactNo}){
                        if let index = favoritedUsers.firstIndex(where: {$0.contactNo == selectedUser.contactNo}){
                            favoritedUsers.remove(at: index)
                        }
                    }else{
                        favoritedUsers.append(selectedUser)
                    }
                }else{
                    favoritedUsers.remove(at: indexpath.row)
                }
            }else{
                if isFiltering{
                    let selectedUser = filteredUsers[indexpath.row]
                    print(selectedUser)
                    if favoritedUsers.contains(where: {$0.contactNo == selectedUser.contactNo}){
                        if let index = favoritedUsers.firstIndex(where: {$0.contactNo == selectedUser.contactNo}){
                            favoritedUsers.remove(at: index)
                        }
                    }else{
                        favoritedUsers.append(selectedUser)
                    }
                }else{
                    let selectedUser = users[indexpath.row]
                    if favoritedUsers.contains(where: {$0.contactNo == selectedUser.contactNo}){
                        if let index = favoritedUsers.firstIndex(where: {$0.contactNo == selectedUser.contactNo}){
                            favoritedUsers.remove(at: index)
                        }
                    }else{
                        favoritedUsers.append(selectedUser)
                    }
                }
            }
            collectionVwClassmates.reloadData()
        }
    }
}
