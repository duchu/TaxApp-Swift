//
//  BackgroundView.swift
//  TaxSwiftApp
//
//  Created by IKKO FUSHIKI on 8/11/15.
//  Copyright (c) 2015 IKKO FUSHIKI. All rights reserved.
//

import Cocoa

class BackgroundView : NSImageView {

    // The purpose of this call is unfocus text fields when the mouse is clicked outside of text fields.
    override func mouseDown(theEvent: NSEvent) {
        let window = NSApplication.sharedApplication().mainWindow
        window?.makeFirstResponder(self)
    }
}
