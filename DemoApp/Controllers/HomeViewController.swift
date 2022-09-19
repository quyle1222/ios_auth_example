//
//  HomeViewController.swift
//  DemoApp
//
//  Created by TuPT on 19/09/2022.
//

import UIKit

class HomeViewController: UIViewController{
    @IBOutlet weak var labelToken: UILabel!
    let dataSource = UseCase.instance
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        labelToken.text = dataSource.getToken()
    }
}
