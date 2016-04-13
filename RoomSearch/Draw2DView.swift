//
//  Draw2DView.swift
//  RoomSearch
//

import UIKit

class Draw2DView: UIView {


  override func drawRect(rect: CGRect) {
    print(long)
    print(lat)
    

   // let s: NSString = "You Are Here"
    // set the text color to dark gray
    let fieldColor: UIColor = UIColor.darkGrayColor()
    
    // set the font to Helvetica Neue 18
    let fieldFont = UIFont(name: "Helvetica Neue", size: 8)
    
    // set the line spacing to 6
    let paraStyle = NSMutableParagraphStyle()
    paraStyle.lineSpacing = 2.0
    
    // set the Obliqueness to 0.1
    let skew = 0.1
    
    let attributes: NSDictionary = [
        NSForegroundColorAttributeName: fieldColor,
        NSParagraphStyleAttributeName: paraStyle,
        NSObliquenessAttributeName: skew,
        NSFontAttributeName: fieldFont!
    ]
    /*
    let context = UIGraphicsGetCurrentContext()
    CGContextSetLineWidth(context, 2.0)
    CGContextSetStrokeColorWithColor(context,
                                     UIColor.blueColor().CGColor)
    CGContextMoveToPoint(context, CGFloat(lat), CGFloat(long))
    CGContextAddLineToPoint(context, CGFloat(lat) + 20.0, CGFloat(long) + 20.0)
    CGContextAddLineToPoint(context, CGFloat(lat), CGFloat(long) + 40.0)
    CGContextAddLineToPoint(context, CGFloat(lat) - 20.0, CGFloat(long) + 20.0)
    CGContextAddLineToPoint(context, CGFloat(lat), CGFloat(long))
    CGContextStrokePath(context)
    */
    //s.drawInRect(CGRectMake(CGFloat(lat) - 10.0, CGFloat(long) + 9.0, 40.0, 40.0), withAttributes: attributes as! [String : AnyObject])
    
  }
 
    func drawText(context: CGContextRef, text: NSString, attributes: [String: AnyObject], x: CGFloat, y: CGFloat) -> CGSize {
        let font = attributes[NSFontAttributeName] as! UIFont
        let attributedString = NSAttributedString(string: text as String, attributes: attributes)
        
        let textSize = text.sizeWithAttributes(attributes)
        
        // y: Add font.descender (its a negative value) to align the text at the baseline
        let textPath    = CGPathCreateWithRect(CGRect(x: x, y: y + font.descender, width: ceil(textSize.width), height: ceil(textSize.height)), nil)
        let frameSetter = CTFramesetterCreateWithAttributedString(attributedString)
        let frame       = CTFramesetterCreateFrame(frameSetter, CFRange(location: 0, length: attributedString.length), textPath, nil)
        
        CTFrameDraw(frame, context)
        
        return textSize
    }
    
    
    
}
