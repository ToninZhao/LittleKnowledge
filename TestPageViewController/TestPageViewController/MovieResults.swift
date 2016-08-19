//
//  MovieResults.swift
//  TestPageViewController
//
//  Created by ZhaoNing on 16/8/19.
//  Copyright © 2016年 Tonin. All rights reserved.
//

import Foundation
class MovieResults {
    var movies = [CommonDataModel]()
    init(dicts: [NSDictionary]) {
        for dict in dicts {
            let imageURL = (dict["images"] as! NSDictionary)["large"] as! String
            let title = dict["title"] as! String
            let movie = CommonDataModel(imageURL: imageURL, title: title)
            movies.append(movie)
        }
    }
}
