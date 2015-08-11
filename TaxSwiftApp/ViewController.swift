//
//  ViewController.swift
//  TaxSwiftApp
//
//  Created by IKKO FUSHIKI on 8/9/15.
//  Copyright (c) 2015 IKKO FUSHIKI. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTextFieldDelegate {

    @IBOutlet weak var headerImage: NSImageView!
    @IBOutlet weak var scrollView: NSScrollView!
    @IBOutlet weak var leftArrow: NSButton!
    @IBOutlet weak var rightArrow: NSButton!

    var mainView: BackgroundView
    var bgPageName: [String] = ["TurboTax W-2 Page-1", "TurboTax W-2 Page-2", "TurboTax W-2 Page-3"]
    var pageNumber = 0
    var w2FormMgr : W2FormManager
    
    required init?(coder aDecoder: NSCoder) {
        mainView = BackgroundView()
        w2FormMgr = W2FormManager.sharedMgr() as! W2FormManager
        super.init(coder: aDecoder)
    }

    override init?(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        self.mainView = BackgroundView()
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
        loadPage()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func loadPage()
    {
        if  (pageNumber == 0) {
            var page1 = Page1(view: self.mainView, viewController: self)
            page1.addFields()
        }
        else {
            ResourceUtil.removeAllSubviews(self.mainView)
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
        loadPage()
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
        loadPage()
    }

    @IBAction func itemDidChange(sender : AnyObject) {
    
    }
    
    // controlTextDidEndEditing is called when the focus is changed from the current field to an other field or
    // the user clicked outside of any controls.
    override func controlTextDidEndEditing(obj: NSNotification) {
        //
    }
    
    // controlTextDidChange message will be called when a string is changed even during typing.
    override func controlTextDidChange(obj: NSNotification) {
        //
    }
    
    override func controlTextDidBeginEditing(obj: NSNotification) {
        //
    }
}

