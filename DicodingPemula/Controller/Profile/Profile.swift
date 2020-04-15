//
//  Profile.swift
//  DicodingPemula
//
//  Created by Sayyid Maulana Khakul Y on 14/04/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import UIKit

class Profile: UIViewController {
    
    fileprivate let container: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    let itemImage = UIImageView()
    let itemName = UILabel()
    let itemMail = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorTheme.info
        bindData()
    }
    
    func bindData() {
        setupView()
        setLibrary()
    }
    
    func setupView() {

        view.addSubview(itemImage)
        itemImage.setAnchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, paddingTop: 80, paddingLeft: 120, paddingBottom: 0, paddingRight: 120, width: 120, height: 120)

        view.addSubview(container)
        container.addSubview(itemName)
        container.addSubview(itemMail)
        container.setAnchor(top: itemImage.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 200)
        Utilities.shadow(controller: self, yourView: container)
        Utilities.cornerRadius10(controller: self, yourView: container)
        itemName.setAnchor(top: container.topAnchor, left: container.leadingAnchor, bottom: nil, right: container.trailingAnchor, paddingTop: 20, paddingLeft: 30, paddingBottom: 0, paddingRight: 30, width: 0, height: 0)
        itemMail.setAnchor(top: itemName.bottomAnchor, left: container.leadingAnchor, bottom: nil, right: container.trailingAnchor, paddingTop: 20, paddingLeft: 30, paddingBottom: 0, paddingRight: 30, width: 0, height: 0)
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
        view.addSubview(navBar)

        let navItem = UINavigationItem(title: "Profile")
        let doneItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(close))
        navItem.leftBarButtonItem = doneItem
        navBar.barTintColor = .white

        navBar.setItems([navItem], animated: false)
        //get rod of containerView offset
        edgesForExtendedLayout = []
        navBar.frame.origin.y = navBar.frame.origin.y + 30
    }
    
    func setLibrary() {
        itemImage.setObject{_ in
            itemImage.clipsToBounds = true
            itemImage.layer.cornerRadius = 30
            itemImage.image = #imageLiteral(resourceName: "maul")
        }
        itemName.setObject{_ in
            itemName.font = UIFont.systemFont(ofSize: 12)
            itemName.textAlignment = .left
            itemName.text = "Sayyid Maulana Khakul Yakin"
        }
        itemMail.setObject{_ in
            itemMail.font = UIFont.italicSystemFont(ofSize: 8)
            itemMail.textAlignment = .left
            itemMail.textColor = ColorTheme.darkGray
            itemMail.text = "mistermaulan@gmail.com"
        }
    }
    @objc func close() {
        self.dismiss(animated: false, completion: nil)
    }
}
