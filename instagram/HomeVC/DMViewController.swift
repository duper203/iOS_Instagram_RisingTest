//
//  DMViewController.swift
//  instagram
//
//  Created by 김혜수 on 2022/11/30.
//

import Foundation
import UIKit

class DMViewController: UIViewController{
    
    @IBAction func dismissBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let DMNibOne = UINib(nibName: "DMTableViewCellOne", bundle: nil)
        tableView.register(DMNibOne, forCellReuseIdentifier: "DMTableViewCellOne")
        
        let DMNibTwo = UINib(nibName: "DMTableViewCellTwo", bundle: nil)
        tableView.register(DMNibTwo, forCellReuseIdentifier: "DMTableViewCellTwo")
    }
}
extension DMViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
            return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1{
            return "메시지"
        }
        return nil
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        else{
            return 6
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0){
            return 50
        }else{
            return 50
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DMTableViewCellOne", for: indexPath) as! DMTableViewCellOne
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DMTableViewCellTwo", for: indexPath) as! DMTableViewCellTwo
            return cell
        }

    }
    
    
}
