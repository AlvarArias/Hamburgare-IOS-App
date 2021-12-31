//
//  DescritionViewController.swift
//  myHamburgare
//
//  Created by Alvar Arias on 2021-12-14.
//

import UIKit
import RealmSwift

class DescritionViewController: UIViewController {
    
    var detailHamburgName = ""
    var detailHamburgText = ""
    var urlSelectedImag = ""
    var listIngredients = ""
    var preparations = ""
    var calorias = ""
    var tiempo = ""
    var state : Bool = true

    @IBOutlet weak var imgDescrip: UIImageView!
    
    @IBOutlet weak var nameHamDescrip: UILabel!
    
    @IBOutlet weak var imgLeftShareBar: UIImageView!
    
    @IBOutlet weak var buttonShareDesc: UIButton!
    
    @IBOutlet weak var imgCenterShareBar: UIImageView!
    
    @IBOutlet weak var receptTextDesc: UITextView!

    @IBOutlet weak var labCalories: UILabel!
    
    @IBOutlet weak var labTime: UILabel!
    
    @IBOutlet weak var likeButtonOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        nameHamDescrip.text = detailHamburgName
        receptTextDesc.text = detailHamburgText
        labCalories.text = calorias
        labTime.text = tiempo
        
        print("detail value = \(detailHamburgName)")
   
        let myURL = URL(string: urlSelectedImag)
        print(myURL)
        if (myURL != nil) {
            imgDescrip.load(url: myURL!)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(addHamburg))
   
    }
    
    // Functions
    @objc func addHamburg(num: Int) {
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        //  Escribe en BD
        var selecHamburg = theHamburg()
        selecHamburg.myName = detailHamburgName
        selecHamburg.myDescription = detailHamburgText
        selecHamburg.myImage = urlSelectedImag
        selecHamburg.myIngredients = listIngredients
        selecHamburg.myPreparation = preparations
        selecHamburg.myCalories = calorias
        selecHamburg.myTime = tiempo
        
       
        if num == 1 {
            try! realm.write {
                realm.add(selecHamburg)
                print("sucess to writed in database")
            }
            
        } else {
            return
            }
            
        }
        
    
    @objc func shareTapped() {
        // Add imagen de la hamburguesa
        guard let image = imgDescrip.image?.jpegData(compressionQuality: 0.8) else {
            print("not image found")
            return
        }
        
         //let items: [Any] = [detailHamburgName, image]
         
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    
    @IBAction func likeButton(_ sender: Any) {
        
        if state {
            likeButtonOutlet.setImage(UIImage(named: "icons8-heart-144"), for: .normal)
            addHamburg(num: 1)
            print("I liked")
            state = false
        } else {
            likeButtonOutlet.setImage(UIImage(named: "icons8-heart-50"), for: .normal)
            print("Now i dont liked")
            state = true
        }
        
       
        
    }
    
    
    

    @IBAction func shareRecep(_ sender: Any) {

        myAlert(name: "Gör så här", mensaje: preparations)
   
    }
    

    @IBAction func buttIngred(_ sender: Any) {
        myAlert(name: "Ingredienser", mensaje: listIngredients)
    }
    
    func myAlert(name: String, mensaje: String) {
        
        // Create a new alert
        var dialogMessage = UIAlertController(title: name, message: mensaje, preferredStyle: .actionSheet)
        
        // create button with accion handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in print("Ok button tapped")
        })
        // Add ok button to dialog menssaje
        dialogMessage.addAction(ok)
        // Present alert to
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
