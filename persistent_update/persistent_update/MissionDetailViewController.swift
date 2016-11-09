//
//  MissionDetailViewController.swift
//  persistent_update
//
//  Created by Minh Pham on 11/8/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class MissionDetailViewController: UITableViewController{
    
    weak var cancelButtonDelegate: CancelButtonDelegate?
    var delegate: MissionDetailViewControllerDelegate?
    var missionToEdit: Mission?
    var missionToEditIndexPath: Int?
    
    @IBOutlet weak var inputText: UITextField!
    
    @IBAction func cancelBarButtonPressed(sender: UIBarButtonItem) {
        cancelButtonDelegate?.cancelButtonPressedFrom(self)
    }
    
    @IBAction func doneBarButtonPressed(sender: UIBarButtonItem) {
        if var mission = missionToEdit{
            mission.details = inputText.text!
            delegate?.missionDetailViewController(self, didFinishEditingMission: mission, atIndexPath: missionToEditIndexPath!)
        } else {
            let mission = inputText.text!
            delegate?.missionDetailViewController(self, didFinishAddingMission: mission)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if missionToEdit != nil {
            inputText.text = String(missionToEdit!.details!)
        }
    }
}
