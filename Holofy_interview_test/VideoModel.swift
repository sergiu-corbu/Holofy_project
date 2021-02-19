//
//  VideoModel.swift
//  Holofy_interview_test
//
//  Created by Sergiu Corbu on 2/16/21.
//

import Foundation
import SwiftUI
import AVKit

struct VideoM{
    var title: String
    var subtitle: String
    var description: String
    var player: AVPlayer
}

var input = ["description": "HBO GO now works with Chromecast -- the easiest way to enjoy online video on your TV. For when you want to settle into your Iron Throne to watch the latest episodes. For $35.\nLearn how to use Chromecast with HBO GO and more at google.com/chromecast.",
    "sources" : "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    "subtitle" : "By Google",
    "thumb" : "images/ForBiggerBlazes.jpg",
    "title" : "For Bigger Blazes"
]
