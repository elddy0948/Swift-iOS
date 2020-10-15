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
    private var userPosts = [UserPost]()
    
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //첫번째 Section에는 아무것도 안나오게 한다.
        //두번째 Section부터 자신의 피드에 있는 사진들을 보여준다.
        if section == 0 {
            return 0
        }
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //UserPost에서 데이터를 가져옴.
//        let model = userPosts[indexPath.row]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.reuseIdentifier, for: indexPath) as? PhotoCollectionViewCell else {
            fatalError("Can't Create PhotoCollectionViewCell!!")
        }
//        cell.configure(with: model)
        cell.configure(debug: "test")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        // get the model and open post controller
        // 프로필 상에서 Post를 눌렀을 때 PostViewController로 이동.
//        let model = userPosts[indexPath.row]
        let user = User(username: "holuck", bio: "", name: (first: "", last: ""), birth: Date(), profilePhoto: URL(string: "https://www.google.com")!, gender: .male, counts: UserCount(follower: 1, following: 1, posts: 1), joinDate: Date())
        let post = UserPost(identifier: "", postType: .photo, thumbnailImage: URL(string: "https://google.com")!, postURL: URL(string: "https://google.com")!, caption: nil, likeCount: [], comment: [], createdDate: Date(), taggedUsers: [], owner: user)
        let vc = PostViewController(model: post)
        vc.title = post.postType.rawValue
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            //Footer
            return UICollectionReusableView()
        }
        
        if indexPath.section == 1 {
            //MARK: - Tabs header
            guard let tabHeader = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind, withReuseIdentifier: ProfileTabsCollectionReusableView.reuseIdentifier,
                    for: indexPath) as? ProfileTabsCollectionReusableView else {fatalError("Can't Make Tabs Header")}
            tabHeader.delegate = self
            return tabHeader
        }
        
        guard let profileHeader = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: ProfileHeaderInfoCollectionReusableView.reuseIdentifier,
                for: indexPath) as? ProfileHeaderInfoCollectionReusableView else {fatalError("Can't make Profile Header")}
        profileHeader.delegate = self
        return profileHeader
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        //Profile사진 있는 Section의 Size
        if section == 0 {
            return CGSize(width: collectionView.width, height: collectionView.height / 3)
        }
        
        //바로 밑에 Tab Section
        return CGSize(width: collectionView.width, height: 50)
    }
}

//MARK: - ProfileHeaderInfoCollectionReusableViewDelegate
extension ProfileViewController: ProfileHeaderInfoCollectionReusableViewDelegate {
    func profileHeaderDidTapPostButton(_ header: ProfileHeaderInfoCollectionReusableView) {
        // scroll to the posts
        collectionView?.scrollToItem(at: IndexPath(row: 0, section: 1), at: .top, animated: true)
    }
    
    func profileHeaderDidTapFollowerButton(_ header: ProfileHeaderInfoCollectionReusableView) {
        var mockData = [UserRelationship]()
        for x in 0..<10 {
            mockData.append(UserRelationship(username: "@hol", name: "Holuck", type: x % 2 == 0 ? .following : .notFollowing))
        }
        let vc = ListViewController(data: mockData)
        vc.title = "Followers"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func profileHeaderDidTapFollowingButton(_ header: ProfileHeaderInfoCollectionReusableView) {
        var mockData = [UserRelationship]()
        for x in 0..<10 {
            mockData.append(UserRelationship(username: "@hol", name: "Holuck", type: x % 2 == 0 ? .following : .notFollowing))
        }
        let vc = ListViewController(data: mockData)
        vc.title = "Following"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func profileHeaderDidTapEditProfileButton(_ header: ProfileHeaderInfoCollectionReusableView) {
        let vc = EditProfileViewController()
        vc.title = "Edit Profile"
        present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
}

//MARK: - ProfileTabsCollectionReusableViewDelegate
extension ProfileViewController: ProfileTabsCollectionReusableViewDelegate {
    func didTapGridButtonTab() {
        // Reload Collection View with data
    }
    
    func didTapTaggedButtonTab() {
        // Reload Collection View with data
    }
    
    
}
