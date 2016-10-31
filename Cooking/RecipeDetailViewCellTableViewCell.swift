//
//  RecipeDetailViewCellTableViewCell.swift
//  Cooking
//
//  Created by Johan Vallejo on 27/10/16.
//  Copyright © 2016 kijho. All rights reserved.
//

import UIKit

class RecipeDetailViewCellTableViewCell: UITableViewCell {

    @IBOutlet var keyNameRecipeDetail: UILabel!
    @IBOutlet var nameRecipeDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
