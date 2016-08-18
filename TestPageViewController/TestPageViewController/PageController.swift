//
//  PageController.swift
//  TestPageViewController
//
//  Created by ZhaoNing on 16/8/18.
//  Copyright © 2016年 Tonin. All rights reserved.
//

import UIKit

class PageController: UIPageViewController {

    var pageViewController : UIPageViewController!
    var movieController : MovieController!
    var musicController : MusicController!
    var bookController : BookController!
    override func viewDidLoad() {
        super.viewDidLoad()

        pageViewController = self.childViewControllers.first as! UIPageViewController
        movieController = storyboard?.instantiateViewControllerWithIdentifier("MovieController") as! MovieController
        musicController = storyboard?.instantiateViewControllerWithIdentifier("MusicController") as! MusicController
        bookController = storyboard?.instantiateViewControllerWithIdentifier("BookController") as! BookController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension PageController: UIPageViewControllerDataSource {
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(MovieController) {
            return bookController
        }
    }
}