//
//  GraphPage.swift
//  TaxSwiftApp
//
//  Created by IKKO FUSHIKI on 8/11/15.
//  Copyright (c) 2015 IKKO FUSHIKI. All rights reserved.
//

import Cocoa

class GraphPage : Page {

    override func addFields()
    {
        // First remove all subviews.
        ResourceUtil.removeAllSubviews(self.containerView)
        
        let viewRect = self.containerView.frame
        var halfRect = viewRect;
        halfRect.origin.x = halfRect.size.width/16
        halfRect.size.width -= halfRect.size.width/8
        halfRect.origin.y = halfRect.size.height/16
        halfRect.size.height -= halfRect.size.height/8
        
        var graphView = GraphView(frame:halfRect)
        graphView.wantsLayer = true
        graphView.sigma = 3.0
        self.containerView.addSubview(graphView)
    }
}