//
//  DetailsViewController.swift
//  demo
//
//  Created by Minh Pham on 11/10/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, CancelButtonDelegate, EditViewControllerDelegate {
    
    var cancelButton: CancelButtonDelegate?
    var puppy_name:String?
    var puppy_image:String?
    var puppy_description:String?
    var puppy_row: Int?
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textInput: UITextField!
    
    @IBAction func cancelButton(sender: UIBarButtonItem) {
        cancelButton?.cancelButtonDelegate(self)
    }
    
    @IBAction func updateButton(sender: UIButton) {
        performSegueWithIdentifier("updateDog", sender: [String(puppy_row), puppy_name!, puppy_description!])
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "updateDog"{
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! EditViewController
            controller.cancelButton = self
            controller.nameLabel_2 = String(sender![1])
            controller.descriptionLabel_2 = String(sender![2])
            controller.delegate = self
        }
    }
    
    func cancelButtonDelegate(controller: UIViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func editViewController(controller: EditViewController, didFinishiAdding mission: [String]) {
        name.text = mission[0]
        textInput.text = mission[1]
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        name.text = puppy_name
        // imageView.image = UIImage(named: puppy_image!)
        textInput.text = puppy_description
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

