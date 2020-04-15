//
//  TableViewController.swift
//  DicodingPemula
//
//  Created by Sayyid Maulana Khakul Y on 14/04/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import UIKit

    private let reuseIdentifier = "identifier"

class TableViewController: UITableViewController {
    
    var dataObject: [MainData] = [
        MainData(img: UIImage(named: "Abyssinian")!, name: "Abyssinian", desc: "Originally from Ethiopia (previously known as Abyssinia), the Abyssinian cat has a distinctive red/orange agouti coat. The agouti fur, which actually means it has bands of light and dark coloring on the individual pieces of hair, gives the Abyssinian its unique look."),
        MainData(img: UIImage(named: "AmericanShortHair")!, name: "American Short Hair", desc: "An all-American breed, the American Shorthair cat is a large, intelligent shorthair feline that has a round face and short ears. They are often confused with domestic, mixed-breed cats, but are in fact a purebred and their name change from domestic shorthair cats in 1966 helped to differentiate them."),
        MainData(img: UIImage(named: "Bengal")!, name: "Bengal", desc: "Many colors are allowed on Bengals, but their approved patterns only include spots and rosettes. Their name comes from the Asian leopard cat’s taxonomic name, Prionailurus bengalensis bengalensis, since Bengals were originally bred from both domestic cats and this wildcat. They get their beautiful patterns from this wildcat as well."),
        MainData(img: UIImage(named: "Birman")!, name: "Birman", desc: "Birmans were used for breeding in the development of Ragdolls, so they look very similar but can have slightly different markings and personalities."),
        MainData(img: UIImage(named: "Himalayan")!, name: "Himalayan", desc: "Himalayans were bred from crossing Persians and Siamese to achieve their color points. Himalayans only come in the color point pattern, but this pattern can be a variety of colors."),
        MainData(img: UIImage(named: "MaineCoon")!, name: "Maine Coon", desc: "Many Maine Coons have extra toes, a trait referred to as polydactylism, which makes their already large feet even larger. This is a great feature to have when hunting in the snow since large feet act as snowshoes."),
        MainData(img: UIImage(named: "Persian")!, name: "Persian", desc: "Persians have been seen in many movies, art, commercials, and homes throughout the years and have also been one of the most popular breeds of cats for decades."),
        MainData(img: UIImage(named: "Ragdoll")!, name: "Ragdoll", desc: "Ragdolls look a lot like long-haired Siamese cats with their pointed color patterns. They also have distinctive blue eyes and dog-like personalities, following their owners around the house."),
        MainData(img: UIImage(named: "Siamese")!, name: "Siamese", desc: "Siamese cats have distinct markings called points that are the areas of coloration on their face, ears, feet, and tail, but some Siamese may not have any points. There are also two varieties of Siamese cats, one with an apple shaped head and chubbier body and one with a larger head and slender body."),
        MainData(img: UIImage(named: "Sphynx")!, name: "Sphynx", desc: "If you are looking for a cat that doesn't shed, then the Sphynx is for you. Sphynx cats look unique due to their lack of fur and are very social, active, dog-like felines.")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        self.tableView.sectionHeaderHeight = 70
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataObject.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TableViewCell

        // Configure the cell...
        let dataObjc = dataObject[indexPath.item]
        cell.page = dataObjc
        let cat = dataObject[indexPath.row]
        cell.img.image = cat.img

        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect.zero)
        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 150, height: 50))
        label.text = "Your Favorite Cat"
        label.textColor = ColorTheme.darkGray
        
        let frame = CGRect(x: 300, y: 15, width: 60, height: 60)
        let headerImageView = UIButton(frame: frame)
        headerImageView.setImage(#imageLiteral(resourceName: "maul"), for: .normal)
        headerImageView.clipsToBounds = true
        headerImageView.layer.cornerRadius = 30
    
        headerImageView.addTarget(self, action: #selector(showSub), for: .touchUpInside)
        
        self.view.addSubview(headerImageView)
        self.view.addSubview(label)

        return view
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let nav = UIStoryboard.main.instantiateViewController(withIdentifier: "view") as! ViewController
            nav.cat = dataObject[indexPath.row]
            self.navigationController?.pushViewController(nav, animated: true)
            print("clicked")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    @objc func showSub(){
        let nav = Profile()
        nav.modalPresentationStyle = .fullScreen
        nav.modalTransitionStyle = .partialCurl
        self.present(nav, animated: true, completion: nil)
        print("clicked")
    }
    
}

extension UIStoryboard {
    static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}
