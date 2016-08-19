//
//  MusicResults.swift
//  TestPageViewController
//
//  Created by ZhaoNing on 16/8/19.
//  Copyright © 2016年 Tonin. All rights reserved.
//

import Foundation
class MusicResults {
    var musics = [CommonDataModel]()
    init(dicts: [NSDictionary]) {
        for dict in dicts {
            let imageURL = dict["image"] as! String
            let title = dict["title"] as! String
            
            let music = CommonDataModel(imageURL: imageURL, title: title)
            musics.append(music)
        }
    }
}