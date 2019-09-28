//
//  CatListController.swift
//  CarouselEffect
//
//  Created by Mirzayantie on 24/09/2019.
//  Copyright © 2019 Mirzayantie. All rights reserved.
//

import UIKit

class CatListController: UITableViewController {

    var catProfile = CatProfile.createCatProfile()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configNavigationBar()
        
      
    }

    func configNavigationBar() {
        
        // Create the navigation bar
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 64))
        
        // Offset by 20 pixels vertically to take the status bar into account
        
        navigationBar.backgroundColor = UIColor.white
        
        // Create a navigation item with a title
//        let navigationItem = UINavigationItem()
//        navigationItem.title = "All Cats"
        
        //Back button logged user off to login page
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleBack))
        
        let searchImage = UIImage(named: "search")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        navigationItem.rightBarButtonItem = searchBarButtonItem
        
        // Assign the navigation item to the navigation bar
        navigationBar.items = [navigationItem]
        
        // Make the navigation bar a subview of the current view controller
        self.view.addSubview(navigationBar)
        
    }
    
    @objc func handleBack() {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc func handleSearch() {
        //
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return catProfile.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "catViewCell", for: indexPath) as? CatViewCell else {
            fatalError("The dequeued cell is not an isntance of CatViewCell")
        }
        
        let catProfiles = catProfile[indexPath.row]
    
        cell.catName.text = catProfiles.catName
        cell.catImage.image = catProfiles.catImage

        return cell
    }
    

    

}
