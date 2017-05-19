//
//  ViewController.swift
//  OFC
//
//  Created by Mia Hollins on 5/17/17.
//  Copyright © 2017 Mia Hollins. All rights reserved.
//

import UIKit
import FeedKit

let feedURL = URL(string: "http://rss.cnn.com/rss/cnn_allpolitics.rss")!

class ViewController: UIViewController, UITableViewDataSource {
    
    var feed: RSSFeed?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Local Political News"
        
        FeedParser(URL: feedURL)!.parseAsync { (result) in
            self.feed = result.rssFeed
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 3
        case 1: return self.feed?.items?.count ?? 0
        default: fatalError()
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell") as! ArticleCell
        
        guard let layout = TableViewLayout(indexPath: indexPath) else {fatalError() }
        switch layout {
        case .title:  cell.textLabel?.text = self.feed?.title ?? "[no title]"
        case .link:   cell.textLabel?.text = self.feed?.link ?? "[no link]"
        case .description: cell.textLabel?.text = self.feed?.description ?? "[no description]"
        case .items:  cell.textLabel?.text = self.feed?.items?[indexPath.row].title ?? "[no title]"
        }
        
        return cell
    }
}
