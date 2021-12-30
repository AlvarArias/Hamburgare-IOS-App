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
   
    @IBOutlet weak var myCollecView: UICollectionView!
    
    //myHomeColl
        
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    
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
         return myDataTest.count
     }
     
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myHomeColl", for: indexPath) as! homeCollectionViewCell
         
         cell.homeTextLabel.text = myDataTest[indexPath.row]
         
         return cell
     }
     

 }
 



