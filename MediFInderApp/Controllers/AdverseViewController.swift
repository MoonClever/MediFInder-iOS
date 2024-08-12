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
    
    var pickerData: [String] = [String]()
    var networkManager = NetworkMonitor()
    
    var queryResult: AdverseCount?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerData = ["Hypertension",
                      "Headache",
                      "Fatigue",
                      "Palpitations",
                      "Nausea"]
        
        //Asignar elementos String localizables
        FirstMedicineLabel.text = String(localized: "First medicine to compare")
        SecondMedicineLabel.text = String(localized: "Second medicine to compare")
        ReactionLabel.text = String(localized: "Reaction to check")
        searchButton.titleLabel?.text = String(localized: "Search coincidences")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        
        if(networkManager.isReachable && (networkManager.connectionType != "Datos")){
            if(!(FirstMedicineTextField.text!.isEmpty && SecondMedicineTextField.text!.isEmpty)){
                let getUrl = URL(string: generateAdverseQuery(
                    countCriteria: generateCountCriteria(
                        med1: FirstMedicineTextField.text!,
                        med2: SecondMedicineTextField.text!,
                        reaction: pickerData[ReactionPicker.selectedRow(inComponent: 0)]),
                    countKey: "patient.reaction.reactionmeddrapt.exact",
                    limit: "1"))
                                 
                URLSession.shared.dataTask(with: getUrl!) {data, response, error in
                    guard let data = data, error == nil else{return}
                    
                    if let httpResponse = response as? HTTPURLResponse{
                        if httpResponse.statusCode == 404{
                            //self.show(warning: "No se encontraron resultados")
                            let alert = UIAlertController(title: "Error 404",message: "No se encontraron resultados", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style:.cancel, handler: nil))
                            DispatchQueue.main.async{
                                self.present(alert, animated: true, completion: nil)
                            }
                            
                            return
                        }
                    }
                    
                    do{
                        try self.queryResult = JSONDecoder().decode(AdverseCount.self, from: data)
                        
                        let count = String(DrugManager().convertCountQueryToInt(resultCount: self.queryResult!) ?? 0)
                        
                        //self.show(warning: "Coincidencias encontradas \(count)")
                        let alert = UIAlertController(title: "Get Exitoso",message: "Coincidencias encontradas \(count)", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style:.cancel, handler: nil))
                        DispatchQueue.main.async{
                            self.present(alert, animated: true, completion: nil)
                        }
                        
                        
                        
                        
                    }catch{
                        self.show(error: "Ocurrió un error")
                        print(error)
                    }
                }.resume()
            }
            else{
                show(warning: "Rellene todos los campos")
            }
        }
        else{
            show(warning: "No está conectado a Internet por medio de WiFi, intentelo más tarde")
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

}

extension AdverseViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
}

