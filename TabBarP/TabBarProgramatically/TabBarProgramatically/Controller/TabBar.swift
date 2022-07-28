//
//  TabBar.swift
//  TabBarProgramatically
//
//  Created by bitcot on 15/06/22.
//

import UIKit

class TabBar: UITabBarController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.selectedImageTintColor = .orange
        tabBar.isTranslucent = true
        tabBar.backgroundColor = .black
        tabBar.alpha = 0.9
           setupVCs()
        
    }
    
    func setupVCs() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let classmateviewController = storyboard.instantiateViewController(withIdentifier: "ClassmatesNavViewController") 
        classmateviewController.tabBarItem = UITabBarItem(title: "ClassMates", image: UIImage(named: "Classmates"), tag: 0)
        let eventviewController = storyboard.instantiateViewController(withIdentifier: "EventsNavViewController")
        eventviewController.tabBarItem = UITabBarItem(title: "Events", image: UIImage(named: "Events"), tag: 0)
        let memoriesviewController = storyboard.instantiateViewController(withIdentifier: "MemoriesNavViewController")
        memoriesviewController.tabBarItem = UITabBarItem(title: "Memories", image: UIImage(named: "Memories"), tag: 0)
        let galleryviewController = storyboard.instantiateViewController(withIdentifier: "GalleryNavViewController")
        galleryviewController.tabBarItem = UITabBarItem(title: "Gallery", image: UIImage(named: "Gallery"), tag: 0)
        let chatviewController = storyboard.instantiateViewController(withIdentifier: "ChatNavViewController")
        chatviewController.tabBarItem = UITabBarItem(title: "Chat", image: UIImage(named: "Chat"), tag: 0)
        
        viewControllers = [classmateviewController, eventviewController, memoriesviewController, galleryviewController, chatviewController]

       }


}
