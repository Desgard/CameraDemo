//
//  CatFilterViewController.swift
//  ChihuahuaDemo
//
//  Created by Harry Twan on 2018/12/15.
//  Copyright © 2018 Harry Twan. All rights reserved.
//

import UIKit
import IGListKit

class CatFilterViewController: UIViewController {
    
    lazy private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    lazy private var updater: ListAdapterUpdater = {
        let updater = ListAdapterUpdater()
        return updater
    }()
    
    lazy private var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: updater, viewController: self)
//        adapter.dataSource = self
        adapter.collectionView = collectionView
        return adapter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
