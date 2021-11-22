//
//  WalletsScreenViewController.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 20/11/21.
//

import UIKit

class WalletsScreenViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let assetsCell = "AssetsTableViewCell"
    
    let viewModel = WalletViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupUI()
    }
    
    private func setupUI() {
        
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        
        tableView.register(UINib(nibName: assetsCell, bundle: nil), forCellReuseIdentifier: assetsCell)
    }
}

extension WalletsScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel.getWallets().count
        } else if section == 1 {
            return viewModel.getCommodityWallets().count
        } else {
            return viewModel.getFiatWallets().count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: assetsCell, for: indexPath) as? AssetsTableViewCell {
                cell.configureCell(asset: viewModel.getWallets()[indexPath.row])
                return cell
            } else {
                return UITableViewCell()
            }
        } else if indexPath.section == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: assetsCell, for: indexPath) as? AssetsTableViewCell {
                cell.configureCell(asset: viewModel.getCommodityWallets()[indexPath.row])
                return cell
            } else {
                return UITableViewCell()
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: assetsCell, for: indexPath) as? AssetsTableViewCell {
                cell.configureCell(asset: viewModel.getFiatWallets()[indexPath.row])
                return cell
            } else {
                return UITableViewCell()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
           return "Wallets"
        } else if section == 1 {
            return "Commodity Wallets"
        } else {
            return "Fiat Wallets"
        }
    }

}
