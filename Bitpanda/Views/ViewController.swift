//
//  ViewController.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 20/11/21.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupUI()
    }
    
    private func setupTabBar() {
        let assetsScreen = AssetsScreenViewController()
        let walletsScreen = WalletsScreenViewController()
        
        self.setViewControllers([
            assetsScreen,
            walletsScreen,
        ], animated: false)
        
        guard let items = self.tabBar.items else { return }
        
        items[0].image = UIImage(systemName: "star")
        items[0].title = "Asset"
        
        items[1].image = UIImage(systemName: "bell")
        items[1].title = "Wallets"
    }
    
    private func setupUI() {
        self.modalPresentationStyle = .fullScreen
        self.tabBar.tintColor = .orange
        self.tabBar.backgroundColor = .white
    }
}
