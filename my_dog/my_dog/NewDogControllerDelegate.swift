//
//  NewDogControllerDelegate.swift
//  my_dog
//
//  Created by Minh Pham on 11/10/16.
//  Copyright © 2016 Minh Pham. All rights reserved.
//

import UIKit

protocol NewDogControllerDelegate: class {
    func newDogController(controller: NewDogController, didFinishAddingDog new_dog: UIImage)
}
