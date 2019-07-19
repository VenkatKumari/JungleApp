//
//  DetailViewController.swift
//  TestTableView
//
//  Created by epita on 15/05/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var person :  PersonDetail?
    @IBOutlet weak var titlefirstlast: UILabel!
    
    @IBOutlet weak var streetname: UILabel!
    
    @IBOutlet weak var cityname: UILabel!
                                        
    @IBOutlet weak var emailname: UILabel!
    
    
    @IBOutlet weak var phonenum: UILabel!
    
    @IBOutlet weak var cellnum: UILabel!
    
    @IBOutlet weak var labelImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadContent()
    }
    
    func formatName(name: Name) -> String {
        return name.title.capitalized + " " + name.first.capitalized + " " + name.last.uppercased()
    }
    
    func loadContent(){
        let fullname = formatName(name: person!.name)
        titlefirstlast.text = fullname
        streetname.text = person?.location.street
        cityname.text = person?.location.city
        emailname.text = person?.email
        phonenum.text = person?.phone
        cellnum.text = person?.cell
        setPhoto(url: URL(string: (person?.picture.large)!)!)
    }
    
    func setPhoto(url:URL){
        let data: Data = try! Data(contentsOf: url)
        labelImage.image = UIImage(data: data)
    }
}
