//
//  Page.swift
//  TaxSwiftApp
//
//  Created by IKKO FUSHIKI on 8/11/15.
//  Copyright (c) 2015 IKKO FUSHIKI. All rights reserved.
//

import Cocoa

class Page {
    var containerView: NSView
    var viewContrller: ViewController
    
    init(view: NSView, viewController controller: ViewController) {
        self.containerView = view
        self.viewContrller = controller
    }
}