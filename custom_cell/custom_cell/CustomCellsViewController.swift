//
//  ViewController.swift
//  custom_cell
//
//  Created by Minh Pham on 11/9/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

class CustomeCellsViewController: UITableViewController {

    var nums = [1,2,300,4,540]
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as! CustomCell
        cell.label.text = "\(nums[indexPath.row])"
        if nums[indexPath.row] > 24 {
            cell.leftButton.backgroundColor = UIColor.greenColor()
        } else {
            cell.leftButton.backgroundColor = UIColor.redColor()
        }
        // return cell so that Table View knows what to draw in each row
        return cell
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nums.count
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

