//
//  AssetsTableViewCell.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 20/11/21.
//

import UIKit
import SVGKit

class AssetsTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var symbol: UILabel!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupUI() {
        leftView.backgroundColor = UIColor.cellCapsule
        leftView.clipsToBounds = true
        leftView.layer.cornerRadius = 20
        leftView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        rightView.backgroundColor = UIColor.cellCapsule
        rightView.layer.cornerRadius = 20
        rightView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        name.font = UIFont.primary
        symbol.font = UIFont.primary
        price.font = UIFont.secondary
        
        price.textColor = UIColor.appGrey
    }
    
    public func configureCell(asset: Asset) {
        DispatchQueue.main.async {
            let urlString = self.traitCollection.userInterfaceStyle == .light ? asset.iconURL : asset.darkIconURL
            DispatchQueue.global(qos: .background).async { [weak self] () -> Void in
                if let url = URL(string: urlString) {
                    if let data = NSData(contentsOf: url as URL) {
                        DispatchQueue.main.async {
                            let svgImage: SVGKImage = SVGKImage(data: data as Data)
                            self?.icon.image = svgImage.uiImage
                        }
                    }
                }
            }
        }
        self.name.text = asset.name
        self.symbol.text = asset.symbol
        
        if let commodity = asset as? Commodity {
            self.price.isHidden = false
            self.price.text = commodity.price
        } else if let wallet = asset as? Wallet {
            self.price.text = wallet.balance
            if wallet.isDefault {
                leftView.backgroundColor = UIColor.primary
                rightView.backgroundColor = UIColor.primary
            } else {
                leftView.backgroundColor = UIColor.cellCapsule
                rightView.backgroundColor = UIColor.cellCapsule
            }
        } else {
            self.price.isHidden = true
        }
    }
    
}
