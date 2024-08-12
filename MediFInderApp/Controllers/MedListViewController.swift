//
//  MedListViewController.swift
//  MediFInderApp
//
//  Created by Octavio on 10/08/24.
//

import UIKit

class MedListViewController: UIViewController {
    
    @IBOutlet weak var medTable: UITableView!
    var storage: ListManager?

    override func viewDidLoad() {
        super.viewDidLoad()

        storage = ListManager()
        medTable.reloadData()
        
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

extension MedListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (storage?.medicineCount())!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchMedCell", for: indexPath) as! ListMedTableViewCell
        
        let currentEvent = storage?.readMedicineAt(index: indexPath.row)
        
        cell.listMedImage.image = UIImage(systemName: "list.clipboard")
        cell.listMedBrand.text = currentEvent!.branName
        cell.listMedGenericName.text = currentEvent!.genName
        cell.listMedInterval.text = "Time interval: \(currentEvent!.timePerDose) hrs"
        cell.listMedQuantity.text = "Quantity: \(currentEvent!.quantity)"
        
        return cell
    }
    
    
}
