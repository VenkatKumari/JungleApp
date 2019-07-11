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
    //var array = [String]()
    var array = [Films]()
    var selectedFilm: Films?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let film = Films("Avengers: Endgame", releasedOn: "2019", directedBy: "Russo Bros.", with: ["Robet Downey Jr., Chris Evans"], description: "After the snap")
        let film2 = Films("Avengers: INFINITY WAR", releasedOn: "2018", directedBy: "Russo Bros.", with: ["Robet Downey Jr., Chris Evans"], description: "Before the snap")
        array.append(film)
        array.append(film2)
        print(array)
        //array = ["Super", "fast", "super",  "easy", "Super", "fast","Super", "fast", "Super", "fast", "super", "easy"]
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let detailViewController = segue.destination as? DetailViewController else {
            return
        }
        detailViewController.film = selectedFilm
    }

}

extension TableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "textCell") as? ContactListTableViewCell else{
            return UITableViewCell()
        }
        let film = array[indexPath.row]
        cell.titleLabel.text = film.title
        cell.releaseYearLabel.text = film.releaseYear
        
        return cell
    }
    
    
}

extension TableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFilm = array[indexPath.row]
    performSegue(withIdentifier: "showDetail", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
