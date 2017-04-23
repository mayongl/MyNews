//
//  ImageViewController.swift
//  MyNews
//
//  Created by Yonglin Ma on 4/12/17.
//  Copyright © 2017 Sixlivesleft. All rights reserved.
//

import UIKit
import Alamofire


class ImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
//        print(self.tabBarItem.titleTextAttributes(for: UIControlState.normal) ?? "not found")
//        self.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.red, NSFontAttributeName: UIFont(name: "Heiti SC", size: 24.0)!], for: UIControlState.selected)
//        self.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.green, NSFontAttributeName: UIFont(name: "Heiti SC", size: 24.0)!], for: UIControlState.normal)
//    print(self.tabBarItem.titleTextAttributes(for: UIControlState.normal) ?? "not found")
//        print(self.tabBarItem.titleTextAttributes(for: UIControlState.selected) ?? "not found")
        getData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func getData() {
        let tag1 = "美女"
        let tag2 = "性感"
        
        let urlstr = "http://image.baidu.com/wisebrowse/data?tag1=" + "\(tag1)" + "&tag2=" + "\(tag2)"

        let urlstrEncoded = urlstr.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlPathAllowed)
        
        
        Alamofire.request(urlstrEncoded!).response{ //(completionHandler: <#T##(DefaultDataResponse) -> Void#>)
        response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.error)     // server data
            //print(response.result)   // result of response serialization            
            
           if let data = response.data as? Array<Any> {
            for d in data {
                print(d)
            }
            
//                print("JSON: \(JSON)")
            }
        }
    }

}
