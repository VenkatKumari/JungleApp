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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUsers()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let detailViewController = segue.destination as? DetailViewController else {
            return
        }
        //detailViewController.film = selectedFilm
    }
    
    func fetchUsers(){
        var request = URLRequest(url: URL(string: "https://randomuser.me/api/?results=10")!)
        
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
        }
        return cell
    }
    
    
}

extension TableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //selectedFilm = array[indexPath.row]
    //performSegue(withIdentifier: "showDetail", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
