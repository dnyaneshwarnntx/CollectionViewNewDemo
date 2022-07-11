//
//  MyCollectionViewCell.swift
//  CollectionViewDemo
//
//  Created by Dnyaneshwar on 10/07/22.
//

import UIKit
protocol CellDelegate: AnyObject {
    func pinchGestureCallBack(scale: Float,mode:String, cell: UICollectionViewCell)
    func gestureCallBack(isEnded: Bool)

}
class MyCollectionViewCell: UICollectionViewCell {
    weak var delegate: CellDelegate?
    
    @IBOutlet weak var myLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(self.pinch(pinchGesture:)))
        self.contentView.addGestureRecognizer(pinch)
    }
    @objc func pinch(pinchGesture:UIPinchGestureRecognizer) {
        if pinchGesture.state  == .ended{
            delegate!.gestureCallBack(isEnded: true)
            return
        }
        guard pinchGesture.view != nil else {return}
        let pinchScale = round(pinchGesture.scale * 1000) / 1000.0
        delegate!.pinchGestureCallBack(scale: Float(pinchScale), mode: self.mode(pinchGesture),cell:self)
      
    }
    
    func mode(_ sender: UIPinchGestureRecognizer)->String {
        if sender.numberOfTouches < 2 {
            return ""
        }
        let A = sender.location(ofTouch: 0, in: self.contentView)
        let B = sender.location(ofTouch: 1, in: self.contentView)
        let xD = abs( A.x - B.x )
        let yD = abs( A.y - B.y )
        if (xD == 0) { return "V" }
        if (yD == 0) { return "H" }
        let ratio = xD / yD
        if (ratio > 2) { return "H" }
        if (ratio < 0.5) { return "V" }
        return "D"
    }
  
}
