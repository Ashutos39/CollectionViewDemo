//
//  ViewController.swift
//  CollectionViewDemoAshutos
//
//  Created by Ashutos on 01/09/19.
//  Copyright © 2019 Ashutos. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var segmentControllerTag = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        collectionView.register(UINib(nibName: "WKWebViewCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WKWebViewCollectionViewCell")
        
        
        let height = collectionView.bounds.height
        let width = collectionView.bounds.width
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width : width, height: height )
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        collectionView.collectionViewLayout = layout
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func segmentControllerDidChange(_ sender: Any) {
        
        segmentControllerTag = segmentController.selectedSegmentIndex
        collectionView.reloadData()
        
    }
}


extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if segmentControllerTag == 1{
            let ImgCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell
            
            ImgCell?.ImageView.image = UIImage(named: "sample")
            
            return ImgCell ?? UICollectionViewCell()
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WKWebViewCollectionViewCell", for: indexPath) as? WKWebViewCollectionViewCell
            var request: URLRequest?
            switch segmentControllerTag{
            case 0:
                let videoUrlString = "https://www.youtube.com/watch?v=Mc0TMWYTU_k"
                request = URLRequest(url: URL(string: videoUrlString)!)
            case 2:
                let docx = NSURL(fileURLWithPath:Bundle.main.path(forResource: "demo", ofType:"docx")!)
                request = URLRequest(url: docx as URL)
            default:
                let pdfLoc = NSURL(fileURLWithPath:Bundle.main.path(forResource: "sample", ofType:"pdf")!)
                request = URLRequest(url: pdfLoc as URL)
            }
            
            cell?.webView.load(request!)
            return cell ?? UICollectionViewCell()
        }
        
    }
    
}



