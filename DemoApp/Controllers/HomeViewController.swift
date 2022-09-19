//
//  HomeViewController.swift
//  DemoApp
//
//  Created by TuPT on 19/09/2022.
//

import UIKit

class HomeViewController: UIViewController {
    let dataSource = UseCase.instance
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    private var listCategory: [Category]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        listCategory = dataSource.getListCategory()
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        let collectionCellItem = UINib(nibName: Constant.customCollectionItem, bundle: nil)
        let tableCellItem = UINib(nibName: Constant.customTableItem, bundle: nil)
        collectionView.register(collectionCellItem, forCellWithReuseIdentifier: Constant.collectionCellItemIdentifier)
        tableView.register(tableCellItem, forCellReuseIdentifier: Constant.tableCellItemIdentifier)
    }
}

extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.collectionCellItemIdentifier, for: indexPath) as! CollectionViewCell
        cell.labelTitle.text = listCategory![indexPath.row].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listCategory?.count ?? 0
    }
}

extension HomeViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.tableCellItemIdentifier, for: indexPath) as! TableViewCell
        return cell
    }
}
