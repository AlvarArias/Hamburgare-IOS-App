//
//  VegoViewController.swift
//  myHamburgare
//
//  Created by Alvar Arias on 2022-01-08.
//

import UIKit

class VegoViewController: UITableViewController {

    @IBOutlet weak var myIndicator: UIActivityIndicatorView!
    
    var petitions = [Petition]()
        var myName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.separatorStyle = .none
        
        myIndicator.style = .large
        myIndicator.color = .red
        myIndicator.startAnimating()
        
        performSelector(inBackground: #selector(fechJSON), with: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vegan", for: indexPath)
        
        let mypetition = petitions[indexPath.row]
        cell.textLabel?.text = mypetition.name
        cell.textLabel?.font = UIFont(name: "Tekton Pro", size: 15.0)
        cell.textLabel?.textColor = UIColor(red: 0.808, green: 0.349, blue: 0.247, alpha: 100.0)
        cell.detailTextLabel?.text = mypetition.description
      
        return cell
        
    }

override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    if let vc = storyboard?.instantiateViewController(withIdentifier: "DescritionViewController") as? DescritionViewController {

        vc.detailHamburgName = petitions[indexPath.row].name
        vc.detailHamburgText = petitions[indexPath.row].description
        vc.calorias = petitions[indexPath.row].calories
        vc.tiempo = petitions[indexPath.row].time
        vc.listIngredients = petitions[indexPath.row].ingredients
        vc.preparations = petitions[indexPath.row].preparation
        vc.urlSelectedImag = petitions[indexPath.row].image
        
        navigationController?.pushViewController(vc, animated: true)
    }
}


@objc func fechJSON() {
let urlString: String
    
    urlString = "https://firebasestorage.googleapis.com/v0/b/piax-3136a.appspot.com/o/JSONHamburgVegan.json?alt=media&token=57156f0f-4332-4c14-81e7-760f2a050640"
    //urlString = "https://firebasestorage.googleapis.com/v0/b/piax-3136a.appspot.com/o/JSON%20Hamburg%20halso.json?alt=media&token=2e93898e-44cf-4714-981e-7eec519c5d18"
    
// Trata URL
if let url = URL(string: urlString) {
if let data = try? Data(contentsOf: url) {
parse(json: data)
return

}
performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
    }
}

func parse(json: Data) {
let decoder = JSONDecoder()

if let jsonPetitions = try? decoder.decode(Petitions.self, from: json){

petitions = jsonPetitions.results
    
    DispatchQueue.main.async {
        self.myIndicator.stopAnimating()
        self.myIndicator.isHidden = true
        self.tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)}
    
} else {
performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
}
}

@objc func showError() {
let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
ac.addAction(UIAlertAction(title: "OK", style: .default))
present(ac, animated: true)
    }


}
