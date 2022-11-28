//
//  AppSlider.swift
//  TheBeats
//
//  Created by mac 2019 on 8/30/22.
//

import Foundation
import UIKit

class AppSlider: UISlider {
  
  //To set line height value from IB, here ten is default value
    public var trackLineHeight: CGFloat = 10.s
  
  //To set custom size of track so here override trackRect function of slider control
  override func trackRect(forBounds bound: CGRect) -> CGRect {
    //Here, set track frame
    return CGRect(origin: bound.origin, size: CGSize(width: bound.width, height: trackLineHeight))
  }
}
