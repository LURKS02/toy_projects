//
//  Utilities.swift
//  practice1
//
//  Created by APPLE on 2022/12/05.
//  Copyright © 2022 sejin. All rights reserved.
//

import Foundation

public protocol Then {}

extension Then where Self: AnyObject{
    public func then(_ myself: (Self)-> Void)->Self{
        myself(self)
        return self
    }
    
}

extension NSObject : Then{}

