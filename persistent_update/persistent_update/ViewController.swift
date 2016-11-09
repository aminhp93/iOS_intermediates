//
//  ViewController.swift
//  persistent_update
//
//  Created by Minh Pham on 11/8/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController, CancelButtonDelegate, MissionDetailViewControllerDelegate {
    var editSegueMode = false
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var missions = [Mission]()

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navigationController = segue.destinationViewController as! UINavigationController
        let controller = navigationController.topViewController as! MissionDetailViewController
        controller.cancelButtonDelegate = self
        controller.delegate = self
        if editSegueMode == true{
            if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell){
                controller.missionToEdit = missions[indexPath.row]
                controller.missionToEditIndexPath = indexPath.row
            }
        }
    }
    
    func cancelButtonPressedFrom(controller: UIViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Adding Method
    func missionDetailViewController(controller: MissionDetailViewController, didFinishAddingMission mission: String) {
        dismissViewControllerAnimated(true, completion: nil)

        let entity = NSEntityDescription.entityForName("Mission", inManagedObjectContext: managedObjectContext)
        let mission_1 = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
        
        mission_1.setValue(mission, forKey: "details")
        if managedObjectContext.hasChanges{
            do {
                try managedObjectContext.save()
                print("Success")
            } catch {
                print("\(error)")
            }
        }
        fetchAllMission()
        tableView.reloadData()
        
        print(missions)
        print("end adding")
    }
    
    // Editing Method
    func missionDetailViewController(controller: MissionDetailViewController, didFinishEditingMission mission: Mission, atIndexPath indexPath: Int) {
        print("editing)")
        print(mission)
        
        dismissViewControllerAnimated(true, completion: nil)
        
        let entity = NSEntityDescription.entityForName("Mission", inManagedObjectContext: managedObjectContext)
        let mission_1 = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
        
        mission_1.setValue(mission.details!, forKey: "details")
        if managedObjectContext.hasChanges{
            do {
                try managedObjectContext.save()
                print("Success")
            } catch {
                print("\(error)")
            }
        }
        
        fetchAllMission()
        
        tableView.reloadData()
        print("end editing")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missions.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FirstCell")!
        cell.textLabel?.text = missions[indexPath.row].details
        return cell
    }
    
    func fetchAllMission(){
        let userRequets = NSFetchRequest(entityName: "Mission")
        print(userRequets)
        do {
            // get the results by executing the fetch request we made earlier
            let results = try managedObjectContext.executeFetchRequest(userRequets)
            for i in results {
                print ("one by one", i.details)
            }
            // downcast the results as an array of Mission objects
            missions = (results as? [Mission])!
            print(missions)
        } catch {
            // print the error if it is caught (Swift automatically saves the error in "error")
            print("\(error)")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllMission()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        editSegueMode = true
        performSegueWithIdentifier("EditMission", sender: tableView.cellForRowAtIndexPath(indexPath))
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        missions.removeAtIndex(indexPath.row)
        tableView.reloadData()
    }

}

