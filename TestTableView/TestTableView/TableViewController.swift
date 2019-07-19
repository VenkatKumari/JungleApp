//
//  ViewController.swift
//  TestTableView
//
//  Created by epita on 24/04/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var PersonArray : [PersonDetail]?
    var selectedPerson : PersonDetail?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUsers()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let detailViewController = segue.destination as? DetailViewController else {
            return
        }
        
        detailViewController.person = selectedPerson
        //detailViewController.film = selectedFilm
    }
    
    func fetchUsers(){
        var request = URLRequest(url: URL(string: "https://randomuser.me/api/?results=50&seed=natarajan")!)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do{
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(Person.self, from: data!)
                self.PersonArray = responseModel.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print(responseModel)
            } catch let error {
                print("JSON Serialization ERROR: ", error)
            }
            }.resume()
    }
    
    func formatName(name: Name) -> String {
        return name.title.capitalized + " " + name.first.capitalized + " " + name.last.uppercased()
    }
    
    func getPhoto(url:URL) -> UIImage {
        let data: Data = try! Data(contentsOf: url)
        return UIImage(data: data) ?? UIImage()
    }
}

extension TableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PersonArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "textCell") as? ContactListTableViewCell else{
            return UITableViewCell()
        }
        
        if let person = PersonArray?[indexPath.row] {
            cell.titleLabel.text = formatName(name: person.name)
            cell.releaseYearLabel.text = person.email
            cell.labelthumb.image =  getPhoto(url: URL(string: person.picture.thumbnail)!)
            cell.labelthumb.layer.cornerRadius = cell.frame.height/2
        }
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = #colorLiteral(red: 0.6823529412, green: 0.8392156863, blue: 0.9450980392, alpha: 1)
        } else
        {
            cell.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9607843137, blue: 0.9843137255, alpha: 1)
        }
        
        return cell
    }
    
    
}

extension TableViewController: UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedPerson = PersonArray![indexPath.row]
        performSegue(withIdentifier: "nextScreen", sender: nil)
        
        //selectedFilm = array[indexPath.row]
    //performSegue(withIdentifier: "showDetail", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
