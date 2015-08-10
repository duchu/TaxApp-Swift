//
//  ViewController.swift
//  TaxSwiftApp
//
//  Created by IKKO FUSHIKI on 8/9/15.
//  Copyright (c) 2015 IKKO FUSHIKI. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var headerImage: NSImageView!
    @IBOutlet weak var scrollView: NSScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let util:ResourceUtil = ResourceUtil()
        headerImage.image = util.getImage("TurboTax W-2 Header", type: "png")
        let mainView: NSImageView = NSImageView()
        let pageImage: NSImage = util.getImage("TurboTax W-2 Page-1", type:"png")
        let imageSize: CGSize = pageImage.size
        mainView.image = pageImage
        mainView.setFrameSize(imageSize)
        scrollView.documentView = mainView
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

