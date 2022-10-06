//
//  CatDetailsViewController.swift
//  NewRelic
//
//  Created by newrelic on 8/16/20.
//  Copyright © 2020 newrelic. All rights reserved.
//

import Foundation

import UIKit

struct CatAttribute {
    let label: String
    let value: String
}
class CatDetailsViewController: UIViewController {
        
    @IBOutlet weak var tableView: UITableView!
    
    var detailIndex: CatDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 140
        tableView.separatorStyle = .none
        tableView.bounces = false
    }
}

extension CatDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        // breed, country, origin, coat, pattern => 5
        return 5
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatDetailCell", for: indexPath) as? CatDetailTableViewCell
        
        var detailArr: [CatAttribute] = []
        
        let noValue = "unknown"
        
        if let detailIndex {
            detailArr.append(CatAttribute(label: "breed", value: detailIndex.breed != "" ? detailIndex.breed : noValue))
            detailArr.append(CatAttribute(label: "country", value: detailIndex.country != "" ? detailIndex.country : noValue))
            detailArr.append(CatAttribute(label: "origin", value: detailIndex.origin != "" ? detailIndex.origin : noValue))
            detailArr.append(CatAttribute(label: "coat", value: detailIndex.coat != "" ? detailIndex.coat : noValue))
            detailArr.append(CatAttribute(label: "pattern", value: detailIndex.pattern != "" ? detailIndex.pattern : noValue))
        }
        cell?.configure(detailArr[indexPath.row])
        cell?.selectionStyle = .none
        return cell!
    }
}
