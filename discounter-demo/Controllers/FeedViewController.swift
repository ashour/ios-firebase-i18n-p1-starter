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
    
    @IBOutlet weak var feedTableView: UITableView!
    
    var productListener: Product.Listener?
    
    fileprivate var products: [Product] = []
    {
        didSet
        {
            feedTableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        productListener = Product.listenToFeed
        {
            [unowned self] in self.products = $0
        }
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        productListener?.remove()
    }
    
    // MARK: TableView
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int)
        -> Int
    {
        return products.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL") as!
                    FeedTableViewCell
            
        cell.updateUI(with: products[indexPath.row])
            
        return cell
    }
}

