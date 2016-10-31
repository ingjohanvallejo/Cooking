//
//  RecipeCell.swift
//  Cooking
//
//  Created by Johan Vallejo on 26/10/16.
//  Copyright © 2016 kijho. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    @IBOutlet var recipeImage: UIImageView!
    @IBOutlet var nameRecipe: UILabel!
    @IBOutlet var timeRecipe: UILabel!
    @IBOutlet var ingredientsRecipe: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
