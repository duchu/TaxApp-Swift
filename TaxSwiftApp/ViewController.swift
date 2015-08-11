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
    @IBOutlet weak var leftArrow: NSButton!
    @IBOutlet weak var rightArrow: NSButton!

    var mainView: NSImageView
    var bgPageName: [String] = ["TurboTax W-2 Page-1", "TurboTax W-2 Page-2", "TurboTax W-2 Page-3"]
    var pageNumber = 0
    var w2FormMgr : W2FormManager
    
    required init?(coder aDecoder: NSCoder) {
        mainView = NSImageView()
        w2FormMgr = W2FormManager.sharedMgr() as! W2FormManager
        super.init(coder: aDecoder)
    }

    override init?(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        self.mainView = NSImageView()
        w2FormMgr = W2FormManager.sharedMgr() as! W2FormManager
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.headerImage.image = ResourceUtil.getImage("TurboTax W-2 Header", type: "png")
        let pageImage: NSImage = ResourceUtil.getImage(bgPageName[self.pageNumber], type:"png")
        let imageSize: CGSize = pageImage.size
        self.mainView.image = pageImage
        self.mainView.setFrameSize(imageSize)
        self.scrollView.documentView = mainView
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func onLeftArrow(sender : AnyObject) {
        // Do any additional setup after loading the view.
        self.pageNumber--;
        if (self.pageNumber < 0) {
            self.pageNumber += 3
        }
        self.pageNumber %= 3;
        let pageImage: NSImage = ResourceUtil.getImage(bgPageName[pageNumber], type:"png")
        let imageSize: CGSize = pageImage.size
        self.mainView.image = pageImage
        self.mainView.setFrameSize(imageSize)
        self.scrollView.documentView = mainView

    }

    @IBAction func onRightArrow(sender : AnyObject) {
        // Do any additional setup after loading the view.
        self.pageNumber++;
        if (self.pageNumber >= 3) {
            self.pageNumber -= 3
        }
        self.pageNumber %= 3;
        let pageImage: NSImage = ResourceUtil.getImage(bgPageName[pageNumber], type:"png")
        let imageSize: CGSize = pageImage.size
        self.mainView.image = pageImage
        self.mainView.setFrameSize(imageSize)
        self.scrollView.documentView = mainView
    }
}

