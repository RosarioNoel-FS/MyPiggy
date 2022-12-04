//
//  CustomGoalViewController.swift
//  MyPiggy
//
//  Created by Noel Rosario on 12/4/22.
//

import UIKit

class CustomGoalViewController: UIViewController {

    @IBOutlet weak var goalNameTF: UITextField!
    
    @IBOutlet weak var goalTotalTF: UITextField!
    
    @IBOutlet weak var savingSegment: UISegmentedControl!
    
    @IBOutlet weak var goalDatePicker: UIDatePicker!
    
    @IBOutlet weak var amountNeededTotalTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func createButtonTapped(_ sender: Any)
    {
        
            
    }
    
    
    @IBAction func segmentTapped(_ sender: Any)
    {
        
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
