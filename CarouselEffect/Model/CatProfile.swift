//
//  CatProfile.swift
//  CarouselEffect
//
//  Created by Mirzayantie on 17/09/2019.
//  Copyright © 2019 Mirzayantie. All rights reserved.
//

import UIKit

class CatProfile
{
    // MARK: - Public API
    var title = ""
    var description = ""
    var numberOfMembers = 0
    var numberOfPosts = 0
    var featuredImage: UIImage!
    
    init(title: String, description: String, featuredImage: UIImage!)
    {
        self.title = title
        self.description = description
        self.featuredImage = featuredImage
        numberOfMembers = 1
        numberOfPosts = 1
    }
    
    // MARK: - Private
    // dummy data
    static func createCatProfile() -> [CatProfile]
    {
        return [
            CatProfile(title: "Miu Female", description: "Female, 3 months, Kuala Lumpur, Long Hair. 🐧⛺️✨", featuredImage: UIImage(named: "kitten")!),
            CatProfile(title: "Belang Male", description: "Male, 1 year, Kuala Lumpur, Persian. 🐧⛺️✨", featuredImage: UIImage(named: "cat2")!),
            CatProfile(title: "Tompok Female ", description: "Female, 9 months, Kuala Lumpur, Mix. 🐧⛺️✨", featuredImage: UIImage(named: "cat3")!),
            CatProfile(title: "Puteh Female", description: "Female, 3 years, Kuala Lumpur, Long Hair. 🐧⛺️✨", featuredImage: UIImage(named: "cat4")!),
            
        ]
    }
}
