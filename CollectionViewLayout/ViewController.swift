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
        
        newsCollection.register(UINib(nibName: "NewsCellLandscape", bundle: nil), forCellWithReuseIdentifier: "NewsCellLandscape")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        print("rotate")
        
        DispatchQueue.main.async {
            self.newsCollection.reloadData()
        }
        
    }
    
    
    
}

extension ViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if UIDevice.current.orientation.isLandscape {
            let cellLandscape = newsCollection.dequeueReusableCell(withReuseIdentifier: "NewsCellLandscape", for: indexPath) as! NewsCellLandscape
            cellLandscape.newsTitleLabel.text = "Berita \(indexPath.row+1)"
            return cellLandscape
        } else {
            let cell = newsCollection.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as! NewsViewCell
            cell.newsTitleLabel.text = "Berita \(indexPath.row+1)"
            return cell
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.orientation.isLandscape{
            
            return CGSize(width: (self.view.safeAreaLayoutGuide.layoutFrame.width-10)/4, height: view.frame.height)
        } else {
            return CGSize(width: view.frame.width, height: 390)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 1
//
//    }
    
}

