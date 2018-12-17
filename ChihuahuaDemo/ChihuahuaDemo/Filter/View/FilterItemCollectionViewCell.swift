//
//  FilterItemCollectionViewCell.swift
//  ChihuahuaDemo
//
//  Created by Harry Twan on 2018/12/17.
//  Copyright © 2018 Harry Twan. All rights reserved.
//

import UIKit
import IGListKit

class FilterItemCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class FilterItemColelctionViewCellModel: NSObject {
    
}

//extension FilterItemColelctionViewCellModel: ListAdapterDataSource {
//    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
//        <#code#>
//    }
//
//    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
//        <#code#>
//    }
//
//    func emptyView(for listAdapter: ListAdapter) -> UIView? {
//        <#code#>
//    }
//
//
//}
