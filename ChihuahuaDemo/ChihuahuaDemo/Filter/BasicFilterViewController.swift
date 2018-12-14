//
//  ViewController.swift
//  ChihuahuaDemo
//
//  Created by Harry Twan on 2018/12/12.
//  Copyright © 2018 Harry Twan. All rights reserved.
//

import UIKit
import GPUImage

class BasicFilterViewController: UIViewController {
    
    var filters: [GPUImageFilter] = [
        GPUImageSepiaFilter(),
        GPUImageToonFilter(),
        GPUImageEmbossFilter(),
        GPUImageGammaFilter(),
        GPUImageKuwaharaFilter(),
        GPUImageCrosshatchFilter(),
        GPUImageVignetteFilter(),
        GPUImageBulgeDistortionFilter(),
    ]
    var filterNames: [String] = [
        "Sepia Filter 褐色",
        "Toon Filter 卡通",
        "Emboss Filter 浮雕效果",
        "Gamma Filter 伽马线",
        "Kuwahara Filter 桑原(Kuwahara)滤波",
        "Crosshatch Filter 交叉线阴影",
        "Vignette Filter 晕影",
        "Bulge Distortion 鱼眼",
    ]
    var index: Int = 0
    
    @IBOutlet weak var originImageView: UIImageView!
    @IBOutlet weak var testImageView: UIImageView!
    @IBOutlet weak var filterEffect: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialViews()
    }
    
    private func initialViews() {
        originImageView.layer.masksToBounds = true
        originImageView.layer.cornerRadius = 4
        testImageView.layer.masksToBounds = true
        testImageView.layer.cornerRadius = 4
        
        next()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        next()
    }
    
    private func next() {
        index += 1
        index %= filters.count
        testImageView.image = process()
        filterEffect.text = filterNames[index]
    }
    

    private func process() -> UIImage? {
        guard let sourceImage = UIImage(named: "test-1") else {
            return UIImage()
        }
        
        let process = GPUImagePicture(image: sourceImage)
        let filter = filters[index % filters.count]
        process?.addTarget(filter)
        
        filter.useNextFrameForImageCapture()
        process?.processImage()
        
        return filter.imageFromCurrentFramebuffer()
    }
}

