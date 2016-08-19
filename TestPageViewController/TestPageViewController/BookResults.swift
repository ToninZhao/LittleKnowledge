//
//  BookResults.swift
//  TestPageViewController
//
//  Created by ZhaoNing on 16/8/19.
//  Copyright © 2016年 Tonin. All rights reserved.
//

import Foundation
class BookResults {
    var books = [CommonDataModel]()
    
    init(dicts: [NSDictionary]) {
        
        for dict in dicts {
            let imageURL = (dict["images"] as! NSDictionary)["large"] as! String
            let title = dict["title"] as! String
            
            let book = CommonDataModel(imageURL: imageURL, title: title)
            books.append(book)
        }
    }
}