//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by Mtaka on 6/11/21.
//

import UIKit

class ExpansionViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var getimage: UIImage!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageView.image = getimage
            }

}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


