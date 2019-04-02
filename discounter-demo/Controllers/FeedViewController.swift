//
//  ViewController.swift
//  discounter-demo
//
//  Created by Mohammad Ashour on 2019-04-01.
//  Copyright © 2019 Mohammad Ashour. All rights reserved.
//

import UIKit

class FeedViewController:
    UIViewController,
    UITableViewDelegate,
    UITableViewDataSource
{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int)
        -> Int
    {
        return products.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL") as!
                    FeedTableViewCell
            
        let product = products[indexPath.row]
            
        cell.updateUI(with: product)
            
        return cell
    }
}

