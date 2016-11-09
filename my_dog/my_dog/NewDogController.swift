//
//  NewDogController.swift
//  my_dog
//
//  Created by Minh Pham on 11/9/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class NewDogController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var photoImageView = UIImageView(frame: CGRectMake(40, 40, 200, 200))
    
    @IBAction func addPhoto(sender: UIButton) {
        var photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.sourceType = .PhotoLibrary
        
        self.presentViewController(photoPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        photoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.photoImageView.backgroundColor = UIColor.greenColor()
        self.view.addSubview(photoImageView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
