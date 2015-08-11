//
//  AppDelegate.swift
//  TaxSwiftApp
//
//  Created by IKKO FUSHIKI on 8/9/15.
//  Copyright (c) 2015 IKKO FUSHIKI. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate , NSWindowDelegate {
    var sheetOrigin:CGPoint
    
    
    override init() {
        sheetOrigin = CGPoint.zeroPoint
        super.init()
    }

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    // at is the top-left point.
    class func showWarning(message: String, at topLeft:CGPoint)
    {
        let appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.sheetOrigin = topLeft;
        
        let iconImage: NSImage = ResourceUtil.getImage("TurboTax icon", type:"jpeg")
        
        let alert = NSAlert();
        
        alert.addButtonWithTitle("Got it");
        //    [alert addButtonWithTitle:@"Cancel"];
        alert.messageText = "Are you sure?"
        alert.informativeText = message
        alert.alertStyle = NSAlertStyle.WarningAlertStyle
        alert.icon = iconImage;

        let window = NSApplication.sharedApplication().mainWindow
        alert.beginSheetModalForWindow(window!, completionHandler:nil)
        
        // With a completion handler
        /*
        [alert beginSheetModalForWindow:[self.view window] completionHandler:^(NSInteger returnCode)
        {
        switch(returnCode) {
        case NSAlertFirstButtonReturn:
        // "First" pressed
        break;
        case NSAlertSecondButtonReturn:
        // "Second" pressed
        break;
        
        default:
        break;
        }
        }];
        */
        
        // Run as a modal window.
        /*
        if ([alert runModal] == NSAlertFirstButtonReturn) {
        // OK clicked, delete the record
        }
        */
        
    }
    
    // NSWindowDelegate method
    // This is used to place a sheet in a disiered location.
    // The given rect has zero value except for rect.origin.y and rect.size.width
    func window(window: NSWindow, willPositionSheet sheet: NSWindow, usingRect rect: NSRect) -> NSRect {
        var fieldRect = rect;            // Bounds of the window
        let sheetRect = sheet.frame;     // Frame of sheet.

        // Sheet frame is calculated as the sheet center (in x-coordinate as the middle)
        // We need to shift the following value to place the sheet to the left edge of the window.
        let dx = (sheetRect.size.width - rect.size.width)/2  // We need to send this x-shift to make the sheet appear in the right place

        // We need to supply the top left corner of the sheet.
        let x1 = self.sheetOrigin.x
        let y1 = self.sheetOrigin.y

        let x = x1 + dx
        let y = y1

        fieldRect.origin.x = x;
        fieldRect.origin.y = y;
        fieldRect.size.height = 0;
        return fieldRect;
    }
}

