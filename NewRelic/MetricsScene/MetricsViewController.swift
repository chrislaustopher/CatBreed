//
//  MetricsViewController.swift
//  NewRelic
//
//  Created by newrelic on 8/16/20.
//  Copyright © 2020 newrelic. All rights reserved.
//

import Foundation
import UIKit

struct MetricsAttribute {
    let label: String
    let value: String
}

public var responseValue = 0.0
public var responseValueCount = 0.0

class MetricsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Metrics"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 140
        tableView.separatorStyle = .none
        tableView.bounces = false
    }
    
    func recalculate(newVal: Double) {
        responseValue = responseValue + newVal
        responseValueCount = responseValueCount + 1
        print("--")
        print(responseValue)
        print(newVal)
        print(responseValueCount)
    }
}

extension MetricsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        // average response time, make/model, os version => 3
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MetricsCell", for: indexPath) as? MetricsTableViewCell
        cell?.configure(MetricsAttribute(label: "cat breed list (limit 30) avg response time", value: String(format: "%f", responseValue / (responseValueCount == 0.0 ? 1.0 : responseValueCount))))
        return cell!
    }
}
