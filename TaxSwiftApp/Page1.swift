//
//  Page1.swift
//  TaxSwiftApp
//
//  Created by IKKO FUSHIKI on 8/10/15.
//  Copyright (c) 2015 IKKO FUSHIKI. All rights reserved.
//

import Cocoa

class Page1 {
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

    init() {
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
    }
}