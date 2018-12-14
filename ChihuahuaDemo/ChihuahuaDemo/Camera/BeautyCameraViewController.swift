//
//  BeautyCameraViewController.swift
//  ChihuahuaDemo
//
//  Created by Harry Duan on 2018/12/13.
//  Copyright © 2018 Harry Twan. All rights reserved.
//

import UIKit
import GPUImage
import SnapKit

class BeautyCameraViewController: UIViewController {
    
    lazy private var camera: GPUImageStillCamera = {
        guard let _camera = GPUImageStillCamera(sessionPreset: AVCaptureSession.Preset.hd1920x1080.rawValue, cameraPosition: .front) else {
            return GPUImageStillCamera()
        }
        _camera.horizontallyMirrorFrontFacingCamera = true
        _camera.outputImageOrientation = .portrait
        bilateralFilter.addTarget(brightnessFilter)
        _camera.addTarget(bilateralFilter)
        _camera.addTarget(primaryView)
        return _camera
    }()
    
    lazy private var primaryView: GPUImageView = {
        let view = GPUImageView(frame: self.view.bounds)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }()
    
    // 磨皮滤镜
    lazy private var bilateralFilter: GPUImageBilateralFilter = {
        let filter = GPUImageBilateralFilter()
        filter.distanceNormalizationFactor = 8
        return filter
    }()
    
    // 美白滤镜
    lazy private var brightnessFilter: GPUImageBrightnessFilter = {
        let filter = GPUImageBrightnessFilter()
        filter.brightness = 0.2
        return filter
    }()
    
    // 光饱和
    lazy private var satureationFilter: GPUImageSaturationFilter = {
        let filter = GPUImageSaturationFilter()
        return filter
    }()
    
    private var closeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.tintColor = .white
        button.alpha = 0.7
        button.setImage(UIImage(named: "close"), for: .normal)
        button.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialViews()
        initialLayouts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    private func initialViews() {
        
        view.addSubview(primaryView)
        view.addSubview(closeButton)
        camera.startCapture()
    }
    
    private func initialLayouts() {
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.left.equalToSuperview().offset(40)
            make.width.height.equalTo(20)
        }
    }
    
    @objc
    private func closeAction() {
        navigationController?.popViewController(animated: true)
    }
}
