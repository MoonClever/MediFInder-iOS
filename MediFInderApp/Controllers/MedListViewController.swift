//
//  MedListViewController.swift
//  MediFInderApp
//
//  Created by Octavio on 10/08/24.
//

import UIKit

class MedListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
        return manager?.getItemCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchMedCell", for: indexPath) as? ListMedTableViewCell
        cell?.listMedImage
        cell?.listMedBrand
        cell?.listMedGenericName
        cell?.listMedInterval
        cell?.listMedQuantity
    }
    
    
}
