//
//  ViewController.swift
//  CollectionViewLayout
//
//  Created by Tan Christian on 16/04/19.
//  Copyright © 2019 Tan Christian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var newsData: [Result] = []
    
    @IBOutlet weak var newsCollection: UICollectionView!
    
    let jsonURLString : String = "https://api.nytimes.com/svc/topstories/v2/technology.json?api-key=bNWIDehmwXoP35vEBymP7nWkB4IyUchF"
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newsCollection.delegate = self
        newsCollection.dataSource = self
        
        newsCollection.register(UINib(nibName: "NewsCellLandscape", bundle: nil), forCellWithReuseIdentifier: "NewsCellLandscape")
        
        fetchNews()
        
    
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        print("rotate")
        
        DispatchQueue.main.async {
            self.newsCollection.reloadData()
        }
        
    }
    
    func fetchNews(){
        guard let url = URL(string: jsonURLString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            guard let data = data else {return}
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
    
                print(json)
//                print(result)
//                print(response)
                let course = try JSONDecoder().decode(NewsModel.self, from: data)
            
                course.results.enumerated().forEach({ (idx, result) in
                    self.newsData.append(result)
                    
                    DispatchQueue.main.async {
                        self.newsCollection.reloadData()
                    }
                })
                
            } catch let jsonErr{
                print("Error parsing json \(jsonErr)")
            }
        }.resume()
    }
    
    func fetchImage(){
        
    }
    
}

extension ViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if UIDevice.current.orientation.isLandscape {
            let cellLandscape = newsCollection.dequeueReusableCell(withReuseIdentifier: "NewsCellLandscape", for: indexPath) as! NewsCellLandscape
            cellLandscape.newsTitleLabel.text = newsData[indexPath.row].title
            cellLandscape.newsSnippetLabel.text = newsData[indexPath.row].abstract
            cellLandscape.newsDateLabel.text = newsData[indexPath.row].publishedDate
            
            return cellLandscape
        } else {
            let cell = newsCollection.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as! NewsViewCell
            cell.newsTitleLabel.text = newsData[indexPath.row].title
            cell.newsSnippetLabel.text = newsData[indexPath.row].abstract
            cell.newsDateLabel.text = newsData[indexPath.row].publishedDate
            return cell
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.orientation.isLandscape{
            
            return CGSize(width: (self.view.safeAreaLayoutGuide.layoutFrame.width-10)/4, height: view.frame.height)
        } else {
            return CGSize(width: view.frame.width, height: 370)
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

