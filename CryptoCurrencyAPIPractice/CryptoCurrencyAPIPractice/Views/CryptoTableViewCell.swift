//
//  CryptoTableViewCell.swift
//  CryptoCurrencyAPIPractice
//
//  Created by 김호준 on 2021/01/19.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {
    static let reuseIdentifier = String(describing: CryptoTableViewCell.self)
    
    private let cryptoName: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cryptoName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cryptoName.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
    }
    
    public func configureCell(with model: CryptoCurrency) {
        cryptoName.text = model.name
    }
}
