//
//  ViewController.swift
//  ChihuahuaDemo
//
//  Created by Harry Twan on 2018/12/12.
//  Copyright © 2018 Harry Twan. All rights reserved.
//

import UIKit
import GPUImage

class ViewController: UIViewController {
    
    var filters: [GPUImageFilter] = []
    var index: Int = 0
    
    @IBOutlet weak var testImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialViews()
    }
    
    private func initialViews() {
        testImageView.center = view.center
        
        filters.append(GPUImageSepiaFilter())
        filters.append(GPUImageToonFilter())
        filters.append(GPUImageEmbossFilter())
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        index += 1
        index %= filters.count
        testImageView.image = process()
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

