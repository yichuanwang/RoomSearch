//
//  Draw2DView.swift
//  RoomSearch
//
//  Created by iStig on 16/4/1.
//  Copyright © 2016年 Peartree Developers. All rights reserved.
//

import UIKit

class Draw2DView: UIView {


  override func drawRect(rect: CGRect) {
    let context = UIGraphicsGetCurrentContext()
    CGContextSetLineWidth(context, 2.0)
    CGContextSetStrokeColorWithColor(context,
                                     UIColor.blueColor().CGColor)
    CGContextMoveToPoint(context, 100, 100)
    CGContextAddLineToPoint(context, 110, 110)
    CGContextAddLineToPoint(context, 100, 120)
    CGContextAddLineToPoint(context, 90, 110)
    CGContextAddLineToPoint(context, 100, 100)
    CGContextStrokePath(context)
  }
 

}
