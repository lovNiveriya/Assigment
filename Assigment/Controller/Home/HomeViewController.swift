//
//  HomeViewController.swift
//  Assigment
//
//  Created by lov niveriya on 17/09/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var dashedView: UIView!
    @IBOutlet weak var collectionView2: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        dashedView.makeDashedBorderLine()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView2.dataSource = self
        collectionView2.delegate = self
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView2.showsVerticalScrollIndicator = false
        let floawLayout = UPCarouselFlowLayout()
        let floawLayout2 = UPCarouselFlowLayout()
        floawLayout.itemSize = CGSize(width: 240, height: 104
        )
        floawLayout.scrollDirection = .horizontal
        floawLayout.sideItemScale = 0.8
        floawLayout.sideItemAlpha = 1.0
        floawLayout.spacingMode = .fixed(spacing: 20.0)
        
        floawLayout2.itemSize = CGSize(width: 240, height: 120
        )
        floawLayout2.scrollDirection = .vertical
        floawLayout2.sideItemScale = 0.8
        floawLayout2.sideItemAlpha = 1.0
        floawLayout2.spacingMode = .fixed(spacing: 10.0)
        collectionView2.collectionViewLayout = floawLayout2
        collectionView.collectionViewLayout = floawLayout
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //dasedLine(view: dashedView)
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
    
    func scrollViewDidEndDecelerating1(_ scrollView: UIScrollView) {
        let layout = self.collectionView2.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .vertical) ? self.pageSize1.width : self.pageSize1.height
        let offset = (layout.scrollDirection == .vertical) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage1 = Int(floor((offset - pageSide / 2) / pageSide) + 1)
    }
    fileprivate var currentPage1: Int = 0 {
        didSet {
            print("page at centre = \(currentPage1)")
        }
    }
    
    fileprivate var pageSize1: CGSize {
        let layout = self.collectionView2.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .vertical {
            pageSize.width += layout.minimumLineSpacing
        } else {
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
}
// MARK:- Collection View Delegate

extension HomeViewController:UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView{
            return 7
        }
        else{
            
            return 5
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "home", for: indexPath as IndexPath) as! homeCollectionViewCell
            cell.layer.cornerRadius = 8
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "inner", for: indexPath as IndexPath) as! InnerCollectionViewCell
            cell.layer.cornerRadius = 8
            return cell
        }
        
    }
}


extension UIView {
    private static let lineDashPattern: [NSNumber] = [10, 10]
    private static let lineDashWidth: CGFloat = 200.0

    func makeDashedBorderLine() {
        let path = CGMutablePath()
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = UIView.lineDashWidth
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.lineDashPattern = UIView.lineDashPattern
        path.addLines(between: [CGPoint(x: bounds.minX, y: bounds.height),
                                CGPoint(x: bounds.maxX, y: bounds.height)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
}
