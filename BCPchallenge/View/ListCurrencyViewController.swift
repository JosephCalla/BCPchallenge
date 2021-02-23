//
//  ListCurrencyViewController.swift
//  BCPchallenge
//
//  Created by Joseph Calla Moreyra on 22/02/21.
//

import UIKit

protocol ListCurrencyDelegate: class {
    func selectedCurrency(currency: CurrencyResponse)
    func getCurrencies(currencies: [CurrencyResponse])
}
class ListCurrencyViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    weak var delegate: ListCurrencyDelegate?
    private var viewModel = ListCurrencyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        loadCurrencyData()
    }
    
    private func loadCurrencyData() {
        viewModel.fetchCurrency { [weak self] in
            self?.tableView.dataSource = self
            self?.tableView.reloadData()
        } 
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: "CurrencyChangeCell", bundle: nil), forCellReuseIdentifier: "currencyChangeCell")
    }
}


extension ListCurrencyViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currencyChangeCell", for: indexPath) as! CurrencyChangeCell
        let currency = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(currency)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowViewModel = viewModel.currencyArray[indexPath.row]
        delegate?.selectedCurrency(currency: rowViewModel)
        delegate?.getCurrencies(currencies: viewModel.currencyArray)
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
