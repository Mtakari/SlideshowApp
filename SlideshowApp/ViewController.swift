//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Mtaka on 6/11/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var number: Int! = 0
    
    var timer: Timer!
    
    let imagesBox = [UIImage(named: "img1")! , UIImage(named: "img2")! , UIImage(named: "img3")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = (imagesBox[0])
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        imageView.image = (imagesBox[number])
    }
        
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let expansionViewController:ExpansionViewController = segue.destination as! ExpansionViewController
    
        expansionViewController.getimage = imageView.image!
    
    }
    
    @objc func updateTimer(_ timer: Timer){
        number += 1
        if number >= imagesBox.count {
            number = 0
        }
        imageView.image = (imagesBox[number])
    }
    
    
    @IBAction func moveButton(_ sender: Any) {
        number += 1
        if number >= imagesBox.count {
            number = 0
        }
        imageView.image = (imagesBox[number])
    }
    
    @IBAction func backButton(_ sender: Any) {
        number -= 1
        if number < 0 {
            number = imagesBox.count - 1
        }
        imageView.image = (imagesBox[number])
        print("imagesBox\(imagesBox)")
    }
    
    @IBAction func choiceButton(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        }else{
            self.timer.invalidate()
            self.timer = nil
        }

    }

}

