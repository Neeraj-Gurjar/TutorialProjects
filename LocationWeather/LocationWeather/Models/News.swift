//
//  News.swift
//  LocationWeather
//
//  Created by bitcot on 15/07/22.
//

import Foundation

struct News{
    
    var channelName:String
    var channelImg:String
    var channelUrl:String
    
    init(channelName: String, channelImg: String, channelUrl: String) {
        self.channelName = channelName
        self.channelImg = channelImg
        self.channelUrl = channelUrl
    }
}
