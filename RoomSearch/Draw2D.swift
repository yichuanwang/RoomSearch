//
//  Draw2D.swift
//  RoomSearch
//
//  Created by Yichuan Wang on 3/30/16.
//  Copyright © 2016 Peartree Developers. All rights reserved.
//

import UIKit

class Draw2D: DetailViewController {
  let drawView:Draw2DView = Draw2DView();
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    drawView.frame = CGRectMake(100,100,200,200)
    drawView.backgroundColor = UIColor.clearColor()
    self.view .addSubview(drawView)
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
//    func drawRect(rect: CGRect)
//    {
//        let context = UIGraphicsGetCurrentContext()
//        CGContextSetLineWidth(context, 2.0)
//        CGContextSetStrokeColorWithColor(context,
//                                         UIColor.blueColor().CGColor)
//        CGContextMoveToPoint(context, 100, 100)
//        CGContextAddLineToPoint(context, 150, 150)
//        CGContextAddLineToPoint(context, 100, 200)
//        CGContextAddLineToPoint(context, 50, 150)
//        CGContextAddLineToPoint(context, 100, 100)
//        CGContextStrokePath(context)
//    }
}
