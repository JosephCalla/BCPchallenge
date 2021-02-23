//
//  CurrencyChangeCell.swift
//  BCPchallenge
//
//  Created by Joseph Calla Moreyra on 21/02/21.
//

import UIKit

class CurrencyChangeCell: UITableViewCell {

    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var convertionLabel: UILabel!
    
    private let identifier = "currencyChangeCell"
    private var urlString: String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCellWithValuesOf(_ currency: CurrencyResponse) {
        updateUI(countryName: currency.country, countryImage: currency.image, money: currency.symbol, convertion: currency.rate)
    }
    
    private func updateUI(countryName: String, countryImage: String?, money: String, convertion: Double){
        
        self.countryNameLabel.text = countryName
        guard let imageURL = countryImage else {return}
        
        guard let posterImageURL = URL(string: imageURL) else {
            self.countryImage.image = UIImage(named: "noImageAvailable")
            return
        }

        self.convertionLabel.text = "1 EUR = \(convertion) \(money)"
        self.countryImage.image = nil

        self.getImageDataFrom(url: posterImageURL)
        
    }
    
    private func getImageDataFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle Error
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.countryImage.image = image
                }
            }
        }.resume()
    }
    
}
