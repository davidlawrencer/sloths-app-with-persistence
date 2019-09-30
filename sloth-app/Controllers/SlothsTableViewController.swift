//
//  ViewController.swift
//  sloth-app
//
//  Created by David Rifkin on 9/30/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class SlothsTableViewController: UIViewController {

    var sloths = [Sloth](){
        didSet {
            slothsTableView.reloadData()
        }
    }
    
    @IBOutlet weak var slothsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slothsTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    func loadData(){
        do {
            sloths = try SlothPersistenceHelper.manager.getSloths()
        } catch {
            print(error)
        }
    }
}

extension SlothsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sloths.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sloth = sloths[indexPath.row]
        let cell = slothsTableView.dequeueReusableCell(withIdentifier: "slothCell", for: indexPath)
        cell.textLabel?.text = "Speed: \(sloth.speed)"
        cell.detailTextLabel?.text = "Appendages: \(sloth.appendages) "
        return cell
    }    
}
