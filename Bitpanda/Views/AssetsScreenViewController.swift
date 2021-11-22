//
//  AssetScreenViewController.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 20/11/21.
//

import UIKit

class AssetsScreenViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet var generalView: UIView!
    
    let assetsCell = "AssetsTableViewCell"
    
    let viewModel = AssetsViewModel()
    
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
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        
        tableView.register(UINib(nibName: assetsCell, bundle: nil), forCellReuseIdentifier: assetsCell)
    }
    
    private func setupUI() {
        generalView.backgroundColor = UIColor.primary
        segmentedControl.setTitle("Cryptocoins", forSegmentAt: 0)
        segmentedControl.setTitle("Commodities", forSegmentAt: 1)
        segmentedControl.setTitle("Fiats", forSegmentAt: 2)
    }
    
    @IBAction func segmentValueChanged(_ sender: Any) {
        tableView.reloadData()
    }
}

extension AssetsScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return viewModel.cryptocoins.count
        } else if segmentedControl.selectedSegmentIndex == 1 {
            return viewModel.commodities.count
        } else {
            return viewModel.fiats.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if segmentedControl.selectedSegmentIndex == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: assetsCell, for: indexPath) as? AssetsTableViewCell {
                cell.configureCell(asset: viewModel.cryptocoins[indexPath.row])
                return cell
            } else {
                return UITableViewCell()
            }
        } else if segmentedControl.selectedSegmentIndex == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: assetsCell, for: indexPath) as? AssetsTableViewCell {
                cell.configureCell(asset: viewModel.commodities[indexPath.row])
                return cell
            } else {
                return UITableViewCell()
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: assetsCell, for: indexPath) as? AssetsTableViewCell {
                cell.configureCell(asset: viewModel.fiats[indexPath.row])
                return cell
            } else {
                return UITableViewCell()
            }
        }
    }
}
