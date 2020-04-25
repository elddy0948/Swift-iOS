//
//  VideoListVC.swift
//  TableViewPractice(NoStoryBoard)
//
//  Created by 김호준 on 2020/04/25.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit
import Kingfisher
import WebKit

class VideoListVC: UIViewController, WKUIDelegate {
    
    var tableView = UITableView()
    var videos: [Video] = []
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadVideos()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        //set delegate
        setTableViewDelegate()
        //set row height
        tableView.rowHeight = 100
        //register cells
        tableView.register(VideoCell.self, forCellReuseIdentifier: "VideoCell")
        //set constraints
        tableView.pin(to: view)
    }
    
    func setTableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func loadVideos() {
        let video1 = Video()
        video1.key = "QX5n1x8VsiU"
        video1.title = "Duggy - 너와 하늘"
        videos.append(video1)
        let video2 = Video()
        video2.key = "U93AQIJ7-TI"
        video2.title = "Duggy - 시들지 않는 꽃"
        videos.append(video2)
    }
}
extension VideoListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as! VideoCell
        let video = videos[indexPath.row]
        let urlString = "https://img.youtube.com/vi/\(videos[indexPath.row].key)/0.jpg"
        let fileURL = URL(string: urlString)
        cell.videoImageView.kf.setImage(with: fileURL)
        cell.set(video: video)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.backgroundColor = .white
        self.view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.topAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            webView.leftAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            webView.bottomAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            webView.rightAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
        ])
        let webURL = URL(string: "https://www.youtube.com/embed/\(videos[indexPath.row].key)")
        let webRequest = URLRequest(url: webURL!)
        webView.load(webRequest)
    }
}

