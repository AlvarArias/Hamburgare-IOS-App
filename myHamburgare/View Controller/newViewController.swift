//
//  newViewController.swift
//  myHamburgare
//
//  Created by Alvar Arias on 2021-12-30.
//

import UIKit

class newViewController: UIViewController {
    
    var theData = ["Hamburg 1", "Hamburg 2", "Hamburg 3","Hamburg 4", "Hamburg 5", "Hamburg 6"]

    @IBOutlet weak var myCollec: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        let cellPadding = (myCollec.frame.width - 300) / 2
        let carouselLayout = UICollectionViewFlowLayout()
                carouselLayout.scrollDirection = .horizontal
                
                carouselLayout.sectionInset = .zero
                
                carouselLayout.itemSize = .init(width: 300, height: 400)
                carouselLayout.sectionInset = .init(top: 0, left: cellPadding, bottom: 0, right: cellPadding)
        carouselLayout.minimumLineSpacing = myCollec.frame.width - 300
                myCollec.collectionViewLayout = carouselLayout
    
                
                myCollec.reloadData()
        
        
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

extension newViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
      didSelectItemAt indexPath: IndexPath) {
            print("Selected")
    }

    
}


