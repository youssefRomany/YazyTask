//
//  OfferCollectionViewCell.swift
//  Task
//
//  Created by YoussefRomany on 24/01/2022.
//

import UIKit
import IBAnimatable

class OfferCollectionViewCell: UICollectionViewCell {

    //MARK:- IBOutlets
    @IBOutlet weak var offerImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var multiTripView: AnimatableView!
    
    //MARK:- View Model
    var viewModel: OfferDataViewModel? {
        didSet {
            bindViewModel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK:- IBActions
    @IBAction func makeFavUnFaveAction(_ sender: Any) {
    }
    
    private func bindViewModel() {
        titleLabel.text = viewModel?.title
        destinationLabel.text = viewModel?.destination
        priceLabel.text = viewModel?.priceWithCurrency
        durationLabel.text = viewModel?.duration
        multiTripView.isHidden = !(viewModel?.isMultiCities ?? false)
        likesCountLabel.text = "\(viewModel?.favouriteCount ?? 0)"
        if let url = viewModel?.imageUrl{
            setImageView(forImageView: offerImageView, andURL: url, andPlaceHolderImage: "patternYazy")
         }
    }
}
