//
//  MissionDetailsViewControllerDelegate.swift
//  bucketList
//
//  Created by Minh Pham on 11/7/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import Foundation
protocol MissionDetailViewControllerDelegate {
    func missionDetailViewController(controller: MissionDetailViewController, didFinishAddingMission mission: String)
}
