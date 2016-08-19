//
//  CommonDataModel.swift
//  TestPageViewController
//
//  Created by ZhaoNing on 16/8/19.
//  Copyright © 2016年 Tonin. All rights reserved.
//

import Foundation
struct CommonDataModel {
    var imageURL: String!
    var title: String!
    init(imageURL: String, title: String) {
        self.imageURL = imageURL
        self.title = title
    }
}