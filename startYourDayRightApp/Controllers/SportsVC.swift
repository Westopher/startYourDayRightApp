//
//  SportsVC.swift
//  startYourDayRightApp
//
//  Created by West Kraemer on 8/13/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit

class SportsVC: UIViewController {

    var sampleSportsNewsUrl = "https://newsapi.org/v2/top-headlines?sources=bleacher-report,the-sport-bible,espn,bbc-sport&apiKey=5ca10b2d20a545099a108a3aeceb329c"
    
    @IBOutlet weak var tableView: UITableView!
    var array = ["1","2","3"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}



extension SportsVC: UITableViewDelegate {
    
}

extension SportsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sportsArticleCell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    
    
}
