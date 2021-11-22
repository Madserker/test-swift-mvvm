//
//  AssetScreenViewController.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 20/11/21.
//

import UIKit

class AssetsScreenViewController: UIViewController {
    
    @IBOutlet weak var assetsTableView: UITableView!
    @IBOutlet weak var assetsSegmentedControl: UISegmentedControl!
    
    let assetsCell = "AssetsTableViewCell"
    
    let viewModel = AssetsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupUI()
    }
    
    private func setupTableView() {
        assetsTableView.delegate = self
        assetsTableView.dataSource = self
        assetsTableView.showsVerticalScrollIndicator = false
        
        assetsTableView.register(UINib(nibName: assetsCell, bundle: nil), forCellReuseIdentifier: assetsCell)
    }
    
    private func setupUI() {
        assetsSegmentedControl.setTitle("Cryptocoins", forSegmentAt: 0)
        assetsSegmentedControl.setTitle("Commodities", forSegmentAt: 1)
        assetsSegmentedControl.setTitle("Fiats", forSegmentAt: 2)
    }
    
    @IBAction func segmentValueChanged(_ sender: Any) {
        assetsTableView.reloadData()
    }
}

extension AssetsScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if assetsSegmentedControl.selectedSegmentIndex == 0 {
            return viewModel.getCryptocoins().count
        } else if assetsSegmentedControl.selectedSegmentIndex == 1 {
            return viewModel.getCommodities().count
        } else {
            return viewModel.getFiats().count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if assetsSegmentedControl.selectedSegmentIndex == 0 {
            if let cell = assetsTableView.dequeueReusableCell(withIdentifier: assetsCell, for: indexPath) as? AssetsTableViewCell {
                cell.configureCell(asset: viewModel.getCryptocoins()[indexPath.row])
                return cell
            } else {
                return UITableViewCell()
            }
        } else if assetsSegmentedControl.selectedSegmentIndex == 1 {
            if let cell = assetsTableView.dequeueReusableCell(withIdentifier: assetsCell, for: indexPath) as? AssetsTableViewCell {
                cell.configureCell(asset: viewModel.getCommodities()[indexPath.row])
                return cell
            } else {
                return UITableViewCell()
            }
        } else {
            if let cell = assetsTableView.dequeueReusableCell(withIdentifier: assetsCell, for: indexPath) as? AssetsTableViewCell {
                cell.configureCell(asset: viewModel.getFiats()[indexPath.row])
                return cell
            } else {
                return UITableViewCell()
            }
        }
    }
}
