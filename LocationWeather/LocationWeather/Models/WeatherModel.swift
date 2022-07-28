//
//  Model.swift
//  LocationWeather
//
//  Created by bitcot on 11/07/22.
//

import Foundation
import ObjectMapper

struct WeatherModel:Mappable{
    var coord:Coord?
    var weather:[Weather]?
    var base:String?
    var main:Main?
    var visibility:Double?
    var wind:Wind?
    var cloud:Clouds?
    var dt:Double?
    var sys:Sys?
    var timezone:Int?
    var id:Int?
    var name:String?
    var cod:Int?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        coord <- map["coord"]
        weather <- map["weather"]
        base <- map["base"]
        main <- map["main"]
        visibility <- map["visibility"]
        wind <- map["wind"]
        cloud <- map["cloud"]
        dt <- map["dt"]
        sys <- map["sys"]
        timezone <- map["timezone"]
        id <- map["id"]
        name <- map["name"]
        cod <- map["cod"]
    }
}

struct Coord:Mappable{
    var lon:Double?
    var lat:Double?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        lat <- map["lat"]
        lon <- map["lon"]
    }
}

struct Weather:Mappable{
    var id:Int?
    var main:String?
    var description: String?
    var icon: String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        main <- map["main"]
        description <- map["description"]
        icon <- map["icon"]
    }
}

struct Main:Mappable {
    var temp:Double?
    var feels_like:Double?
    var temp_min:Double?
    var temp_max:Double?
    var pressure:Double?
    var humidity:Double?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        temp <- map["temp"]
        feels_like <- map["feels_like"]
        temp_min <- map["temp_min"]
        temp_max <- map["temp_max"]
        pressure <- map["pressure"]
        humidity <- map["humidity"]
    }
}

struct Wind:Mappable {
    var speed:Double?
    var deg:Double?
    var gust:Double?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        speed <- map["speed"]
        deg <- map["deg"]
        gust <- map["gust"]
    }
}

struct Clouds:Mappable {
    var all:Double?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        all <- map["all"]
    }
}

struct Sys:Mappable {
    var type:Int?
    var id:Int?
    var country:String?
    var sunrise: Double?
    var sunset: Int?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        type <- map["type"]
        id <- map["id"]
        country <- map["country"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
    }
}
