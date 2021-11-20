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

    }
}

extension AssetsScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCryptocoins().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = assetsTableView.dequeueReusableCell(withIdentifier: assetsCell, for: indexPath) as? AssetsTableViewCell {
            cell.configureCell(name: viewModel.getCryptocoins()[indexPath.row].name)
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
