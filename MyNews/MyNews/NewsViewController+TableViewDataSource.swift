//
//  NewsViewController+TableViewDataSource.swift
//  MyNews
//
//  Created by Yong Lin Ma on 26/04/2017.
//  Copyright © 2017 Sixlivesleft. All rights reserved.
//

import UIKit

extension NewsViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "NewsImageCell", for: indexPath)
        var cell : UITableViewCell
        
        // Configure the cell...
        
        if indexPath.row == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "NewsImageCell", for: indexPath)
            
        } else {
            
            cell = tableView.dequeueReusableCell(withIdentifier: "NewsStandardCell", for: indexPath)
            
        }

        
        
        return cell
    }
    
}
