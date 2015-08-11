//
//  Page1.swift
//  TaxSwiftApp
//
//  Created by IKKO FUSHIKI on 8/10/15.
//  Copyright (c) 2015 IKKO FUSHIKI. All rights reserved.
//

import Cocoa

class Page1 : Page {
    //-----------------------------------------------------------------------------------------------------------
    // Employer's information
    //-----------------------------------------------------------------------------------------------------------
    var boxB: NSTextField                   // Employer's identification number (EIN)
    var boxC: NSTextField                   // Employer name
    var employerNameLine2: NSTextField      // Employer name line 2 (optional)
    var addressType: NSPopUpButton          // Address Type as a popup button.
    var address: NSTextField                // Address
    var city: NSTextField                   // City
    var state: NSPopUpButton                // State
    var zipCode: NSTextField                // ZIP code
    
    //-----------------------------------------------------------------------------------------------------------
    // Extra fields needed for Query (Boxes 0)
    //-----------------------------------------------------------------------------------------------------------
    var box0_Age: NSTextField               // Age
    var box0_Occupation: NSPopUpButton      // Occupation
    
    //-----------------------------------------------------------------------------------------------------------
    // Incoem & taxes withheld (Boxes 1-6)
    //-----------------------------------------------------------------------------------------------------------
    var box1: NSTextField                   // Wages, tips, other
    var box2: NSTextField                   // Federal tax withheld
    var box3: NSTextField                   // Social Sec. wages
    var box4: NSTextField                   // Social Sec. tax withheld
    var box5: NSTextField                   // Medicare Wages
    var box6: NSTextField                   // Medicre tax withheld

    override init(view: NSView, viewController controller: ViewController) {
        boxB = NSTextField()                   // Employer's identification number (EIN)
        boxC = NSTextField()                   // Employer name
        employerNameLine2 = NSTextField()      // Employer name line 2 (optional)
        addressType = NSPopUpButton()          // Address Type as a popup button.
        address = NSTextField()                // Address
        city = NSTextField()                   // City
        state = NSPopUpButton()                // State
        zipCode = NSTextField()                // ZIP code

        box0_Age = NSTextField()               // Age
        box0_Occupation = NSPopUpButton()      // Occupation
        
        box1 = NSTextField()                   // Wages, tips, other
        box2 = NSTextField()                   // Federal tax withheld
        box3 = NSTextField()                   // Social Sec. wages
        box4 = NSTextField()                   // Social Sec. tax withheld
        box5 = NSTextField()                   // Medicare Wages
        box6 = NSTextField()                   // Medicre tax withheld
    
        super.init(view:view, viewController:controller)
    }

    func addFields()
    {
        // First remove all subviews.
        ResourceUtil.removeAllSubviews(self.containerView)
        
        let viewRect = self.containerView.frame
        
        //-----------------------------------------------------------------------------------------------------------
        // Employer's information
        //-----------------------------------------------------------------------------------------------------------
        
        // Box B
        var x1:CGFloat = 107.5; var y1:CGFloat = 80.0;
        var x2:CGFloat = 521.0; var y2:CGFloat = 113.0;
        self.boxB = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.boxB.delegate = self.viewContrller;
        self.containerView.addSubview(self.boxB);

        // Box C
        x1 = 107.5; y1 = 217.0;
        x2 = 340.0; y2 = 249.0;
        self.boxC = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.boxC.delegate = self.viewContrller;
        self.containerView.addSubview(self.boxC);
        
        // Employer name line 2 (optional)
        x1 = 356.0; y1 = 217.0;
        x2 = 590.0; y2 = 249.0;
        self.employerNameLine2 = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.employerNameLine2.delegate = self.viewContrller
        self.containerView.addSubview(self.employerNameLine2)
        
        // Address Type
        x1 = 606.0; y1 = 217.0;
        x2 = 839.9; y2 = 249.0;
        self.addressType = ResourceUtil.createPopupButton(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.addressType.target = self.viewContrller;
        self.addressType.action = "itemDidChange:"
        self.addressType.addItemWithTitle("Select address type")
        self.addressType.addItemWithTitle("U.S. Address");
        self.addressType.addItemWithTitle("Canadian Address")
        self.addressType.selectItemAtIndex(1)                   // Start at US address.
        self.containerView.addSubview(self.addressType)
        
        // Address
        x1 = 107.5; y1 = 293.0;
        x2 = 403.5; y2 = 325.0;
        self.address = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.address.delegate = self.viewContrller
        self.containerView.addSubview(self.address)
        
        // City
        x1 = 419.0; y1 = 293.0;
        x2 = 590.0; y2 = 325.0;
        self.city = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.city.delegate = self.viewContrller
        self.containerView.addSubview(self.city)
        
        // State
        x1 = 606.0; y1 = 293.0;
        x2 = 715.0; y2 = 325.0;
        self.state = ResourceUtil.createPopupButton(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.state.target = self.viewContrller;
        self.state.action = "itemDidChange:"
        ResourceUtil.addStatesToPopUpMenu(self.state)
        self.containerView.addSubview(self.state)
        
        // ZIP code
        x1 = 731.0; y1 = 293.0;
        x2 = 839.0; y2 = 325.0;
        self.zipCode = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.zipCode.delegate = self.viewContrller
        self.containerView.addSubview(self.zipCode)
        
        //-----------------------------------------------------------------------------------------------------------
        // Extra fields needed for Query (Boxes 0)
        //-----------------------------------------------------------------------------------------------------------
        
        // Box 0 - Age
        x1 = 481; y1 = 403;
        x2 = 590; y2 = 436;
        self.box0_Age = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box0_Age.delegate = self.viewContrller
        self.containerView.addSubview(self.box0_Age)
        
        
        // Box 0 - Occupation
        x1 = 611; y1 = 403;
        x2 = 844; y2 = 435;
        self.box0_Occupation = ResourceUtil.createPopupButton(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box0_Occupation.target = self.viewContrller;
        self.box0_Occupation.action = "itemDidChange:"
        ResourceUtil.addOccupationsToPopUpMenu(self.box0_Occupation);
        self.containerView.addSubview(self.box0_Occupation)
        
        //-----------------------------------------------------------------------------------------------------------
        // Incoem & taxes withheld (Boxes 1-6)
        //-----------------------------------------------------------------------------------------------------------
        
        // Box 1 - Wages, tips, other
        x1 = 107.5; y1 = 484.5;
        x2 = 465.5; y2 = 516.0;
        self.box1 = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box1.delegate = self.viewContrller
        self.containerView.addSubview(self.box1)
        
        // Box 2 - Federal tax withheld
        x1 = 480.5; y1 = 484.5;
        x2 = 840.0; y2 = 516.0;
        self.box2 = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box2.delegate = self.viewContrller
        self.containerView.addSubview(self.box2)
        
        // Box 3 - Sociel Sec. wages
        x1 = 107.5; y1 = 560.0;
        x2 = 465.5; y2 = 591.5;
        self.box3 = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box3.delegate = self.viewContrller
        self.containerView.addSubview(self.box3)
        
        // Box 4 - Social Sec. tax withheld
        x1 = 480.5; y1 = 560.0;
        x2 = 840.5; y2 = 591.5;
        self.box4 = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2);
        self.box4.delegate = self.viewContrller
        self.containerView.addSubview(self.box4)
        
        // Box 5 - Medicare Wages
        x1 = 107.5; y1 = 636.0;
        x2 = 465.5; y2 = 667.5;
        self.box5 = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box5.delegate = self.viewContrller
        self.containerView.addSubview(self.box5)
        
        // Box 6 - Mdicae tax withheld
        x1 = 480.5; y1 = 636;
        x2 = 840; y2 = 667.5;
        self.box6 = ResourceUtil.createTextField(viewRect, x1:x1, y1:y1, x2:x2, y2:y2)
        self.box6.delegate = self.viewContrller
        self.containerView.addSubview(self.box6)
    }

}