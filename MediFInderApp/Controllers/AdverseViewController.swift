//
//  AdverseViewController.swift
//  MediFInderApp
//
//  Created by Octavio on 10/08/24.
//

import UIKit

class AdverseViewController: UIViewController {

    @IBOutlet weak var FirstMedicineLabel: UILabel!
    @IBOutlet weak var SecondMedicineLabel: UILabel!
    @IBOutlet weak var ReactionLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var FirstMedicineTextField: UITextField!
    @IBOutlet weak var SecondMedicineTextField: UITextField!
    
    @IBOutlet weak var ReactionPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Asignar elementos String localizables
        FirstMedicineLabel.text = String(localized: "First medicine to compare")
        SecondMedicineLabel.text = String(localized: "Second medicine to compare")
        ReactionLabel.text = String(localized: "Reaction to check")
        searchButton.titleLabel?.text = String(localized: "Search coincidences")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        
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
