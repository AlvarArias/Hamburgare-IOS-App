//
//  DescritionViewController.swift
//  myHamburgare
//
//  Created by Alvar Arias on 2021-12-14.
//

import UIKit

class DescritionViewController: UIViewController {
    
    var detailHamburgName = ""
    var detailHamburgText = ""
    var urlSelectedImag = ""

    @IBOutlet weak var imgDescrip: UIImageView!
    
    @IBOutlet weak var nameHamDescrip: UILabel!
    
    @IBOutlet weak var imgLeftShareBar: UIImageView!
    
    @IBOutlet weak var buttonShareDesc: UIButton!
    
    @IBOutlet weak var imgCenterShareBar: UIImageView!
    
    @IBOutlet weak var receptTextDesc: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameHamDescrip.text = detailHamburgName
        receptTextDesc.text = detailHamburgText
        print("detail value = \(detailHamburgName)")
   
        let myURL = URL(string: urlSelectedImag)
        print(myURL)
        if (myURL != nil) {
            imgDescrip.load(url: myURL!)
        }
        
   
    }
    

    @IBAction func shareRecep(_ sender: Any) {
        // Activare share action
        
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
