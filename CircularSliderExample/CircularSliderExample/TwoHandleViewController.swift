//
//  TwoHandleViewController.swift
//  CircularSliderExample
//
//  Created by Christopher Olsen on 3/4/16.
//  Copyright © 2016 Christopher Olsen. All rights reserved.
//

import UIKit

class TwoHandleViewController: UIViewController {
  
  @IBOutlet weak var lowerValueLabel: UILabel!
  @IBOutlet weak var upperValueLabel: UILabel!
  @IBOutlet weak var sliderView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // init slider view
    let frame = CGRectMake(0, 0, sliderView.frame.width, sliderView.frame.height)
    let circularSlider = DoubleHandleCircularSlider(frame: frame)
    
    // setup target to watch for value change
    circularSlider.addTarget(self, action: #selector(TwoHandleViewController.valueChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
    
    // setup slider defaults
    // NOTE: sliderMaximumAngle must be set before currentValue and upperCurrentValue
    circularSlider.maximumAngle = 270.0
    circularSlider.unfilledArcLineCap = .Round
    circularSlider.filledArcLineCap = .Round
    circularSlider.currentValue = 10
    circularSlider.upperCurrentValue = 60
    circularSlider.lineWidth = 30
    
    // add to view
    sliderView.addSubview(circularSlider)
    
    // create and set a transform to rotate the arc so the white space is centered at the bottom
    circularSlider.transform = circularSlider.getRotationalTransform()
  }
  
  func valueChanged(slider: DoubleHandleCircularSlider) {
    lowerValueLabel.text = "\(slider.currentValue)"
    upperValueLabel.text = "\(slider.upperCurrentValue)"
  }
}
