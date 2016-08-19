//
//  BookController.swift
//  TestPageViewController
//
//  Created by ZhaoNing on 16/8/18.
//  Copyright © 2016年 Tonin. All rights reserved.
//

import UIKit

class BookController: UIViewController {

    @IBOutlet weak var bookTableView: UITableView!
    var bookResults: BookResults?
    override func viewDidLoad() {
        super.viewDidLoad()
        bookTableView.registerNib(UINib(nibName: "CommonCell", bundle: nil), forCellReuseIdentifier: "CommonCell")
        bookTableView.dataSource = self
        bookTableView.delegate = self
        
        GetDataFromDouBan.getData("https://api.douban.com/v2/book/search", type: "books", keyword: "韩寒") { (data) -> Void in
            self.bookResults = BookResults(dicts: data)
            self.bookTableView.reloadData()
        }
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        NSNotificationCenter.defaultCenter().postNotificationName("currentPageChanged", object: 2)
    }

}
extension BookController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let result = bookResults {
            return result.books.count
        }
        return 0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let book = bookResults!.books[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("CommonCell", forIndexPath: indexPath) as! CommonCell
        cell.coverImageView.sd_setImageWithURL(NSURL(string: book.imageURL))
        cell.titleLabel.text = book.title
        return cell
    }
    
}
extension BookController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}