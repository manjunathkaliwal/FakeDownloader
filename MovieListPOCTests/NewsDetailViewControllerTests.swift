//
//  NewsDetailViewControllerTests.swift
//  RestaurantsPOCTests
//
//  Created by Manjunath Kaliwal on 2/23/19.
//  Copyright © 2019 Manjunatha Kaliwal. All rights reserved.
//

import XCTest
@testable import RestaurantsPOC

class RestaurantDetailViewControllerTests: XCTestCase {
     var detailVC: RestaurantDetailViewController!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        detailVC = storyboard.instantiateViewController(withIdentifier: "RestaurantDetailViewController") as? RestaurantDetailViewController
        
        //load view hierarchy
        _ = detailVC.view
        
        XCTAssertNotNil(detailVC.viewDidLoad(), "viewDidLoad method called")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }



}
