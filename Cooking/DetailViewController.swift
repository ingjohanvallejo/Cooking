//
//  DetailViewController.swift
//  Cooking
//
//  Created by Johan Vallejo on 27/10/16.
//  Copyright © 2016 kijho. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageRecipeDetail: UIImageView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var ratingButton: UIButton!
    
    var recipe : Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = recipe.name
        self.imageRecipeDetail.image = self.recipe.image
        self.tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.75)
        
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        let image = UIImage(named: self.recipe.rating)
        self.ratingButton.setImage(image, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @IBAction func close(segue: UIStoryboardSegue) {
        
        if let reviewVC = segue.source as? ReviewViewController {
            
            if let rating = reviewVC.ratingSelected {
                self.recipe.rating = rating
                let image = UIImage(named: self.recipe.rating)
                self.ratingButton.setImage(image, for: .normal)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 2
        case 1:
            return self.recipe.ingredient.count
        case 2:
            return self.recipe.step.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRecipeCell", for: indexPath) as! RecipeDetailViewCellTableViewCell
        
        cell.backgroundColor = UIColor.clear
        
        //Configuración de las diferentes celdas según las secciones 
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.keyNameRecipeDetail.text = "Name :"
                cell.nameRecipeDetail.text = self.recipe.name
            case 1:
                cell.keyNameRecipeDetail.text = "Time :"
                cell.nameRecipeDetail.text = "\(self.recipe.time!) Min"
            /*case 2:
                cell.keyNameRecipeDetail.text = "Favourite :"
                if self.recipe.isFavourite {
                    cell.nameRecipeDetail.text = "Si"
                } else {
                    cell.nameRecipeDetail.text = "No"
                }*/
            default:
                break
            }
        case 1:
            if indexPath.row == 0 {
                cell.keyNameRecipeDetail.text = "Ingredients :"
            } else {
                cell.keyNameRecipeDetail.text = " "
            }
            cell.nameRecipeDetail.text = self.recipe.ingredient[indexPath.row]
        case 2:
            if indexPath.row == 0 {
                cell.keyNameRecipeDetail.text = "Steps :"
            } else {
                cell.keyNameRecipeDetail.text = " "
            }
            cell.nameRecipeDetail.text = self.recipe.step[indexPath.row]
        default:
            break
        }
        
        return cell
    }
}

extension DetailViewController : UITableViewDelegate {
    
}
