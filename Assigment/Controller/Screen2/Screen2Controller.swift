//
//  Screen2Controller.swift
//  Assigment
//
//  Created by lov niveriya on 17/09/21.
//

import UIKit

class Screen2Controller: UIViewController{
 
    
    @IBOutlet weak var cTabelView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var data = ["Glucose","Pulse","Temperature"]
    var week = ["Mon","Tue","Wen","Thu","Fri","Sat","Sun"]
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        cTabelView.delegate = self
        cTabelView.dataSource = self
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.collectionView.showsHorizontalScrollIndicator = false
        let floawLayout = UPCarouselFlowLayout()
        floawLayout.itemSize = CGSize(width: 70, height: 70)
        floawLayout.scrollDirection = .horizontal
        floawLayout.sideItemScale = 0.8
        floawLayout.sideItemAlpha = 1.0
        floawLayout.spacingMode = .fixed(spacing: 20.0)
        collectionView.collectionViewLayout = floawLayout
        
        // Do any additional setup after loading the view.
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
    }
    fileprivate var currentPage: Int = 0 {
        didSet {
            print("page at centre = \(currentPage)")
        }
    }
    
    fileprivate var pageSize: CGSize {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
        } else {
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
}

// MARK:- Tabel View Delegate

extension Screen2Controller:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "test1") as! TableViewCell
        cell.backgroundColor = .clear
        cell.MainLabel.text = data[indexPath.row]
        if indexPath == [0,0]{
            cell.Imaget.image = UIImage(named: "glucose")
        }
        else if indexPath == [0,1]{
            cell.Imaget.image = UIImage(named: "heart")
        }
        else if indexPath == [0,2]{
            cell.Imaget.image = UIImage(named: "temp")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

// MARK:- Collection View Delegate

extension Screen2Controller:UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "week", for: indexPath as IndexPath) as! weekCollectionViewCell
        cell.layer.cornerRadius = 10
        cell.TextLabelC.text = week[indexPath.row]
        return cell
    }
    
    
}
