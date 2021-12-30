//
//  FavoriteViewController.swift
//  myHamburgare
//
//  Created by Alvar Arias on 2021-12-30.
//

import UIKit
import RealmSwift

class FavoriteViewController: UITableViewController {

    override func viewDidLoad() {
    
        super.viewDidLoad()
    }

    // actualiza tableView al volver al View controller
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL)
        // leer en BD
        let result = realm.objects(theHamburg.self)
      
        return result.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellFavorit", for: indexPath)
        let realm = try! Realm()
        let result = realm.objects(theHamburg.self)
        cell.textLabel?.text = result[indexPath.row].myName

        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let realm = try! Realm()
            let result = realm.objects(theHamburg.self)
        
            try! realm.write {
                realm.delete(result[indexPath.row])
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if let vc = storyboard?.instantiateViewController(withIdentifier: "DescritionViewController") as? DescritionViewController {
            
            
             let realm = try! Realm()
             let result = realm.objects(theHamburg.self)
             
            vc.detailHamburgName = result[indexPath.row].myName!
            vc.detailHamburgText = result[indexPath.row].myDescription!
            vc.calorias = result[indexPath.row].myCalories!
            vc.tiempo = result[indexPath.row].myTime!
            vc.listIngredients = result[indexPath.row].myIngredients!
            vc.preparations = result[indexPath.row].myPreparation!
            vc.urlSelectedImag = result[indexPath.row].myImage!
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
