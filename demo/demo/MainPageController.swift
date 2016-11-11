//
//  ViewController.swift
//  demo
//
//  Created by Minh Pham on 11/10/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class MainPageController: UITableViewController, CancelButtonDelegate, EditViewControllerDelegate {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "viewDog"{
        let navigationController = segue.destinationViewController as! UINavigationController
        let controller = navigationController.topViewController as! DetailsViewController
        controller.cancelButton = self
        
        if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell){
            controller.puppy_name = puppies[indexPath.row]
            controller.puppy_description = puppie_description[indexPath.row]
            controller.puppy_row = indexPath.row
        }
        }
        if segue.identifier == "addDog"{
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! EditViewController
            controller.cancelButton = self
            controller.delegate = self
        }
    }
    
    func cancelButtonDelegate(controller: UIViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func editViewController(controller: EditViewController, didFinishiAdding mission: [String]) {
        puppies.append(mission[0])
        puppie_description.append(mission[1])
        dismissViewControllerAnimated(true, completion: nil)
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("viewDog", sender: tableView.cellForRowAtIndexPath(indexPath))
    }
    
    
    @IBAction func addDogButton(sender: UIBarButtonItem) {
        performSegueWithIdentifier("addDog", sender: nil)
    }
    
    var puppies = ["dog1", "dog2", "dog3"]
    var puppie_description = ["descrip1", "descript2", "descript3"]
    var puppie_images = ["dog1", "dog2", "dog3"]

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return puppies.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell")!
        cell.textLabel?.text = puppies[indexPath.row]
        
//        cell.imageView?.image = UIImage(named: puppie_images[indexPath.row])
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

