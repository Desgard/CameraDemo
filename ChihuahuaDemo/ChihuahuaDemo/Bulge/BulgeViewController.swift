//
//  BulgeViewController.swift
//  ChihuahuaDemo
//
//  Created by Harry Duan on 2018/12/14.
//  Copyright © 2018 Harry Twan. All rights reserved.
//

import UIKit
import GPUImage

class BulgeViewController: UIViewController {
    
    @IBOutlet weak var effectImageView: UIImageView!
    
    @IBOutlet weak var centerXSlide: UISlider!
    @IBOutlet weak var centerYSlide: UISlider!
    @IBOutlet weak var radiusSlide: UISlider!
    @IBOutlet weak var scaleSlide: UISlider!
    
    lazy private var filter: GPUImageBulgeDistortionFilter = {
        let filter = GPUImageBulgeDistortionFilter()
        return filter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialViews()
        initialLayouts()
    }
    
    private func initialViews() {
        centerXSlide.addTarget(self, action: #selector(updateEffect(_:)), for: .valueChanged)
        centerYSlide.addTarget(self, action: #selector(updateEffect(_:)), for: .valueChanged)
        radiusSlide.addTarget(self, action: #selector(updateEffect(_:)), for: .valueChanged)
        scaleSlide.addTarget(self, action: #selector(updateEffect(_:)), for: .valueChanged)
        
        centerXSlide.minimumValue = 0.0
        centerXSlide.maximumValue = 1.0
        centerYSlide.minimumValue = 0.0
        centerYSlide.maximumValue = 1.0
        radiusSlide.minimumValue = -1.0
        radiusSlide.maximumValue = 1.0
        scaleSlide.minimumValue = -1.0
        scaleSlide.maximumValue = 1.0
    }
    
    private func initialLayouts() {
        
    }
    
    @objc
    private func updateEffect(_ slide: UISlider) {
        guard let sourceImage = UIImage(named: "bulge-test") else {
            return
        }
        let process = GPUImagePicture(image: sourceImage)
        
        filter.center = CGPoint(x: CGFloat(centerXSlide.value) ,
                                y: CGFloat(centerYSlide.value))
        filter.radius = CGFloat(radiusSlide.value)
        filter.scale = CGFloat(scaleSlide.value)
        
        process?.addTarget(filter)
        filter.useNextFrameForImageCapture()
        process?.processImage()
        effectImageView.image = filter.imageFromCurrentFramebuffer()
    }
}
