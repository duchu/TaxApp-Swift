//
//  Page2.swift
//  TaxSwiftApp
//
//  Created by IKKO FUSHIKI on 8/11/15.
//  Copyright (c) 2015 IKKO FUSHIKI. All rights reserved.
//

import Cocoa

class Page2 : Page {
    //-----------------------------------------------------------------------------------------------------------
    // Employer's information
    //-----------------------------------------------------------------------------------------------------------
    var box7: NSTextField                   // Social Sec. tips
    var box8: NSTextField                   // Allocated tips
    var box10: NSTextField                  // Dependent care benefits
    var box11: NSTextField                  // Nonqualfied plans
    var box12LetterCode: NSPopUpButton      // Letter code
    var box12Amount: NSTextField            // Box 12 amount
    var box13SatutoryEmployee: NSButton     // Box 13 - Satutory employee
    var box13RetirementPlan: NSButton       // Box 13 - Retirement plan
    var box13ThirdPartySickPay: NSButton    // Box 13 - Third-party sick pay
    var box14: NSTextField                  // Box 14
    var box14Amount: NSTextField            // Box 14 amount

    override init(view: NSView, viewController controller: ViewController) {
        box7 = NSTextField()
        box8 = NSTextField()
        box10 = NSTextField()
        box11 = NSTextField()
        box12LetterCode = NSPopUpButton()
        box12Amount = NSTextField()
        box13SatutoryEmployee = NSButton()
        box13RetirementPlan = NSButton()
        box13ThirdPartySickPay = NSButton()
        box14 = NSTextField()
        box14Amount = NSTextField()
        
        super.init(view:view, viewController:controller)
    }


    override func addFields()
    {
        // First remove all subviews.
        ResourceUtil.removeAllSubviews(self.containerView)
        
        let viewRect = self.containerView.frame
        //-----------------------------------------------------------------------------------------------------------
        // Less common items (Boxes 7 - 14) - Leave blank if no value
        //-----------------------------------------------------------------------------------------------------------
        
        // Box 7 - Social Sec. tips
        var x1:CGFloat, x2:CGFloat, y1:CGFloat, y2:CGFloat;
        x1 = 107.5; y1 = 125.0;
        x2 = 465.0; y2 = 156.0;
        self.box7 = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box7.delegate = self.viewContrller
        self.containerView.addSubview(self.box7)
        
        // Box 8 - Allocated tips
        x1 = 481.0; y1 = 123.0;
        x2 = 840.0; y2 = 156.0;
        self.box8 = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box8.delegate = self.viewContrller
        self.containerView.addSubview(self.box8)
        
        // Box 10 - Dependent care benefits
        x1 = 107.0; y1 = 200.0;
        x2 = 465.0; y2 = 231.0;
        self.box10 = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box10.delegate = self.viewContrller
        self.containerView.addSubview(self.box10)
        
        // Box 11 - Nonqualified plans
        x1 = 480.0; y1 = 200.0;
        x2 = 840.0; y2 = 231.0;
        self.box11 = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box11.delegate = self.viewContrller
        self.containerView.addSubview(self.box11)
        
        // Box 12a-12d Letter code
        x1 = 144.0; y1 = 338.0;
        x2 = 307.0; y2 = 368.0;
        self.box12LetterCode = ResourceUtil.createPopupButton(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box12LetterCode.target = self.viewContrller
        self.box12LetterCode.action = "itemDidChange:"
        self.addLetterCode(self.box12LetterCode);
        self.containerView.addSubview(self.box12LetterCode)
        
        // Box 12 Amount
        x1 = 324.0; y1 = 337.0;
        x2 = 456.0; y2 = 368.0;
        self.box12Amount = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box12Amount.delegate = self.viewContrller
        self.containerView.addSubview(self.box12Amount)
        
        // Box 13 (3 check buttons)
        x1 = 481.0; y1 = 343.0;
        x2 = 491.0; y2 = 353.0;
        self.box13SatutoryEmployee = ResourceUtil.createCheckBox(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box13SatutoryEmployee.target = self.viewContrller
        self.box13SatutoryEmployee.action = "checkBoxClicked:"
        self.containerView.addSubview(self.box13SatutoryEmployee)
        
        x1 = 481.0; y1 = 370.0;
        x2 = 491.0; y2 = 380.0;
        self.box13RetirementPlan = ResourceUtil.createCheckBox(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box13RetirementPlan.target = self.viewContrller
        self.box13RetirementPlan.action = "checkBoxClicked:"
        self.containerView.addSubview(self.box13RetirementPlan)
        
        x1 = 481.0; y1 = 397.0;
        x2 = 491.0; y2 = 407.0;
        self.box13ThirdPartySickPay = ResourceUtil.createCheckBox(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box13ThirdPartySickPay.target = self.viewContrller;
        self.box13ThirdPartySickPay.action = "checkBoxClicked:"
        self.containerView.addSubview(self.box13ThirdPartySickPay)
        
        // Box 14
        x1 = 107.0; y1 = 526.0;
        x2 = 340.0; y2 = 558.0;
        self.box14 = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box14.delegate = self.viewContrller
        self.containerView.addSubview(self.box14)
        
        // Box 14 Amount
        x1 = 356.0; y1 = 525.0;
        x2 = 590.0; y2 = 558.0;
        self.box14Amount = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box14Amount.delegate = self.viewContrller
        self.containerView.addSubview(self.box14Amount)
    }


    // Adds letter cocdes (Box 12) to the given popup menu.
    func addLetterCode(popupButton: NSPopUpButton)
    {
        popupButton.addItemWithTitle("Select a code")
        popupButton.addItemWithTitle("A")
        popupButton.addItemWithTitle("B")
        popupButton.addItemWithTitle("C")
        popupButton.addItemWithTitle("D")
        popupButton.addItemWithTitle("E")
        popupButton.addItemWithTitle("F")
        popupButton.addItemWithTitle("G")
        popupButton.addItemWithTitle("H")
        popupButton.addItemWithTitle("J")
        popupButton.addItemWithTitle("K")
        popupButton.addItemWithTitle("L")
        popupButton.addItemWithTitle("M")
        popupButton.addItemWithTitle("N")
        popupButton.addItemWithTitle("P")
        popupButton.addItemWithTitle("Q")
        popupButton.addItemWithTitle("R")
        popupButton.addItemWithTitle("S")
        popupButton.addItemWithTitle("T")
        popupButton.addItemWithTitle("V")
        popupButton.addItemWithTitle("W")
        popupButton.addItemWithTitle("Y")
        popupButton.addItemWithTitle("Z")
        popupButton.addItemWithTitle("AA")
        popupButton.addItemWithTitle("BB")
        popupButton.addItemWithTitle("DD")
        popupButton.addItemWithTitle("EE")
    }







}
