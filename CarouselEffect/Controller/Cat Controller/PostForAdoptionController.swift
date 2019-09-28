//
//  PostForAdoptionController.swift
//  CarouselEffect
//
//  Created by Mirzayantie on 25/09/2019.
//  Copyright © 2019 Mirzayantie. All rights reserved.
//

import UIKit
import os.log
import Firebase

class PostForAdoptionController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var catName: UITextField!
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var catDescription: UITextField!
    @IBOutlet weak var catBreed: UITextField!
    @IBOutlet weak var catAge: UITextField!
    @IBOutlet weak var catGender: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var catColour: UITextField!
    
    
    var cat: CatProfile?
    var currentid = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        catName.delegate = self
        
        
        //Set up views if editing an existing cat
        if let cat = cat {
            navigationItem.title = cat.catName
            catName.text = cat.catName
            catGender.text = cat.catGender
            catImage.image = cat.catImage
            catBreed.text = cat.catBreed
            currentid = cat.catID
            catDescription.text = cat.catDescription
            catColour.text = cat.catColour
        }
        
        //configNavigationBar()
        
        //Enable the save button only if the text field has a valid meal name
        updateSaveButtonState()
        
        
        
    }
    
    //MARK: Navigation
    
    
    @IBAction func SaveButton(_ sender: Any) {
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
                os_log("The save button was not pressed, cancelling...", log: OSLog.default, type: .debug)
                return
            }
            
            let name = catName.text ?? ""
            let photo = catImage.image
            let age = catAge.text ?? ""
            let breed = catBreed.text ?? ""
            let gender = catGender.text ?? ""
            let description = catDescription.text ?? ""
            let colour = catColour.text ?? ""
            
            
            cat = CatProfile(catID: currentid, catName: name, catImage: photo, catBreed: breed, catAge: age, catGender: gender, catDescription: description, catColour: colour )
            
            //access firebase database
            var ref: DatabaseReference!
            ref = Database.database().reference()
            let catsRef = ref.child("cat")
           // let storageRef = Storage.storage().reference()
            
            //create data
            var dict = [String: Any]()
            dict.updateValue(name, forKey: "name")
            dict.updateValue("photo\(name)", forKey: "photo")
            dict.updateValue(age, forKey: "age")
            dict.updateValue(breed, forKey: "breed")
            dict.updateValue(gender, forKey: "gender")
            dict.updateValue(colour, forKey: "colour")
            dict.updateValue(description, forKey: "description")
            catsRef.childByAutoId().setValue(dict)
        
        performSegue(withIdentifier: "savedPost", sender: self)
        
        }

        
    //MARK: ACTION
    
    @IBAction func selectImagefromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //hide keyboard. It ensures that if the user taps the image view while typing in the text field, the keyboard is dismissed properly.
        //catName.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imgPickerController = UIImagePickerController()
        
        imgPickerController.sourceType = .photoLibrary
        
        imgPickerController.delegate = self
        present(imgPickerController, animated: true, completion: nil)
    }
    
    //MARK: imagePickerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        catImage.image = selectedImage
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //hide keyboard
        catName.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //Disable the button when editing
        saveButton.isEnabled = false
    }
    
    //MARK: Private Methods
    private func updateSaveButtonState(){
        //Disable the Save button if the text field is empty
        //let text = catName.text ?? ""
        //saveButton.isEnabled = !text.isEmpty
        
        saveButton.isEnabled = false
        // if all text field are not empty, enable save button
        [catAge, catName, catColour, catBreed, catGender, catDescription].forEach({ $0.addTarget(self, action: #selector(editingChanged), for: .editingChanged) })
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        guard
            let name = catName.text, !name.isEmpty,
            let age = catAge.text, !age.isEmpty,
            let colour = catColour.text, !colour.isEmpty,
            let breed = catBreed.text, !breed.isEmpty,
            let description = catDescription.text, !description.isEmpty
            
            else {
                
                saveButton.isEnabled = false
                return
        }
        saveButton.isEnabled = true
    }
    
    func configNavigationBar() {
        
        // Create the navigation bar
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 64))
        
        // Offset by 20 pixels vertically to take the status bar into account
        
        navigationBar.backgroundColor = UIColor.white
        
        // Create a navigation item with a title
        let navigationItem = UINavigationItem()
        navigationItem.title = "Post"
        
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


