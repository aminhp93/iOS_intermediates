//
//  EditViewControllerDelegate.swift
//  demo
//
//  Created by Minh Pham on 11/11/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate:class {
    func editViewController(controller: EditViewController, didFinishiAdding mission: [String])
}
