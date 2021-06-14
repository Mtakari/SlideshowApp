//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Mtaka on 6/11/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var moveButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var choiceButton: UIButton!
    
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
    
    @IBAction func bigImage(_ sender: Any) {
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
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
        
    }
    
    @IBAction func choiceButton(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            moveButton.isEnabled = false
            backButton.isEnabled = false
            choiceButton.setTitle("停止", for: .normal)
            
        }else{
            self.timer.invalidate()
            self.timer = nil
            moveButton.isEnabled = true
            backButton.isEnabled = true
            choiceButton.setTitle("再生", for: .normal)
        }

    }

}

