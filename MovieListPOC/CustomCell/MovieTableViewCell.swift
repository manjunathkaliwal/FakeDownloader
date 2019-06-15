//
//  MovieTableViewCell
//  MoviesPOC
//
//  Created by Manjunath Kaliwal on 5/15/19.
//  Copyright © 2019 Manjunath Kaliwal. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet var thumbImageView: UIImageView?
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var seedsLabel: UILabel!
    @IBOutlet weak var peerLabel: UILabel!
    @IBOutlet weak var dspeed: UILabel!
    @IBOutlet weak var uSpeeds: UILabel!
    @IBOutlet weak var uploaded: UILabel!
    @IBOutlet weak var added: UILabel!
    @IBOutlet weak var status: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
   
    func configureCell(movieinfo: MovieInfo){
        
        if let status  = movieinfo.status {
            if status == 0 {
             thumbImageView?.image = UIImage(named: "download")
            }else if status == 1{
                thumbImageView?.image = UIImage(named: "upload")
            }
            else if status == 2{
                thumbImageView?.image = UIImage(named: "pause")
            }
        }
        
        if let title = movieinfo.movie_title , let year = movieinfo.movie_year{
            titleLabel?.text = title + "(\(year))"
        }
        
        if let Dsize = movieinfo.downloaded_size , let cseeds = movieinfo.current_number_of_seeds , let totalSeeds = movieinfo.total_number_seeds, let currentpeers = movieinfo.current_number_of_peers, let totalpeers = movieinfo.current_number_of_peers , let dSpeed = movieinfo.download_speed , let uSpeed = movieinfo.upload_speed , let uploadedSize = movieinfo.uploaded_size , let addedDate = movieinfo.added_date_time , let uploadStatus = movieinfo.upload_status
            {
                sizeLabel.text = "\(Dsize)"
                seedsLabel.text = "\(cseeds) of \(totalSeeds)"
                peerLabel.text = "\(currentpeers) of \(totalpeers)"
                dspeed.text = dSpeed
                uSpeeds.text = uSpeed
                uploaded.text = uploadedSize
                added.text = addedDate
                status.text = uploadStatus
        }
        
    }
}

