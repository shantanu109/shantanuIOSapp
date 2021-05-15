//
//  IgnitingViewController.swift
//  KalamAppMain
//
//  Created by shantanu pandey on 13/07/18.
//  Copyright © 2018 shantanu pandey. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth
import Firebase

class IgnitingViewController: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate
{
    
    
    let ref : DatabaseReference? = Database.database().reference()
    let uid = Auth.auth().currentUser?.uid
    
     var databaseHandle : DatabaseHandle?
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var selectedImageFromPicker : UIImage?
    var selectedImage : UIImage?
    
    @IBOutlet weak var textBox: UITextField!
    
    @IBOutlet weak var dropDown: UIPickerView!
    
     let list : Array = [1,2,3]
    
    static var IgnitingTime = Double()
    static var row1 = Int()
    
    static var InterventionTime = Double()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return "\(list[row])"
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textBox.text = "\(list[row])"
        
        self.dropDown.isHidden = true
        IgnitingViewController.IgnitingTime = Double(list[row])
        IgnitingViewController.row1 = row
        print(IgnitingViewController.IgnitingTime)
        
        IgnitingViewController.InterventionTime = IgnitingViewController.InterventionTime + IgnitingViewController.IgnitingTime
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.textBox
        {
            self.dropDown.isHidden = false
            textField.endEditing(true)
        }
    }
    
   
    
    @IBAction func uploadImageButton(_ sender: Any)
    {
       
       handleSelectedProfileImageView()
      
        
    }
    
    var filename = String()
    
    var imageReference : StorageReference
    {
        return Storage.storage().reference().child("Igniting Minds")
    }
    /*
     func handleImages()
     {
     guard let image = self.selectedImage else { return }
     guard let imageData = UIImageJPEGRepresentation(image, 1) else { return }
     
     let uploadImageRef = imageReference.child(filename)
     
     let uploadTask = uploadImageRef.putData(imageData, metadata: nil) { (metadata, error) in
     print("Upload Task Finished")
     print(metadata ?? "NO METADATA")
     print(error ?? "NO ERROR")
     }
     
     uploadTask.observe(.progress) { (snapshot) in
     print(snapshot.progress ?? "NO MORE PROGRESS")
     }
     
     uploadTask.resume()
     }
     */
    
    
    func handleSelectedProfileImageView()
    {
        
        
        let picker = UIImagePickerController()
        
        
        picker.delegate = self
        picker.allowsEditing = true
     
        present(picker, animated: true, completion: nil)
        
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage
        {
            selectedImageFromPicker = editedImage
            
        }
        else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage
        {
            selectedImageFromPicker = originalImage
            
        }
        if var selectedImage = selectedImageFromPicker
        {
            selectedImage = selectedImageFromPicker!
            print("Selected image")
            
            guard let image = self.selectedImageFromPicker else { return }
            guard let imageData = UIImageJPEGRepresentation(image, 1) else { return }
            self.filename = "\(RegisterViewController.PhotoEmail) + \(arc4random()).jpg"
            let uploadImageRef = imageReference.child(filename)
          
            let uploadTask = uploadImageRef.putData(imageData, metadata: nil) { (metadata, error) in
                
                print("Upload Task Finished")
                print(metadata ?? "NO METADATA")
                print(error ?? "NO ERROR")
                self.spinner.stopAnimating()
                
            }
            
           self.spinner.startAnimating()
           
            uploadTask.observe(.progress) { (snapshot) in
                print(snapshot.progress ?? "NO MORE PROGRESS")
                
            }
            
            uploadTask.resume()
            
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        print("cancelled picker")
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool)
    {
        
        
        updateDatabase()
    }
    
    func updateDatabase()
    {
        
        ref?.child("users").child(uid!).updateChildValues(["IgnitingTime" : IgnitingViewController.IgnitingTime])
        
        ref?.child("users").child(uid!).updateChildValues(["InterventionTime" : IgnitingViewController.InterventionTime])
        
        print("Your time has been updated")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        textBox.text = "\(IgnitingViewController.IgnitingTime)"
    }
    
    override func viewDidLoad()
    {
        databaseHandle = ref?.child("users").child(uid!).observe(.value, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject]
            {
                RegisterViewController.PhotoEmail = (dictionary["email"] as? String)!
                
                
            }
            
        })
    }
    
}




  
