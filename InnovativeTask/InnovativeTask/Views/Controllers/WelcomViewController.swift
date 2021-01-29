//
//  WelcomViewController.swift
//  InnovativeTask
//
//  Created by Muzamil Hassan on 24/01/2021.
//

import UIKit

class WelcomViewController: UIViewController {

    @IBOutlet weak var lblUserName: UILabel!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblUserName.text = CurrentUser.loggedInUser?.userName
        // Do any additional setup after loading the view.
    }
    
    @IBAction func viewDetailAction(_ sender: Any) {
        
        let listViewController = self.storyboard!.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        self.navigationController!.pushViewController(listViewController, animated: true)
        
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
