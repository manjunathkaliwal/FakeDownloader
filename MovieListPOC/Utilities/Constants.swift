//
//  Constants.swift
//  MoviesPOC
//
//  Created by Manjunath Kaliwal on 5/15/19.
//  Copyright © 2019 Manjunath Kaliwal. All rights reserved.
//

import Foundation

/// Constants to set the request timeout during service call.
public struct Constants {
    public static let kRequestTimeOut = 30
}
struct DetailView{
    static let PlaceholderImageName = "Placeholder"
}
/// The purpose of the `ServiceUrl` is identify the type of the service URL being used for services
/// - Parameter: BaseURL Contains the base url
/// - Parameter: passTimes url
struct ServiceUrl {
    static let BaseURL = "https://fakedownloader.getsandbox.com/"
    static let getMoviesURL = "getdownloadstatus"
}

