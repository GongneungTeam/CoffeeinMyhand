//
//  ViewController.swift
//  CoffeeInMyHand
//
//  Created by Hyeong Seok Jung on 2021/05/18.
//

import UIKit

class ViewController: UIViewController {

    var imgCoffee: UIImage?
    
    @IBOutlet weak var hello: UILabel!
    @IBOutlet weak var hello2: UILabel!
    @IBOutlet weak var welcome: UITextView!
    @IBOutlet weak var coffee: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgCoffee = UIImage(named:"Coffee.jpg")
        
        coffee.image = imgCoffee
    }

    @IBAction func signup(_ sender: UIButton) {
    }
    
    @IBAction func signIn(_ sender: UIButton) {
    }
}

