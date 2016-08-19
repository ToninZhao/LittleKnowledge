//
//  MusicController.swift
//  TestPageViewController
//
//  Created by ZhaoNing on 16/8/18.
//  Copyright © 2016年 Tonin. All rights reserved.
//

import UIKit

class MusicController: UIViewController {

    @IBOutlet weak var musicTableView: UITableView!
    var musicResults: MusicResults?
    override func viewDidLoad() {
        super.viewDidLoad()
        musicTableView.registerNib(UINib(nibName: "CommonCell", bundle: nil), forCellReuseIdentifier: "CommonCell")
        musicTableView.dataSource = self
        musicTableView.delegate = self
        
        GetDataFromDouBan.getData("https://api.douban.com/v2/music/search", type: "musics", keyword: "周杰伦") { (data) -> Void in
            self.musicResults = MusicResults(dicts: data)
            self.musicTableView.reloadData()
        }

    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        NSNotificationCenter.defaultCenter().postNotificationName("currentPageChanged", object: 1)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension MusicController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let result = musicResults {
            return result.musics.count
        }
        return 0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let music = musicResults!.musics[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("CommonCell", forIndexPath: indexPath) as! CommonCell
        cell.coverImageView.sd_setImageWithURL(NSURL(string: music.imageURL))
        cell.titleLabel.text = music.title
        return cell
    }

}
extension MusicController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}