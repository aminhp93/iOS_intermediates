//
//  ViewController.swift
//  bucketList
//
//  Created by Minh Pham on 11/7/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, CancelButtonDelegate, MissionDetailViewControllerDelegate{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddNewMission"{
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! MissionDetailViewController
            controller.cancelButtonDelegate = self
            controller.delegate = self
        }
    }
    
    func missionDetailViewController(controller: MissionDetailViewController, didFinishAddingMission mission: String) {
        dismiss(animated: true, completion: nil)
        missions.append(mission)
        tableView.reloadData()
    }
    
    func cancelButtonPressedFrom(controller: UIViewController) {
        dismiss(animated: true, completion: nil)
    }

    
    
    
    var missions = ["Sky diving", "Live in Hawaii"]
    override func viewDidLoad() {
        print("sdaf")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")!
        // All UITableViewCell objects have a build in textLabel so set it to the model that is corresponding to the row in array
        cell.textLabel?.text = missions[indexPath.row]
        // return cell so that Table View knows what to draw in each row
        return cell
    }

}

