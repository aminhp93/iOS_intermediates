//
//  EditViewController.swift
//  demo
//
//  Created by Minh Pham on 11/10/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    var cancelButton:CancelButtonDelegate?
    var delegate: EditViewControllerDelegate?
    var nameLabel_2: String?
    var descriptionLabel_2: String?
    
    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var descriptionLabel: UITextField!
    
    @IBAction func doneButton(sender: UIBarButtonItem) {
        
        delegate?.editViewController(self, didFinishiAdding: [nameLabel.text!, descriptionLabel.text!])
    }
    
    @IBAction func cancelButton(sender: UIBarButtonItem) {
        cancelButton?.cancelButtonDelegate(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameLabel.text = nameLabel_2
        descriptionLabel.text = descriptionLabel_2
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

