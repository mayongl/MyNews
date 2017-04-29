//
//  ImageCollectionViewController.swift
//  MyNews
//
//  Created by Yonglin Ma on 4/24/17.
//  Copyright © 2017 Sixlivesleft. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SDWebImage

private let reuseIdentifier = "ImageCell"

var images : [NSDictionary] = []

class ImageCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func getData() {
        let tag1 = "美女"
        let tag2 = "性感"
        
        let urlstr = "http://image.baidu.com/wisebrowse/data?tag1=" + "\(tag1)" + "&tag2=" + "\(tag2)"+"&pn=1&rn=60"
        //let urlstrEncoded = "http://image.baidu.com/wisebrowse/data?tag1=%E7%BE%8E%E5%A5%B3&tag2=%E6%80%A7%E6%84%9F&pn=0&rn=6"
        
        //let urlstrEncoded = urlstr.addingPercentEscapes(using: String.Encoding.utf8)
        //let urlstrEncoded = urlstr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed)
        let urlstrEncoded = urlstr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        
        Alamofire.request(urlstrEncoded!).responseJSON { response in
            print(response.result)   // result of response serialization
            
//            var propertyListResponse: PropertyList?
//            propertyListResponse = try? JSONSerialization.jsonObject(with: response.data!, options: .allowFragments)


            if let dictionary = response.result.value as? NSDictionary {
                print(dictionary[ImageResponseKey.msg]!)

                images = dictionary[ImageResponseKey.imgs] as! [NSDictionary]
            }
            self.collectionView?.reloadData()

        }
    }
    
//    [[BaseEngine shareEngine] runRequestWithPara:dic path:urlstr success:^(id responseObject) {
//    
//    NSArray *dataarray = [Photo objectArrayWithKeyValuesArray:responseObject[@"imgs"]];
//    NSMutableArray *statusFrameArray = [NSMutableArray array];
//    for (Photo *photo in dataarray) {
//    [statusFrameArray addObject:photo];
//    }
//    
//    if (block_self.photoArray.count > 0) {
//    [block_self.photoArray removeAllObjects];
//    }
//    block_self.photoArray  = statusFrameArray;
//    
//    block_self.pn += 60;
//    block_self.collectionView.footer.hidden = block_self.photoArray.count < 60;
//    [block_self.collectionView reloadData];
//    [block_self.collectionView.header endRefreshing];
//    [block_self.collectionView.footer endRefreshing];
    
//    + (NSArray *)objectArrayWithKeyValuesArray:(NSArray *)keyValuesArray
//    {
//    // 1.判断真实性
//    NSString *desc = [NSString stringWithFormat:@"keyValuesArray is not a keyValuesArray - keyValuesArray不是一个数组, keyValuesArray is a %@ - keyValuesArray参数是一个%@", keyValuesArray.class, keyValuesArray.class];
//    MJAssert2([keyValuesArray isKindOfClass:[NSArray class]], desc, nil);
//    
//    // 2.创建数组
//    NSMutableArray *modelArray = [NSMutableArray array];
//    
//    // 3.遍历
//    for (NSDictionary *keyValues in keyValuesArray) {
//    if (![keyValues isKindOfClass:[NSDictionary class]]) continue;
//    
//    id model = [self objectWithKeyValues:keyValues];
//    [modelArray addObject:model];
//    }
//    
//    return modelArray;
//    }

//    private func fetchImage() {
//        if let url = imageURL {
//            spinner.startAnimating()
//            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
//                let urlContents = try? Data(contentsOf: url)
//                if let imageData = urlContents, url == self?.imageURL {
//                    DispatchQueue.main.async {
//                        self?.image = UIImage(data: imageData)
//                    }
//                }
//            }
//        }
//    }
//
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        print(images.count)
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageBrowseCollectionViewCell
    
        // Configure the cell
        let dic = images[indexPath.row]
        cell.label.text = dic[ImgsKey.title] as? String
        let url = URL(string: (dic[ImgsKey.image_url] as? String)!)
        print(url)
        cell.image.sd_setImage(with: url)
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

    struct ImageResponseKey {
        static let errno = "errno"
        static let imgs = "imgs"
        static let msg = "msg"
        static let returnNumber = "returnNumber"
        static let startIndex = "startIndex"
        static let tag1 = "tag1"
        static let tag2 = "tag2"
        static let tag3 = "tag3"
        static let totalNum = "totalNum"
    }
    
    struct ImgsKey {
        static let albumNum = "albumNum"
        static let content_sign = "content_sign"
        static let dataId = "dataId"
        static let fromurl = "fromurl"
        static let image_height = "image_height"
        static let image_url = "image_url"
        static let image_width = "image_width"
        static let mid_height = "mid_height"
        static let mid_url = "mid_url"
        static let set_id = "set_id"
        static let small_height = "small_height"
        static let small_url = "small_url"
        static let small_width = "small_width"
        static let title = "title"
    }
    
}

