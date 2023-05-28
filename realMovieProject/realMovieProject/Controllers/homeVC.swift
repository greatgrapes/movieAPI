//
//  homeVC.swift
//  realMovieProject
//
//  Created by 박진성 on 2023/05/28.
//  네트워킹API 연습

import UIKit
import SnapKit

class homeVC: UIViewController {
    
    var movieManager = MovieDataManager()
    
    private let cellReuseIdentifier = "MovieCell"
    
    let images = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg", "11.jpg"]
    

    private var collectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeSearchBar()
        makeUI()
        self.collectionView.register(MovieCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        movieManager.getData()
    }
    
    func makeSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "영화 검색"
        searchController.obscuresBackgroundDuringPresentation = false
        
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "영화검색"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white
    }
    
    
    func makeUI() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalToSuperview().offset(0)
        }
        
    }
    
    
    
}
    
    extension homeVC: UICollectionViewDataSource {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return images.count
        }
        
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as? MovieCell else
            { return UICollectionViewCell() }
            cell.imageView.image = UIImage(named: images[indexPath.row])
            return cell
        }
        
}
    
    
    extension homeVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print("DEBUG:: \(indexPath.row)번째 셀이 터치됨")
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.frame.width / 3 - 1
            return CGSize(width: width, height: width)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 1
        }
        
}
    

