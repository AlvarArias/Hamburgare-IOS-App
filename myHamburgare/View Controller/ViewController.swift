//
//  ViewController.swift
//  myHamburgare
//
//  Created by Alvar Arias on 2021-12-13.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //let carouselView = CarouselView()
        //myView.addSubview(carouselView)
        // Set up constraints for the carousel view
        
       /*
        var carouselData = [CarouselView.CarouselData]()
        carouselData.append(.init(image: UIImage(named: "Hamburg-logo"), text: "Hamburg-logo"))
        carouselData.append(.init(image: UIImage(named: "Hamburg-logo"), text: "Hamburg-logo"))
        carouselData.append(.init(image: UIImage(named: "Hamburg-logo"), text: "Hamburg-logo"))
        print("carouselData.count \(carouselData.count)")
         */
        //carouselView.configure(with: carouselData)
        //carouselView.configureView(with: carouselData)
        
        // Realm
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        /*   Escribe en BD
        var myFavHamburg = myHamburg()
        myFavHamburg.myid = "2"
        myFavHamburg.myname = "Hamburgare pitipana "
        myFavHamburg.mydescription = "Good hamburgare"

        try! realm.write {
            realm.add(myFavHamburg)
        }
        */

        // leer en BD
        let result = realm.objects(myHamburg.self)
        
        print(result[0].mydescription)
        
    }


}

