//
//  MovieModel.swift
//  MoviesPOC
//
//  Created by Manjunath Kaliwal on 5/15/19.
//  Copyright © 2019 Manjunath Kaliwal. All rights reserved.
//

import Foundation
//[
//    {
//        "movie_title": "Hacksaw Ridge",
//        "movie_year": "2016",
//        "downloaded_size": 13.97,
//        "current_number_of_seeds": 14,
//        "total_number_seeds": 46,
//        "current_number_of_peers": 4,
//        "total_number_peers": 12,
//        "download_speed": "15.5 MB/s",
//        "upload_speed": "784.6 kB/s",
//        "uploaded_size": "13.46 MB",
//        "added_date_time": "08.04.2019/11:45",
//        "upload_status": "In Progress",
//        "status": 0
//    },

class MovieInfo : Codable {
    var movie_title : String?
    var movie_year : String?
    var downloaded_size : Double?
    var current_number_of_seeds : Double?
    var total_number_seeds : Double?
    var current_number_of_peers : Double?
    var total_number_peers : Double?
    var download_speed : String?
    var upload_speed : String?
    var uploaded_size : String?
    var added_date_time : String?
    var upload_status : String?
    var status : Double?
}
