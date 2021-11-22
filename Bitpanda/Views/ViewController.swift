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
        
        items[0].image = UIImage(systemName: "bitcoinsign.circle")
        items[0].title = "Assets"
        
        items[1].image = UIImage(systemName: "wallet.pass")
        items[1].title = "Wallets"
    }
    
    private func setupUI() {
        self.modalPresentationStyle = .fullScreen
        self.tabBar.tintColor = UIColor.primary
        self.tabBar.backgroundColor = UIColor.secondary
    }
}
