//
//  ViewController.swift
//  bucket_list_crud
//
//  Created by Minh Pham on 11/7/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, CancelButtonDelegate, MissionDetailViewControllerDelegate {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddNewMission"{
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! MissionDetailViewController
            controller.cancelButtonDelegate = self
            controller.delegate = self
        } else if segue.identifier == "EditMission"{
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! MissionDetailViewController
            controller.cancelButtonDelegate = self
            controller.delegate = self

            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell){
                print("indexPath")
                controller.missionToEdit = missions[indexPath.row]
                controller.missionToEditIndexPath = indexPath.row
                print(controller.missionToEdit)
            }
        }
    }
    
    func cancelButtonPressedFrom(controller: UIViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func missionDetailViewController(controller: MissionDetailViewController, didFinishAddingMission mission: String) {
        dismiss(animated: true, completion: nil)
        missions.append(mission)
        tableView.reloadData()
    }
    
    func missionDetailViewController(controller: MissionDetailViewController, didFinishEditingMission mission: String, atIndexPath indexPath: Int) {
        print("viewcontroller edit")
        dismiss(animated: true, completion: nil)
        missions[indexPath] = mission
        tableView.reloadData()
    }

    
    var missions = ["Mission 1", "Mission 2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell")!
        cell.textLabel?.text = missions[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        missions.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditMission", sender: tableView.cellForRow(at: indexPath))
        print("accessrotyBUttonClicked")
        print(tableView.cellForRow(at: indexPath))
    }
}
