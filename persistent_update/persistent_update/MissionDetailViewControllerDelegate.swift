//
//  MissionDetailViewControllerDelegate.swift
//  persistent_update
//
//  Created by Minh Pham on 11/8/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import Foundation

protocol MissionDetailViewControllerDelegate: class {
    func missionDetailViewController(controller: MissionDetailViewController, didFinishAddingMission mission: String)
    
    func missionDetailViewController(controller: MissionDetailViewController, didFinishEditingMission mission: Mission, atIndexPath indexPath:Int)
}
