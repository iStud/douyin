//
//  DYMeController.swift
//  douyin
//
//  Created by bk.xiong on 2019/10/26.
//  Copyright © 2019 xiongbk. All rights reserved.
//

import UIKit
import SnapKit

class DYMeController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setNav()
        self.view.addSubview(collectionview)
        collectionview.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionview.snp.makeConstraints { (make) in
            
            make.edges.equalTo(view)
        }
        
        
    }
    
    func setNav() {
        
        // 导航了的颜色设置
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    

    lazy var flowLayout = UICollectionViewFlowLayout()

    lazy var collectionview: UICollectionView = {
        
        flowLayout.itemSize = CGSize(width:(UIScreen.main.bounds.width - 2)/3, height: 150)
        flowLayout.minimumLineSpacing = 1
        flowLayout.minimumInteritemSpacing = 1
        flowLayout.scrollDirection = .vertical
        
        let view = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        view.backgroundColor = UIColor.white
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
}

extension DYMeController{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 0
        }else{
            return 40
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(256)) / CGFloat(255), green: CGFloat(arc4random_uniform(256)) / CGFloat(255), blue: CGFloat(arc4random_uniform(256)) / CGFloat(255), alpha: 1.0)

        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0 {
            return CGSize(width: UIScreen.main.bounds.size.width, height: 200)
        }else{
            return CGSize.zero
        }
    }
    
    
}

