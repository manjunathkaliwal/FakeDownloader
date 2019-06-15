//
//  ViewModel.swift
//  MoviesPOC
//
//  Created by Manjunath Kaliwal on 5/15/19.
//  Copyright © 2019 Manjunath Kaliwal. All rights reserved.
//

import UIKit
import Foundation

/**
 The purpose of the `ViewModelDelegate` is to pass the data via delegate.
 - didReceiveNews acts as delegate on success response
 - didFailed acts as the delegate error response.
 */
protocol ViewModelDelegate: class {
    func didReceiveList()
    func didFailed()
}


class ViewModel: NSObject {
    
    weak var viewModelDelegate:ViewModelDelegate?
    var moviesdata = [MovieInfo](){
        didSet{
            viewModelDelegate?.didReceiveList()
        }
    }

    ///  Initialization for the view model to be setup
    override init() {
        super.init()
        
        ///Get the NewsData from the service api.
        WebServiceManager.sharedInstance.getData({ [unowned self] (response : [MovieInfo])  in
            self.moviesdata = response
            
        }) { (error) in
            self.viewModelDelegate?.didFailed()
        }
    }
}
