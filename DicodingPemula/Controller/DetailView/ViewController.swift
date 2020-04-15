//
//  ViewController.swift
//  DicodingPemula
//
//  Created by Sayyid Maulana Khakul Y on 14/04/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgCat: UIImageView!
    @IBOutlet weak var nameCat: UILabel!
    @IBOutlet weak var detailCat: UILabel!
    
    var cat: MainData?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorTheme.info
        // Do any additional setup after loading the view.
    if let result = cat {
        imgCat.image = result.img
        nameCat.text = result.name
        detailCat.text = result.desc
           }
    }

}

