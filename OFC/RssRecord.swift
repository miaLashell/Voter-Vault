//
//  RssRecord.swift
//  OFC
//
//  Created by Mia Hollins on 5/19/17.
//  Copyright © 2017 Mia Hollins. All rights reserved.
//

import Foundation

class RssRecord {
    var title: String
    var description: String
    var link: String
    var pubDate: String
    
    init(){
        self.title = ""
        self.description = ""
        self.link = ""
        self.pubDate = ""
    }
}
