//
//  PageController.swift
//  TestPageViewController
//
//  Created by ZhaoNing on 16/8/18.
//  Copyright © 2016年 Tonin. All rights reserved.
//

import UIKit

class PageController: UIViewController {

    @IBOutlet weak var sliderView: UIView!
    var flagView: UIView!
    var pageViewController : UIPageViewController!
    var movieController : MovieController!
    var musicController : MusicController!
    var bookController : BookController!
    var controllers = [UIViewController]()
    var lastPage: Int = 0
    var currentPage: Int = 0 {
        didSet {
            let offset = self.view.frame.width / 3.0 * CGFloat(currentPage)
            UIView.animateWithDuration(0.3) { () -> Void in
                self.flagView.frame = CGRectMake(offset, 0, self.view.frame.width / 3.0, 1)
                if self.currentPage > self.lastPage {
                    self.pageViewController.setViewControllers([self.controllers[self.currentPage]], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
                } else {
                    self.pageViewController.setViewControllers([self.controllers[self.currentPage]], direction: .Reverse, animated: true, completion: nil)
                }
            }
            lastPage = currentPage
        }
    }
    func currentPageChanged(notification: NSNotification) -> Void {
        currentPage = notification.object as! Int
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "PageViewController"
        
        self.flagView = UIView(frame: CGRectMake(0, 0, self.view.frame.width / 3.0, 1))
        self.flagView.backgroundColor = UIColor.redColor()
        self.sliderView.addSubview(flagView)
        

        
        pageViewController = self.childViewControllers.first as! UIPageViewController
        pageViewController.dataSource = self
        
        movieController = storyboard?.instantiateViewControllerWithIdentifier("MovieController") as! MovieController
        musicController = storyboard?.instantiateViewControllerWithIdentifier("MusicController") as! MusicController
        bookController = storyboard?.instantiateViewControllerWithIdentifier("BookController") as! BookController
        
        controllers.append(movieController)
        controllers.append(musicController)
        controllers.append(bookController)
        
        pageViewController .setViewControllers([movieController], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(PageController.currentPageChanged), name:  "currentPageChanged", object: nil)
    }
    @IBAction func changeCurrentPage(sender: UIButton) {
        currentPage = sender.tag - 100
    }
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}
extension PageController: UIPageViewControllerDataSource {
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(MovieController) {
            return musicController
        }
        if viewController.isKindOfClass(MusicController) {
            return bookController
        }
        return nil
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(MusicController) {
            return movieController
        }
        if viewController.isKindOfClass(BookController) {
            return musicController
        }
        return nil
    }
}