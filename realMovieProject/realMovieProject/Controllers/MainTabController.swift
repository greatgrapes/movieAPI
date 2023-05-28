//
//  ViewController.swift
//  realMovieProject
//
//  Created by 박진성 on 2023/05/28.
//

import UIKit

class MainTabController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let vc1 = UINavigationController(rootViewController: homeVC())
        let vc2 = likeListVC()
       
        self.setViewControllers([vc1, vc2], animated: false)
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black
        self.tabBar.backgroundColor = .white
        
        vc1.title = "영화목록"
        vc2.title = "좋아요"
        // 탭바 이미지 설정
        guard let items = self.tabBar.items else { return }
        items[0].image = UIImage(named: "home")
        items[1].image = UIImage(named: "lightbulb-off")
    }
    
 

}

