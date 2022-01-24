//
//  ContinentTableViewCell.swift
//  Task
//
//  Created by YoussefRomany on 24/01/2022.
//

import UIKit

class ContinentTableViewCell: UITableViewCell {

    //MARK:- IBOutlets
    @IBOutlet weak var continentNameLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var continentCollectionView: UICollectionView!
    
    //MARK:- ViewModel
    var offersViewModel: [OfferDataViewModel]? {
        didSet {
            bindViewModel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        initCommonCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- IBActions
    @IBAction func seeAllAction(_ sender: Any) {
    }
}


//MARK:- Helpers
extension ContinentTableViewCell{
    
    
    // init common collection view
    func initCommonCollectionView() {
        continentCollectionView.register(UINib(nibName: "OfferCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OfferCollectionViewCell")
        continentCollectionView.delegate = self
        continentCollectionView.dataSource = self

    }
    
    func bindViewModel() {
        continentCollectionView.reloadData()
    }

}



//MARK:- UICollection View Delegate,DataSource
extension ContinentTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCollectionViewCell", for: indexPath) as! OfferCollectionViewCell
        Cell.viewModel = offersViewModel?[indexPath.row]
        return Cell
        
     }

     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }

     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 0, bottom:0 , right: 0)

     }

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offersViewModel?.count ?? 0
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width:CGFloat = (collectionView.frame.width-15)/1.94
            let height:CGFloat = collectionView.frame.height
            return CGSize(width:width ,height: height)
        
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return (10)
     }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         return 0
     }

}
