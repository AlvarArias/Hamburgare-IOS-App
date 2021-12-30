//
//  HomeViewController.swift
//  myHamburgare
//
//  Created by Alvar Arias on 2021-12-14.
//

import UIKit

// new home 
class HomeViewController: ViewController {
    
    var myDataTest = ["Hamburg 1","Hamburg 2","Hamburg 3"]
    
    var homepetitions = [Petition]()
    
   
    @IBOutlet weak var myCollecView: UICollectionView!
    
    
    
    
    //myHomeColl
        
    override func viewDidLoad() {
        super.viewDidLoad()

        performSelector(inBackground: #selector(fechJSON), with: nil)
        
    
    }
    
    
    @objc func fechJSON() {
    let urlString: String
        //urlString = "https://firebasestorage.googleapis.com/v0/b/piax-3136a.appspot.com/o/testJSON%20Hamburg.json?alt=media&token=7d7cb05c-22ff-4b2f-aff1-1c28175e0792"
        urlString = "https://firebasestorage.googleapis.com/v0/b/piax-3136a.appspot.com/o/JSON%20Hamburg.json?alt=media&token=3914137c-59e3-42a5-a953-f9f80732165d"
        
        
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
    homepetitions = jsonPetitions.results
        myCollecView.performSelector(onMainThread: #selector(UICollectionView.reloadData), with: nil, waitUntilDone: false)
    } else {
    performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
    }
    }
    
    @objc func showError() {
    let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
    ac.addAction(UIAlertAction(title: "OK", style: .default))
    present(ac, animated: true)
    }
    
   // Home buttons
    
    @IBAction func favoriteButtClick(_ sender: Any) {
    }
    
    @IBAction func popularButtClick(_ sender: Any) {
    }
       
    
    
}


 extension HomeViewController : UICollectionViewDataSource {
     
     func numberOfSections(in collectionView: UICollectionView) -> Int {
         return 1
     }
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return homepetitions.count
     }
        
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myHomeColl", for: indexPath) as! homeCollectionViewCell
         
         let mypetition = homepetitions[indexPath.row]
         //cell.homeTextLabel.text = myDataTest[indexPath.row]
         cell.homeTextLabel?.text = mypetition.name
         
         let myURL = URL(string: mypetition.image)
         //print(myURL)
         if (myURL != nil) {
             cell.homeImage.load(url: myURL!)
             
             func load(url: URL) {
                 DispatchQueue.global().async { [weak self] in
                     if let data = try? Data(contentsOf: url) {
                         if let image = UIImage(data: data) {
                             DispatchQueue.main.async {
                                 cell.homeImage.image = image
                             }
                         }
                     }
                 }
             }
             
         }
         
         return cell
     }
     

 }
 
extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
      didSelectItemAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DescritionViewController") as? DescritionViewController {

            vc.detailHamburgName = homepetitions[indexPath.row].name
            vc.detailHamburgText = homepetitions[indexPath.row].description
            vc.calorias = homepetitions[indexPath.row].calories
            vc.tiempo = homepetitions[indexPath.row].time
            vc.listIngredients = homepetitions[indexPath.row].ingredients
            vc.preparations = homepetitions[indexPath.row].preparation
            vc.urlSelectedImag = homepetitions[indexPath.row].image
            
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
      }
    
}


