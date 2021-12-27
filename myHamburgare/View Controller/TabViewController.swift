//
//  TabViewController.swift
//  myHamburgare
//
//  Created by Alvar Arias on 2021-12-17.
//

import UIKit


class TabViewController: UITableViewController {
        
        var petitions = [Petition]()
    var myName: String = ""

        override func viewDidLoad() {
            super.viewDidLoad()
                    
            let urlString: String
            
            urlString = "https://firebasestorage.googleapis.com/v0/b/piax-3136a.appspot.com/o/testJSON%20Hamburg.json?alt=media&token=faa524d7-d22d-49e4-83a6-879dc95a3084"
        
            
            if let url = URL(string: urlString) {
                if let data = try? Data(contentsOf: url) {
                    print("My Data  \(data.description)")
                parse(json: data)
                return
                    
            } else {
                print("Error 1")
                showError()
            }
        } else {
                    print("Error 2")
            showError()
        }
        
        func showError() {
            let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }

        }
        
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json){
            petitions = jsonPetitions.results
            tableView.reloadData()
            print("My Petitions \(petitions)")
        } else { print("No decode") }
    }
   
    
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return petitions.count
        }
        
       
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
            let mypetition = petitions[indexPath.row]
            cell.textLabel?.text = mypetition.name
            cell.detailTextLabel?.text = mypetition.description
       
            return cell
            
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if let vc = storyboard?.instantiateViewController(withIdentifier: "DescritionViewController") as? DescritionViewController {

            vc.detailHamburgName = petitions[indexPath.row].name
            vc.detailHamburgText = petitions[indexPath.row].description
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
}
