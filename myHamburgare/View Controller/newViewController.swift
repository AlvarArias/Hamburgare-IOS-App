//
//  newViewController.swift
//  myHamburgare
//
//  Created by Alvar Arias on 2021-12-30.
//

import UIKit

class newViewController: UIViewController {
    
    var theData = ["Hamburg 1", "Hamburg 2", "Hamburg 3"]

    @IBOutlet weak var myCollec: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension newViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return theData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellColl", for: indexPath) as! myCollectionViewCell
        
        cell.myCellLabel.text = theData[indexPath.row]
        
        
        return cell
    }
    

}
