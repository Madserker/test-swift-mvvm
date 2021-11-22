//
//  WalletsScreenViewController.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 20/11/21.
//

import UIKit

class WalletsScreenViewController: UIViewController {

    @IBOutlet var generalView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let assetsCell = "AssetsTableViewCell"
    
    let viewModel = WalletsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if viewModel.showErrorPage {
            let alert = UIAlertController(
                title: self.viewModel.errorMessage, message: "", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Retry", style: .default) {_ in
                self.viewModel.retryLoadData()
                if self.viewModel.showErrorPage {
                    self.present(alert, animated: true)
                } else {
                    self.tableView.reloadData()
                }
            })

            self.present(alert, animated: true)
        }
    }
    
    private func setupUI() {
        generalView.backgroundColor = UIColor.primary
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        
        tableView.register(UINib(nibName: assetsCell, bundle: nil), forCellReuseIdentifier: assetsCell)
    }
}

extension WalletsScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel.wallets.count
        } else if section == 1 {
            return viewModel.commodityWallets.count
        } else {
            return viewModel.fiatWallets.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: assetsCell, for: indexPath) as? AssetsTableViewCell {
                cell.configureCell(asset: viewModel.wallets[indexPath.row])
                return cell
            } else {
                return UITableViewCell()
            }
        } else if indexPath.section == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: assetsCell, for: indexPath) as? AssetsTableViewCell {
                cell.configureCell(asset: viewModel.commodityWallets[indexPath.row])
                return cell
            } else {
                return UITableViewCell()
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: assetsCell, for: indexPath) as? AssetsTableViewCell {
                cell.configureCell(asset: viewModel.fiatWallets[indexPath.row])
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
