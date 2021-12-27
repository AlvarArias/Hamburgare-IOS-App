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
    }
    

    @IBAction func shareRecep(_ sender: Any) {
        // Activare share action
        
    }
    

}
