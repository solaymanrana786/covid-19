//
//  CountryTableViewCell.swift
//  Covid19
//
//  Created by Solayman Rana on 24/3/20.
//  Copyright © 2020 Solayman Rana. All rights reserved.
//

import UIKit
import Combine

class CountryTableViewCell: UITableViewCell {
private var cancalable3: AnyCancellable?
    @IBOutlet weak var countryName: UILabel!
    
    @IBOutlet weak var death: UILabel!
    @IBOutlet weak var cases: UILabel!
    
    @IBOutlet weak var recover: UILabel!
    
        private var webService = Api()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.cancalable3 = self.webService.fetchData3()
            .catch {_ in Just(RPdata.placeholder) }
            .map {$0.locations?.country }
            .assign(to: \.text, on: self.countryName!)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
