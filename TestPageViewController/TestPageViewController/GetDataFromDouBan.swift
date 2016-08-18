//
//  GetDataFromDouBan.swift
//  TestPageViewController
//
//  Created by ZhaoNing on 16/8/18.
//  Copyright © 2016年 Tonin. All rights reserved.
//

import Foundation
import Alamofire
class GetDataFromDouBan {
    static func getData(dataURL: String, type: String, keyword: String, completedHandle: (data: [NSDictionary]) -> Void) {
        Alamofire.request(.GET, dataURL, parameters: ["q": keyword, "count" : "10"], encoding: ParameterEncoding.URL, headers: nil).responseJSON { (response : Response<AnyObject, NSError>) -> Void in
            if let result = response.result.value {
                if let data = result[type] as? [NSDictionary] {
                    NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                        completedHandle(data : data)
                    })
                }
            }
        }
    };
}


