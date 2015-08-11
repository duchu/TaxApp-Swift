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
        halfRect.origin.x = halfRect.size.width/4
        halfRect.size.width /= 2
        halfRect.origin.y = halfRect.size.height/4
        halfRect.size.height /= 2
        
        var graphView = GraphView(frame:halfRect)
//        graphView.wantsLayer = true
        self.containerView.addSubview(graphView)
    }
}