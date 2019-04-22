//
//  NewsCellLandscape.swift
//  CollectionViewLayout
//
//  Created by Tan Christian on 22/04/19.
//  Copyright © 2019 Tan Christian. All rights reserved.
//

import UIKit

class NewsCellLandscape: UICollectionViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsSnippetLabel: UILabel!
    @IBOutlet weak var newsDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
