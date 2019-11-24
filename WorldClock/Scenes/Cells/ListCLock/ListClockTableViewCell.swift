//
//  ListClockTableViewCell.swift
//  WorldClock
//
//  Created by Ahmed Yasser on 11/5/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class ListClockTableViewCell: UITableViewCell {

  @IBOutlet weak var clockImage: UIImageView!
  
  @IBOutlet weak var cityLabel: UILabel!
  
  @IBOutlet weak var dayLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
