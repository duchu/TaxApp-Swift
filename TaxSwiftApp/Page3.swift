//
//  Page3.swift
//  TaxSwiftApp
//
//  Created by IKKO FUSHIKI on 8/11/15.
//  Copyright (c) 2015 IKKO FUSHIKI. All rights reserved.
//

import Cocoa

class Page3 : Page {
    //-----------------------------------------------------------------------------------------------------------
    // State & local taxes (Boxes 15-20) - Leave blank if no value
    //-----------------------------------------------------------------------------------------------------------
    var box15: NSPopUpButton                    // Box 15 - State
    var box15EmployerStateID: NSTextField       // Box 15 - Employer's state ID number
    var box16: NSTextField                      // Box 16 - State wages, tips, etc.
    var box17: NSTextField                      // Box 17 - State income tax
    var box18: NSTextField                      // Box 18 - Local wages, tips, etc.
    var box19: NSTextField                      // Box 19 - Local income tax
    var box20: NSTextField                      // Box 20 - Locality name
    var box20AssociatedState: NSPopUpButton     // Box 20 - Associated State

    override init(view: NSView, viewController controller: ViewController) {
        box15 = NSPopUpButton()
        box15EmployerStateID = NSTextField()
        box16 = NSTextField()
        box17 = NSTextField()
        box18 = NSTextField()
        box19 = NSTextField()
        box20 = NSTextField()
        box20AssociatedState = NSPopUpButton()
        
        super.init(view:view, viewController:controller)
    }

    override func addFields()
    {
        // First remove all subviews.
        ResourceUtil.removeAllSubviews(self.containerView)
        
        let viewRect = self.containerView.frame

        //-----------------------------------------------------------------------------------------------------------
        // State & local taxes (Boxes 15-20) - Leave blank if no value
        //-----------------------------------------------------------------------------------------------------------
        
        // Box 15 - State
        var x1:CGFloat, x2:CGFloat, y1:CGFloat, y2:CGFloat;
        x1 = 107.0; y1 = 132.0;
        x2 = 215.0; y2 = 164.0;
        self.box15 = ResourceUtil.createPopupButton(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box15.target = self.viewContrller
        self.box15.action = "itemDidChange:"
        ResourceUtil.addStatesToPopUpMenu(self.box15)
        self.containerView.addSubview(self.box15)
        
        // Box 15 - Employer's state ID number
        x1 = 231.0; y1 = 132.0;
        x2 = 465.0; y2 = 164.0;
        self.box15EmployerStateID = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box15EmployerStateID.delegate = self.viewContrller
        self.containerView.addSubview(self.box15EmployerStateID)
        
        // Box 16 - State wages, tips, etc.
        x1 = 481.0; y1 = 132.0;
        x2 = 652.0; y2 = 164.0;
        self.box16 = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box16.delegate = self.viewContrller
        self.containerView.addSubview(self.box16)
        
        // Box 17 - State income tax
        x1 = 667.0; y1 = 132.0;
        x2 = 839.0; y2 = 164.0;
        self.box17 = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box17.delegate = self.viewContrller
        self.containerView.addSubview(self.box17)
        
        // Box 18 - Local wages, tips, etc.
        x1 = 107.0; y1 = 245.0;
        x2 = 278.0; y2 = 278.0;
        self.box18 = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box18.delegate = self.viewContrller
        self.containerView.addSubview(self.box18)
        
        // Box 19 - Local income tax
        x1 = 293.0; y1 = 244.0;
        x2 = 456.0; y2 = 277.0;
        self.box19 = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box19.delegate = self.viewContrller
        self.containerView.addSubview(self.box19)
        
        // Box 20 - Locality name
        x1 = 481.0; y1 = 245.0;
        x2 = 653.0; y2 = 277.0;
        self.box20 = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box20.delegate = self.viewContrller
        self.containerView.addSubview(self.box20)
        
        // Box 20 - Associated State
        x1 = 668.0; y1 = 245.0;
        x2 = 841.0; y2 = 277.0;
        self.box20AssociatedState = ResourceUtil.createPopupButton(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box20AssociatedState.target = self.viewContrller
        self.box20AssociatedState.action = "itemDidChange:"
        ResourceUtil.addStatesToPopUpMenu(self.box20AssociatedState)
        self.containerView.addSubview(self.box20AssociatedState)
    }

}
