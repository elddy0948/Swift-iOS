//
//  ViewController.swift
//  URLSession Practice
//
//  Created by 김호준 on 2020/08/11.
//  Copyright © 2020 김호준. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var musicItems: [Items] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.dataSource = self
    }

    @IBAction func fetchData(_ sender: UIButton) {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        guard let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=cohen") else {
            fatalError()
        }
        let _ = session.dataTask(with: url) { data, response, taskError in
            guard let httpResponse = response as? HTTPURLResponse,
                (200..<300).contains(httpResponse.statusCode) else {
                    return
            }
            guard let data = data else {
                return
            }
            let decoder: JSONDecoder = JSONDecoder()
            guard let response = try? decoder.decode(MusicItems.self, from: data) else {
                return
            }
            DispatchQueue.main.async {
                self.musicItems = response.results
            }
        }.resume()
        myTableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = musicItems[indexPath.row].trackName
        return cell
    }
}
