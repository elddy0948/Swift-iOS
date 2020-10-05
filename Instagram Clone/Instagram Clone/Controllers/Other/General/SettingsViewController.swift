//
//  SettingsViewController.swift
//  Instagram Clone
//
//  Created by 김호준 on 2020/09/28.
//

import SafariServices
import UIKit

struct SettingCellModel {
    let title: String
    let handler:(() -> Void)
}

///View controller to show user settings
class SettingsViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    
    private var data = [[SettingCellModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureModels()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
    }
    
    private func configureModels() {
        data.append([
            SettingCellModel(title:  "Edit Profile", handler: { [weak self] in
                self?.didTapEditProfile()
            }),
            SettingCellModel(title:  "Invite Friends", handler: { [weak self] in
                self?.didTapInviteFriends()
            }),
            SettingCellModel(title:  "Save Original Posts", handler: { [weak self] in
                self?.didTapSaveOriginalPosts()
            })
        ])
        
        data.append([
            SettingCellModel(title:  "Terms of Service", handler: { [weak self] in
                self?.openURL(type: .terms)
            }),
            SettingCellModel(title: "Privacy Policy", handler: { [weak self] in
                self?.openURL(type: .privacy)
            }),
            SettingCellModel(title: "Help / Feedback", handler: { [weak self] in
                self?.openURL(type: .help)
            })
        ])
        
        data.append([
            SettingCellModel(title:  "Log Out", handler: { [weak self] in
                self?.didTapLogOut()
            })
        ])
    }
    
    enum SettingURLType {
        case terms, privacy, help
    }
    
    private func openURL(type: SettingURLType) {
        let urlString: String
        
        switch type {
        case .terms:
            urlString = "https://help.instagram.com/581066165581870?ref=dp"
        case .privacy:
            urlString = "https://help.instagram.com/519522125107875"
        case .help:
            urlString = "https://help.instagram.com/"
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
    }
    
    private func didTapEditProfile() {
        let vc = EditProfileViewController()
        vc.title = "Edit Profile"
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
    }
    
    private func didTapInviteFriends() {
        // Show Share sheet to invite friends
    }
    
    private func didTapSaveOriginalPosts() {
        
    }
    
    private func didTapLogOut() {
        
        let actionSheet = UIAlertController(title: "Log Out",
                                            message: "Are you sure you want to Log Out?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { _ in
            AuthManager.shared.logout { (success) in
                DispatchQueue.main.async {
                    if success {
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true) {
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }
                    } else {
                        fatalError("Could not Log Out User")
                    }
                }
            }
        }))
        //For iPad
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        
        present(actionSheet, animated: true, completion: nil)
    }
}

//MARK: - UITableViewDelegate
extension SettingsViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Handle cell selection
        let model = data[indexPath.section][indexPath.row]
        model.handler()
    }
}

//MARK: - UITableViewDataSource
extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
