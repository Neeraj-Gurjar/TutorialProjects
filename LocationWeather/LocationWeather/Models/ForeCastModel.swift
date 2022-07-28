//
//  ForeCastModel.swift
//  LocationWeather
//
//  Created by bitcot on 11/07/22.
//

import Foundation
import ObjectMapper

struct ForCastModel:Mappable{
    var lat: Double?
    var lon:Double?
    var timezone:String?
    var timezone_offset: Double?
    var current:Current?
    var hourly:[Hourly]?
    var daily:[Daily]?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        lat <- map["lat"]
        lon <- map["lon"]
        timezone <- map["timezone"]
        timezone_offset <- map["timezone_offset"]
        current <- map["current"]
        hourly <- map["Hourly"]
        daily <- map["daily"]
        
    }
}

struct Current:Mappable {
    var dt: Int?
    var sunrise:Int?
    var sunset: Int?
    var temp : Double?
    var feels_like: Double?
    var pressure: Double?
    var humidity: Double?
    var dew_point: Double?
    var uvi: Double?
    var clouds: Int?
    var visibility: Int?
    var wind_speed: Double?
    var wind_deg: Double?
    var weather:[Weather]?
    
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        dt <- map["dt"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
        temp <- map["temp"]
        feels_like <- map["feels_like"]
        pressure <- map["pressure"]
        humidity <- map["humidity"]
        dew_point <- map["dew_point"]
        uvi <- map["uvi"]
        clouds <- map["clouds"]
        visibility <- map["visibility"]
        wind_speed <- map["wind_speed"]
        wind_deg <- map["wind_deg"]
        weather <- map["weather"]
    }
    
}

struct Hourly:Mappable{
    var dt: Int?
    var temp: Double?
    var feels_like: Double?
    var pressure: Double?
    var humidity: Double?
    var dew_point: Double?
    var uvi: Int?
    var clouds: Int?
    var visibility: Int?
    var wind_speed: Double?
    var wind_deg: Double?
    var wind_gust: Double?
    var weather :[Weather]?
    var pop:Int?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        dt <- map["dt"]
        temp <- map["temp"]
        feels_like <- map["feels_like"]
        pressure <- map["pressure"]
        humidity <- map["humidity"]
        dew_point <- map["dew_point"]
        uvi <- map["uvi"]
        clouds <- map["clouds"]
        visibility <- map["visibility"]
        wind_speed <- map["wind_speed"]
        wind_deg <- map["wind_deg"]
        wind_gust <- map["wind_gust"]
        weather <- map["weather"]
        pop <- map["pop"]
    }
}
struct Daily:Mappable{
    var dt: Double?
    var sunrise: Int?
    var sunset: Int?
    var moonrise: Int?
    var moonset: Int?
    var moon_phase: Double?
    var temp:Temp?
    var feels_like:Feels_like?
    var pressure:Double?
    var humidity: Double?
    var dew_point: Double?
    var wind_speed: Double?
    var wind_deg: Double?
    var wind_gust: Double?
    var weather:[Weather]?
    var clouds: Int?
    var pop: Int?
    var uvi: Double?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        dt <- map["dt"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
        moonrise <- map["moonrise"]
        moonset <- map["moonset"]
        moon_phase <- map["moon_phase"]
        temp <- map["temp"]
        feels_like <- map["feels_like"]
        pressure <- map["pressure"]
        humidity <- map["humidity"]
        dew_point <- map["dew_point"]
        wind_speed <- map["wind_speed"]
        wind_deg <- map["wind_deg"]
        wind_gust <- map["wind_gust"]
        weather <- map["weather"]
        clouds <- map["clouds"]
        pop <- map["pop"]
        uvi <- map["uvi"]
    }
}

struct Temp:Mappable {
    var day: Double?
    var min:Double?
    var max:Double?
    var night:Double?
    var eve: Double?
    var morn:Double?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        day <- map["day"]
        min <- map["min"]
        max <- map["max"]
        night <- map["night"]
        eve <- map["eve"]
        morn <- map["morn"]
    }
}

struct Feels_like:Mappable {
    var day: Double?
    var night: Double?
    var eve: Double?
    var morn: Double?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        day <- map["day"]
        night <- map["night"]
        eve <- map["eve"]
        morn <- map["morn"]
    }
}

