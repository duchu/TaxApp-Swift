//
//  GraphView.swift
//  TaxSwiftApp
//
//  Created by IKKO FUSHIKI on 8/11/15.
//  Copyright (c) 2015 IKKO FUSHIKI. All rights reserved.
//

import Cocoa

class GraphView : NSView {
    let kMaximumSigma : CGFloat = 8
    var sigma : CGFloat

    override init(frame frameRect: NSRect) {
        self.sigma = 0.0
        super.init(frame:frameRect)
    }
    
    required init?(coder: NSCoder) {
        self.sigma = 0.0
        super.init(coder:coder)
    }
    
    override func drawRect(dirtyRect: NSRect) {
        //
        var bPath:NSBezierPath = NSBezierPath(rect: dirtyRect)
        let fillColor = NSColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
        fillColor.set()
        bPath.fill()
        
        let borderColor = NSColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        borderColor.set()
        bPath.lineWidth = 12.0
        bPath.stroke()
        
        let circleFillColor = NSColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        var circleRect = NSMakeRect(dirtyRect.size.width/4, dirtyRect.size.height/4, dirtyRect.size.width/2, dirtyRect.size.height/2)
        var cPath: NSBezierPath = NSBezierPath(ovalInRect: circleRect)
        circleFillColor.set()
        cPath.fill()
    }
    
    func getXCoordinateFromSigma(sigma: CGFloat) -> CGFloat
    {
        
        let rect = self.bounds;
        let xRange: CGFloat = 2.0*kMaximumSigma
        let dTick : CGFloat = rect.size.width/xRange
    
        let arrowPosition = dTick*(sigma + kMaximumSigma)  // 4.0 is a mid range.
    
        return arrowPosition;
    }
    
    // Create arrow path points.
    func setArraw(inout arrow: [CGPoint], w: CGFloat, h: CGFloat)
    {
        arrow.append(CGPointMake(0.0, 0.0))
        arrow.append(CGPointMake(w, h))
        arrow.append(CGPointMake(w/2, h))
        arrow.append(CGPointMake(arrow[2].x, 3*h))
        arrow.append(CGPointMake(0.0 - arrow[3].x, arrow[3].y))
        arrow.append(CGPointMake(arrow[4].x, arrow[1].y))
        arrow.append(CGPointMake(0.0 - arrow[1].x, arrow[1].y))
        arrow.append(CGPointMake(arrow[0].x, arrow[0].y))
    }
    
    // This calculate the bounding border from sigma1 to sigma2.
    func getBorderRect(inout border: CGRect, sigma1:CGFloat, sigma2:CGFloat)
    {
        let x1 = self.getXCoordinateFromSigma(sigma1)
        let x2 = self.getXCoordinateFromSigma(sigma2)
        let rect = self.bounds;
    
        border.origin.x = x1;
        border.origin.y = 0;
        border.size.width = x2 - x1;
        border.size.height = rect.size.height;
    }
    
    func fillDangerZones(theContext: CGContext!)
    {
        var border: CGRect = CGRect()
        var sigma1: CGFloat, sigma2: CGFloat
    
        // Red Zones
        CGContextSetRGBFillColor(theContext, 1.0, 0.0, 0.0, 0.2)
        sigma1 = 0.0 - 1.0*kMaximumSigma
        sigma2 = 0.0 - 5.0
        self.getBorderRect(&border, sigma1:sigma1, sigma2:sigma2)
    
        CGContextFillRect(theContext, border);
        sigma1 = 5.0;
        sigma2 = 1.0*kMaximumSigma;
        self.getBorderRect(&border, sigma1:sigma1, sigma2:sigma2)
        CGContextFillRect(theContext, border);
    
        // Red Zones
        CGContextSetRGBFillColor(theContext, 1.0, 1.0, 0.0, 0.2);
        sigma1 = 0.0 - 5.0;
        sigma2 = 0.0 - 3.0;
        self.getBorderRect(&border, sigma1:sigma1, sigma2:sigma2)
        CGContextFillRect(theContext, border);
    
        sigma1 = 3.0;
        sigma2 = 5.0;
        self.getBorderRect(&border, sigma1:sigma1, sigma2:sigma2)
        CGContextFillRect(theContext, border);
    }
    
    override func drawLayer(layer: CALayer!, inContext ctx: CGContext!) {
        layer.backgroundColor = CGColorCreateGenericRGB(1.0, 1.0, 1.0, 1.0)
        
        self.fillDangerZones(ctx)
        
        let rect = self.bounds;
        var borderPath: CGMutablePathRef = CGPathCreateMutable();
        
        CGContextSetRGBStrokeColor(ctx, 0.0,0.0,0.0,1.0);
        CGContextSetLineWidth(ctx, 4);
        CGContextStrokeRect(ctx, rect);
        
        // Release the path
//        CFRelease(borderPath);
        
        let n = 100;
        let yFac = rect.size.height*0.8;
        let yBottom = rect.size.height*0.1;
        let xRange = 2.0*kMaximumSigma;
        let dx = rect.size.width/(CGFloat(n) - 1);
        let middle = 0.5*CGFloat(n);
        
        CGContextSetRGBStrokeColor(ctx, 0.2, 0.2, 0.2, 1.0)
        CGContextSetLineWidth(ctx, 2);
        var line : [CGPoint] = Array<CGPoint>()
        let thickLength = rect.size.height*0.05;

        line.append(CGPointMake(0, yBottom))
        line.append(CGPointMake(rect.size.width, yBottom))
        CGContextStrokeLineSegments(ctx, line, 2);
        
        line[1].y = yBottom + thickLength;
        let dTick = rect.size.width/xRange;
        var x :CGFloat = 0;
        let iMax : Int = Int(2*kMaximumSigma)
        
        for (var i = 0; i <= iMax; i++) {
            line[0].x = CGFloat(i)*dTick
            line[1].x = CGFloat(i)*dTick;
            CGContextStrokeLineSegments(ctx, line, 2);
        }
        
        var f: [CGFloat] = Array<CGFloat>()
        var arg: CGFloat
        var val: CGFloat
        
        for (var i :Int = 0; i < n; i++) {
            x = xRange*(1.0*CGFloat(i) - middle)/CGFloat(n);
            arg = 0.0 - x*x/2.0
            val = exp(arg)
            f.append(yFac*val)
        }
        
        // Draw a Gaussian curve.
        CGContextSetRGBStrokeColor(ctx, 0.0,0.0,0.0,1.0);
        CGContextSetLineWidth(ctx, 4);
        
        var thePath : CGMutablePathRef = CGPathCreateMutable();
        CGPathMoveToPoint(thePath, nil, 0.0, f[0] + yBottom);
        
        for (var i:Int = 1; i < n; i++) {
            CGPathAddLineToPoint(thePath, nil, dx*CGFloat(i), f[i] + yBottom);
        }
        
        CGContextBeginPath(ctx);
        CGContextAddPath(ctx, thePath);
        CGContextStrokePath(ctx);
        // Release the path
//        CFRelease(thePath);
        
        // Draw an arrow.
        let arrowPosition = self.getXCoordinateFromSigma(self.sigma)
        var arrowPath: CGMutablePathRef = CGPathCreateMutable();
        
        var arrow: [CGPoint] = Array<CGPoint>()
        let w = rect.size.width*0.02;
        let h = rect.size.height*0.05;
        setArraw(&arrow, w:w, h:h)
        CGPathMoveToPoint(arrowPath, nil, arrow[0].x + arrowPosition, arrow[0].y + yBottom);
        
        for (var i: Int = 1; i < 8; i++) {
            CGPathAddLineToPoint(arrowPath, nil, arrow[i].x + arrowPosition, arrow[i].y + yBottom);
        }
        
        CGContextBeginPath(ctx);
        CGContextAddPath(ctx, arrowPath);
        CGContextSetRGBStrokeColor(ctx, 1.0, 0.0, 0.0, 1.0)
        CGContextSetRGBFillColor(ctx, 1.0, 0.0, 0.0, 1.0)
        CGContextSetLineWidth(ctx, 4)
        
        CGContextFillPath(ctx);
        CGContextStrokePath(ctx);
//        CFRelease(arrowPath);
    }
}