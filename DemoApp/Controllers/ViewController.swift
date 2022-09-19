//
//  ViewController.swift
//  DemoApp
//
//  Created by TuPT on 19/09/2022.
//

import UIKit

class ViewController: UIViewController {
    let dataStore = UseCase.instance
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onLogin(_ sender: UIButton) {
        dataStore.login {
            (token:Bool) in
            if(token == true){
                DispatchQueue.main.async {
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                    self.navigationController?.pushViewController(nextViewController, animated: true)
                }
            }
        }
    }
    
    @IBAction func accountChange(_ sender: UITextField) {
        dataStore.updateAccount(text: sender.text ?? "")
    }
    
    @IBAction func passwordChange(_ sender: UITextField) {
        dataStore.updatePassword(text: sender.text ?? "")
    }
}


