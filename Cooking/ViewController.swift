//
//  ViewController.swift
//  Cooking
//
//  Created by Johan Vallejo on 25/10/16.
//  Copyright © 2016 kijho. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    //Se crea el array para las recetas
    var recipes: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)       
        
        
        //Se ingresa la información de las recetas al arreglo
        var recipe = Recipe(name: "Tacos",
                            image: #imageLiteral(resourceName: "Tacos"),
                            time: 20,
                            ingredient: ["Tortilla", "Carne", "Ahogao"],
                            step: ["Preparar la Tortilla", "Poner la carne",])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Goulash",
                            image: #imageLiteral(resourceName: "Goulassh"),
                            time: 30,
                            ingredient: ["Carne", "Salsa Negra", "Verduras"],
                            step: ["Preparar las Verduras", "Revolver con la Carne",])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Pollo",
                            image: #imageLiteral(resourceName: "Pollo"),
                            time: 40,
                            ingredient: ["Pollo", "Cocacola", "Pimienta"],
                            step: ["Se cocina el Pollo", "Se prepara la Salsa",])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Sopa",
                            image: #imageLiteral(resourceName: "Sopa"),
                            time: 10,
                            ingredient: ["Agua", "Pastas", "Verduras"],
                            step: ["Se cocinan las verduras", "Se revuelven con los demas ingredientes",])
        recipes.append(recipe)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Se oculta la barra superior
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //Se oculta el navigation controller cuando se hace Swipe en la pantalla
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }
    
    //MARK: - UITableViewDataSource
    
    //Se divide la tabla en una sola sección
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Se envia la cantidad de elementos que va tener la tabla
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    //Se configura la celda de la tabla
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellId = "RecipeCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RecipeCell
        cell.recipeImage.image = recipe.image
        
        //Borde de las imagenes redondo
        /*cell.recipeImage.layer.cornerRadius = 42.0
        cell.recipeImage.clipsToBounds = true*/
        
        cell.nameRecipe.text = recipe.name
        cell.timeRecipe.text = "\(recipe.time!) min"
        cell.ingredientsRecipe.text = "ingredients: \(recipe.ingredient.count)"
        
        //Marcar como favorito
       /* if recipe.isFavourite {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }*/
        //cell.textLabel?.text = recipe.name
        //cell.imageView?.image = recipe.image
        return cell
    }
    
    //Se genera las opciones desplegadas por medio de hacer swipe en la celda
   /* override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.recipes.remove(at: indexPath.row)
        }
        
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    }*/

    //MARK - UITableViewDelegate

    //Se agregan las opciones de Compartir y Borrar al menú que se despliega al hacer swipe en la celda
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //comparitr
        let shareAction = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
            
            let shareDefaultText = "Estoy mirando la receta de \(self.recipes[indexPath.row].name!) en la App Cooking"
            let activityController = UIActivityViewController(activityItems: [shareDefaultText, self.recipes[indexPath.row].image!], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
            
        }
        
        shareAction.backgroundColor = UIColor(red: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
        //Borrar
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      /*  let recipe = self.recipes[indexPath.row]
        var favouriteActionTitle = "Favorita"
        var favouriteActionStyle = UIAlertActionStyle.default
        
        let alertController = UIAlertController(title: recipe.name , message: "Valora este plato", preferredStyle: .actionSheet)
        let cancelAlert = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAlert)
        
        if recipe.isFavourite {
            favouriteActionTitle = "No Es Favorita"
            favouriteActionStyle = UIAlertActionStyle.destructive
        }
        
        let favouriteAction = UIAlertAction(title: favouriteActionTitle, style: favouriteActionStyle) { (action) in
            let recipe = self.recipes[indexPath.row]
            recipe.isFavourite = !recipe.isFavourite
            self.tableView.reloadData()
        }
        alertController.addAction(favouriteAction)
        self.present(alertController, animated: true, completion: nil)*/
        
    }
    
    //Se prepara y envian la información a la siguiente vista
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "showRecipeDetail" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedRecipe = self.recipes[indexPath.row]
                let detinationViewController = segue.destination as! DetailViewController
                detinationViewController.recipe = selectedRecipe
            }
        }
    }
}

