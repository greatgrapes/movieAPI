//
//  MovieCellCollectionViewCell.swift
//  realMovieProject
//
//  Created by 박진성 on 2023/05/28.
//

import UIKit
import SnapKit
class MovieCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
       let iv = UIImageView()
        return iv
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    // 컬렉션뷰 셀에서 viewdidLoad 같은 역할.
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImageView()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setImageView() {
        addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview()
        }
    }
    
    
}
