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
        
        // 设置导航栏
        setNav()
        
        // 添加collectionview
        self.view.addSubview(collectionview)
        
        // 注册cell
        collectionview.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        // 注册头视图
        collectionview.register(UICollectionReusableView.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        
        //注册尾视图
        collectionview.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footer")
        
        collectionview.snp.makeConstraints { (make) in
            
            make.edges.equalTo(view)
        }
        
        
    }
    
    func setNav() {
        
        // 导航的颜色设置
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
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 0
        }else{
            return 15
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor(red: CGFloat(arc4random_uniform(256)) / CGFloat(255), green: CGFloat(arc4random_uniform(256)) / CGFloat(255), blue: CGFloat(arc4random_uniform(256)) / CGFloat(255), alpha: 1.0)

        return cell
        
    }
    
    // 设置头尾视图的内容
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if indexPath.section == 0{
            
            if kind == UICollectionView.elementKindSectionHeader{
                
                let header = collectionview.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath)
                header.backgroundColor = UIColor.gray
                return header
                
            }else{
                
               let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footer", for: indexPath)
                footer.backgroundColor = UIColor.yellow
                return footer
            }
            
          
        }
        return UICollectionReusableView.init()
    }
    
    
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    // 分组中头部视图的大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0 { // 第1组高度为200
            
            return CGSize(width: UIScreen.main.bounds.size.width, height: 200)
            
        }else{
            return CGSize.zero
        }
    }
    
    // 分组中尾视图的大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section == 0 {
            
            return CGSize(width: UIScreen.main.bounds.size.width, height: 70)
            
        }else{
            return CGSize.zero
        }
    }
    
}

