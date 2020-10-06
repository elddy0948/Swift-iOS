//
//  ProfileViewController.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/09/28.
//

import UIKit

/// Profile View Controller
class ProfileViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureNavigationBar()
        
        let layout = UICollectionViewFlowLayout()
        let size = (view.width - 4) / 3
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.sectionInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
        layout.itemSize = CGSize(width: size, height: size)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.backgroundColor = .red
        
        //Cell
        collectionView?.register(PhotoCollectionViewCell.self,
                                 forCellWithReuseIdentifier: PhotoCollectionViewCell.reuseIdentifier)
        //Header
        collectionView?.register(ProfileHeaderInfoCollectionReusableView.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                 withReuseIdentifier: ProfileHeaderInfoCollectionReusableView.reuseIdentifier)
        collectionView?.register(ProfileTabsCollectionReusableView.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                 withReuseIdentifier: ProfileTabsCollectionReusableView.reuseIdentifier)
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        guard let collectionView = collectionView else {
            return
        }
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView?.frame = view.bounds
        
    }
    
    private func configureNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done,
                                                            target: self, action: #selector(didTapSettingButton))
    }
    @objc private func didTapSettingButton() {
        let vc = SettingsViewController()
        vc.title = "Settings"
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.reuseIdentifier, for: indexPath) as? PhotoCollectionViewCell else {
            fatalError("Can't Create PhotoCollectionViewCell!!")
        }
        cell.configure(debug: "test")
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
