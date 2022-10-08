//
//  InfoViewController.swift
//  lesson4312
//
//  Created by ake11a on 2022-10-08.
//

import UIKit

class InfoViewController: UIViewController {

    var rowInfo = ""
    
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoLabel.text = "You choose \(rowInfo)"
        
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
