//
//  ViewController.swift
//  my_dog
//
//  Created by Minh Pham on 11/9/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, NewDogControllerDelegate {
    
    var pictures = [UIImage]()
    var missions = ["1","2"]
    
    
    @IBOutlet weak var imageForView: UIImageView!
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! NewDogController
        controller.delegate = self
    }
    
    func newDogController(controller: NewDogController, didFinishAddingDog new_dog: UIImage) {
        dismissViewControllerAnimated(true, completion: nil)
        pictures.append(new_dog)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missions.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell")!
        cell.textLabel?.text = missions[indexPath.row]
        print(pictures)
//        cell.imageView?.image = pictures[indexPath.row]
//        cell.imageView?.image = pictures[indexPath.row]
        imageForView.image = pictures[indexPath.row]
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

