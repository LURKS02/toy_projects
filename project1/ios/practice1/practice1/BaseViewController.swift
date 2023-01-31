//
//  BaseViewController.swift
//  practice1
//
//  Created by APPLE on 2022/12/05.
//  Copyright © 2022 sejin. All rights reserved.
//

import Foundation
import UIKit
import DropDown

class BaseViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setDropDownButton(list : [String], anchor: UIButton)->DropDown{
        let dropDownButton = DropDown().then{
            $0.dataSource = list
            $0.anchorView = anchor
            $0.dismissMode = .automatic
            $0.bottomOffset = CGPoint(x:0, y:($0.anchorView?.plainView.bounds.height)!)
        }
        return dropDownButton
    }
    
}
