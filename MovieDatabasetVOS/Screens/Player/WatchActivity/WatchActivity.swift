//
//  WatchActivity.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-07-30.
//

import Foundation
import GroupActivities

struct WatchActivity: GroupActivity {
    let video: Video
    
    var metadata: GroupActivityMetadata {
        var metadata = GroupActivityMetadata()
        metadata.type = .watchTogether
        metadata.title = video.name
        metadata.supportsContinuationOnTV = true
        return metadata
    }
}
