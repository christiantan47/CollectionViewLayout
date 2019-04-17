//
//  ViewController.swift
//  CollectionViewLayout
//
//  Created by Tan Christian on 16/04/19.
//  Copyright © 2019 Tan Christian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newsCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newsCollection.delegate = self
        newsCollection.dataSource = self
    }


}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = newsCollection.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as! NewsViewCell
        cell.newsLabel.text = "Berita \(indexPath.row)"
        return cell
    }
    
}

