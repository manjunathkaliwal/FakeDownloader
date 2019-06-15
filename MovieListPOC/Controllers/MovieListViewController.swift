//
//  ViewController.swift
//  MoviesPOC
//
//  Created by Manjunath Kaliwal on 5/15/19.
//  Copyright © 2019 Manjunath Kaliwal. All rights reserved.
//

import UIKit
import MapKit

/**
 The purpose of the ViewController is to display the list of Movies near by with title and icon.
 
 /// - Fetch the Data by making API call
 /// - Displaying the data in the TableViewCell like Thumbnail and Title.
 
 */


class MoviesListViewController: UIViewController,UISearchBarDelegate {

    @IBOutlet var listTableView: UITableView!
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    var viewModel: ViewModel?
    var listdataSource = [MovieInfo](){
        didSet {
            self.listTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpUI()
    }

    func setUpUI() {
        
        /// TableView Header title
        //self.title = "Popular Movies"
        
        self.title = "TITLE".localized(withComment: "Screen Title")
        
        /// Registering the customCell with MovieTableViewCell.
        self.listTableView.register(UINib(nibName: String(describing: MovieTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MovieTableViewCell.self))
        
        /// Registering the customCell with HeaderTableViewCell.
        self.listTableView.register(UINib(nibName: String(describing: HeaderTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: HeaderTableViewCell.self))
        
        /// NewsTableViewCell with default height.
        self.listTableView.estimatedRowHeight = 110.0
        
        /// ActivityIndicator start animating to show the info to webservice call.
        loadingIndicator.startAnimating()
        
        /// The ViewModel to make the service call to get the datasource
        self.viewModel = ViewModel()
        /// The Delegate method to get the service response.
        self.viewModel?.viewModelDelegate = self as ViewModelDelegate

    }
}

//MARK:-  UITableView Delegate Methods
extension MoviesListViewController: UITableViewDelegate {
    
    /// This is the description for a method.
    /// Returns: heightForRow.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    /// This get the selected row.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

//MARK:-  UITableView DataSource Methods
extension MoviesListViewController: UITableViewDataSource {
    
    /// Returns: number of sections.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    /// Returns: number of rows.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            return 1
        }else if section == 1{
            if self.listdataSource.count > 0 {
                return (self.listdataSource.count)
            }
        }
        return 0
    }
    
    /// Returns: This method returns the cell informations like duration and risetime.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderTableViewCell.self), for: indexPath) as! HeaderTableViewCell
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MovieTableViewCell.self), for: indexPath) as! MovieTableViewCell
            cell.configureCell(movieinfo: self.listdataSource[indexPath.row])
            return cell
        }
       return UITableViewCell()
        
    }

    
}


//MARK: API Service Request and getting data from the viewModel
extension MoviesListViewController: ViewModelDelegate {
    
    /// This method gets call on successsful response
    /// - Returns: It recieves MoviesList from the response.
    /// - Returns: Failed method gets call on empty MoviesList.
    func didReceiveList() {
        self.loadingIndicator.stopAnimating()
        self.loadingIndicator.hidesWhenStopped = true
        if let getList = self.viewModel?.moviesdata , getList.count > 0{
            self.listdataSource = getList
        }else{
            self.alert(message: "NO_DATA".localized(withComment: "NO_DATA"), title:"APP_NANE".localized(withComment: "APP_NANE"))
        }
    }
    
    /// Base Service Protocols are been implemented based on the error
    func didFailed(){
        self.loadingIndicator.stopAnimating()
        self.loadingIndicator.hidesWhenStopped = true
        self.alert(message: "NO_INTERNET".localized(withComment: "NO_INTERNET"), title:"APP_NANE".localized(withComment: "APP_NANE"))
    }}

extension UIViewController {
    
    func alert(message: String, title: String ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}


