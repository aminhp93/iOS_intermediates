//
//  MissionDetailViewController.swift
//  bucketList
//
//  Created by Minh Pham on 11/7/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class MissionDetailViewController: UITableViewController{
    weak var cancelButtonDelegate: CancelButtonDelegate?
    var delegate: MissionDetailViewControllerDelegate?
    
    @IBOutlet weak var newMissionTextField: UITextField!
    
    @IBAction func cancelBarButtonPressed(_ sender: UIBarButtonItem) {
        cancelButtonDelegate?.cancelButtonPressedFrom(controller: self)
    }
    
    @IBAction func doneBarButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.missionDetailViewController(controller: self, didFinishAddingMission: newMissionTextField.text!)
    }
    
}
