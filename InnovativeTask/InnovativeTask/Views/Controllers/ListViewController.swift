//
//  ListViewController.swift
//  InnovativeTask
//
//  Created by Muzamil Hassan on 24/01/2021.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    private var productViewModels : ProductViewModel!
    private var dataSource : ProductTableViewDataSource<ProductCell,Product>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.rowHeight = UITableView.automaticDimension
        tblView.estimatedRowHeight = 244.0;
        tblView.registerCell(ProductCell.self)
        self.showSpinner()
        initializeViewModel()
    }
    func initializeViewModel(){
        
        self.productViewModels =  ProductViewModel()
        self.productViewModels.bindProductViewModelToController = {[weak self]  in
            self?.removeSpinner()
            self?.updateDataSource()
        }
        self.productViewModels.bindApiError = {[weak self] (error) in
            print(error)
            self?.removeSpinner()
            self?.showAlert(title: "Error", message: error)
        }
    }
    func updateDataSource(){
        
        self.dataSource = ProductTableViewDataSource(cellIdentifier: ProductCell.identifier(), items: self.productViewModels.productData.itemList, configureCell: { (cell, product) in
            cell.product = product
        })
        
        DispatchQueue.main.async {
            self.tblView.dataSource = self.dataSource
            self.tblView.reloadData()
        }
    }
    
    
}


