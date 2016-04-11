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
    //drawView.frame = CGRectMake(0,0,200,200)
    //drawView.backgroundColor = UIColor.clearColor()
    let circlePath = UIBezierPath(arcCenter: CGPoint(x: CGFloat(lat),y: CGFloat(long)), radius: CGFloat(10), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = circlePath.CGPath
    shapeLayer.fillColor = UIColor.redColor().CGColor
    shapeLayer.strokeColor = UIColor.redColor().CGColor
    shapeLayer.lineWidth = 3.0
    view.layer.addSublayer(shapeLayer)
    self.view .addSubview(drawView)
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  

//class Draw2D: UIView {
    
 //   drawView.frame = self.view.bounds
  //  swlf.view.addSubview(drawView)


    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    }

