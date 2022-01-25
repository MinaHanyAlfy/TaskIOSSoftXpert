//
//  HomeViewController.swift
//  SoftXpert
//
//  Created by John Doe on 2022-01-25.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var filterCollectionView: UICollectionView!
    @IBOutlet weak var resultsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        registerCell()
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
    }
//RegistCells
    private func registerCell(){
        filterCollectionView.register(UINib(nibName: "FilterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FilterCollectionViewCell")
    }

   

}
extension HomeViewController : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCollectionViewCell", for: indexPath) as! FilterCollectionViewCell
        cell.filterTitleLabel.text = "ALL"
        if indexPath.row % 2 == 0 {
            cell.mainView.backgroundColor = .yellow
        }else {
            cell.mainView.backgroundColor = .cyan
        }
        return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3 - 8 , height: collectionView.frame.height - 8)
    }
}
