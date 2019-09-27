//
//  DetailCatInfoController.swift
//  CarouselEffect
//
//  Created by Mirzayantie on 24/09/2019.
//  Copyright © 2019 Mirzayantie. All rights reserved.
//


import UIKit
import Firebase

class DetailCatInfoController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configNavigationBar()
        
    }
    
    func configNavigationBar() {
        
        // Create the navigation bar
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 64))
        
        // Offset by 20 pixels vertically to take the status bar into account
        
        navigationBar.backgroundColor = UIColor.white
        
        // Create a navigation item with a title
                let navigationItem = UINavigationItem()
                navigationItem.title = "Detail Cat Info"
        
        //Back button logged user off to login page
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        
        
        // Assign the navigation item to the navigation bar
        navigationBar.items = [navigationItem]
        
        // Make the navigation bar a subview of the current view controller
        self.view.addSubview(navigationBar)
        
    }
    
    @objc func handleBack() {
        
        dismiss(animated: true, completion: nil)
    }
    

}
