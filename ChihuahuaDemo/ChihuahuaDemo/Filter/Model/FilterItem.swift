//
//  FilterItem.swift
//  ChihuahuaDemo
//
//  Created by Harry Twan on 2018/12/17.
//  Copyright © 2018 Harry Twan. All rights reserved.
// https://medium.com/@Chien_Cheng/%E7%BF%BB%E8%AD%AF-10%E5%88%86%E9%90%98%E5%AD%B8%E7%BF%92%E5%92%8C%E6%8E%8C%E6%8F%A1iglistkit%E7%9A%84%E5%9F%BA%E7%A4%8E%E7%9F%A5%E8%AD%98-f013faecd26a

import UIKit
import IGListKit
import GPUImage

class FilterItem {
    
    private var identifier: String = UUID().uuidString
    private(set) var name: String
    private(set) var icon: String
    
    init(name: String, icon: String) {
        self.name = name
        self.icon = icon
    }
}

extension FilterItem: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let obj = object as? FilterItem else {
            return false
        }
        return identifier == obj.identifier
    }
}
