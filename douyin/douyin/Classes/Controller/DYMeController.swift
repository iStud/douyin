//
//  DYMeController.swift
//  douyin
//
//  Created by bk.xiong on 2019/10/26.
//  Copyright © 2019 xiongbk. All rights reserved.
//

import UIKit

class DYMeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 导航了的颜色设置
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        view.backgroundColor = UIColor.brown
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
