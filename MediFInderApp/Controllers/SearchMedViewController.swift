//
//  SearchMedViewController.swift
//  MediFInderApp
//
//  Created by Octavio on 10/08/24.
//

import UIKit

class SearchMedViewController: UIViewController {
    
    
    @IBOutlet weak var MedTableView: UITableView!
    
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

extension SearchMedViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager?.getItemCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchMedCell", for: indexPath) as? SearchMedTableViewCell
        cell?.medImage
        cell?.medBrandName
        cell?.medGenericName
        cell?.medManufacturer
        cell?.medRoute
    }
    
    
}
