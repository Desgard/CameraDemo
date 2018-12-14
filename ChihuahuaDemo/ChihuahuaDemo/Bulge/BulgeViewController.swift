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
    
    @IBOutlet weak var effectSlide: UISlider!
    
    lazy private var filter: GPUImageBulgeDistortionFilter = {
        let filter = GPUImageBulgeDistortionFilter()
        filter.scale = 1
        return filter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialViews()
        initialLayouts()
    }
    
    private func initialViews() {
        guard let sourceImage = UIImage(named: "bulge-test") else {
            return
        }
        let process = GPUImagePicture(image: sourceImage)
        process?.addTarget(filter)
        filter.useNextFrameForImageCapture()
        process?.processImage()
        effectImageView.image = filter.imageFromCurrentFramebuffer()
    }
    
    private func initialLayouts() {
        
    }
}
