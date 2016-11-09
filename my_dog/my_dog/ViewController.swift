//
//  ViewController.swift
//  my_dog
//
//  Created by Minh Pham on 11/9/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var missions = ["1","2"]
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missions.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell")!
        cell.textLabel?.text = missions[indexPath.row]
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

