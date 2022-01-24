//
//  CountryCollectionViewCell.swift
//  Task
//
//  Created by YoussefRomany on 24/01/2022.
//

import UIKit
import IBAnimatable
import Kingfisher

class CountryCollectionViewCell: UICollectionViewCell {

    //MARK:- IBOutlets
    @IBOutlet weak var countryImageView: AnimatableImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    
    //MARK:- Variables
    var viewModel: CountryDataViewModel? {
        didSet {
            bindViewModel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func bindViewModel() {
        countryNameLabel.text = viewModel?.title
        
        if let url = viewModel?.imageUrl{
            setImageView(forImageView: countryImageView, andURL: url, andPlaceHolderImage: "patternYazy")
         }
    }
}
