//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource {
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
        coinManager.delegate = self
    }
    
    var selectedRow: String = ""
    var coinManager = CoinManager()
 
}

//MARK: -  UIPickerViewDelegate


extension ViewController: UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = coinManager.currencyArray[row]
        coinManager.getCoinPrice(with: selectedRow)
    }
    
    
}

//MARK: -  CoinManagerDelegate

extension ViewController: CoinManagerDelegate {
    
    //Permetto all'app di lavorare nel beckground così attraverso il DispatchQueue, al fine di non farla crushare.
    func didUpdateExcange(_ coinManager: CoinManager, coin: CoinModel) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = coin.excangeString
            self.currencyLabel.text = self.selectedRow
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
