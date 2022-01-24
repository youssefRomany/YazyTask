//
//  HomeViewController.swift
//  Task
//
//  Created by YoussefRomany on 24/01/2022.
//

import UIKit
import ZLSwipeableViewSwift
import UIColor_FlatColors
import Cartography

class HomeViewController: BaseViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var countryCollectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var contentsTableView: UITableView!
    @IBOutlet weak var ContentsTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var swipeableView: ZLSwipeableView!

    //MARK:- View Model
    let viewModel = HomeViewModel()
    
    // variables
    var tableCellHieght: CGFloat = 0
    var colors = ["Turquoise", "Green Sea", "Emerald", "Nephritis", "Peter River", "Belize Hole", "Amethyst", "Wisteria", "Wet Asphalt", "Midnight Blue", "Sun Flower", "Orange", "Carrot", "Pumpkin", "Alizarin", "Pomegranate", "Clouds", "Silver", "Concrete", "Asbestos"]
    var colorIndex = 0
    var loadCardsFromXib = false

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        swipeableView.nextView = {
            return self.nextCardView()
        }
    }

    //MARK:- IBActions
    @IBAction func openSideMenuAction(_ sender: Any) {
    }
}

//MARK:- Helpers
extension HomeViewController {
    func initView() {
        initCommonCollectionView()
        tableCellHieght = contentsTableView.frame.width*20/30
        initCommonTableViews()
        bindViewModel()
        viewModel.getContinentOffers()
    }
    
    // init common table views
    func initCommonTableViews(){
        self.contentsTableView.register(UINib(nibName: "ContinentTableViewCell", bundle: nil), forCellReuseIdentifier: "ContinentTableViewCell")
        self.contentsTableView.delegate = self
        self.contentsTableView.dataSource = self
        contentsTableView.estimatedRowHeight = 100
    }
    
    // init common collection view
    func initCommonCollectionView() {
        countryCollectionView.register(UINib(nibName: "CountryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CountryCollectionViewCell")
        countryCollectionView.delegate = self
        countryCollectionView.dataSource = self

    }
    
    func bindViewModel() {
        // bind loading
        viewModel.showLoading.bind { [weak self] visible in
            if let `self` = self {
                visible ? self.showLoaderForController() : self.hideLoaderForController()
            }
        }

        // bind show message
        viewModel.onShowMessage = { message, isError in
            displayMessage(message: message, messageError: isError)
        }
        
        // bind popularCountryListVM
        viewModel.popularCountryListVM.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.countryCollectionView.reloadData()
            }
        }
        
        // bind continentsSectionsVM
        viewModel.continentsSectionsVM.bind { [weak self] list in
            self?.ContentsTableViewHeight.constant = (self?.tableCellHieght ?? 0) * (CGFloat(list.count))
            self?.contentsTableView.reloadData()
        }
    }
}


//MARK: - UITableView delegate and data source
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.continentsSectionsVM.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContinentTableViewCell", for: indexPath) as! ContinentTableViewCell
        if indexPath.row % 2 == 0{
            cell.containerView.backgroundColor = UIColor(hexString: "E9E9E9")
        }else{
            cell.containerView.backgroundColor = .white
        }
        cell.continentNameLabel.text = viewModel.continentsSectionsVM.value[indexPath.row].0
        cell.offersViewModel = viewModel.continentsSectionsVM.value[indexPath.row].1
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableCellHieght
    }
}


//MARK:- UICollection View Delegate,DataSource
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CountryCollectionViewCell", for: indexPath) as! CountryCollectionViewCell
        Cell.viewModel = viewModel.popularCountryListVM.value[indexPath.row]
        return Cell
        
     }

     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }

     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 0, bottom:0 , right: 0)

     }

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.popularCountryListVM.value.count
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let width:CGFloat = (collectionView.frame.width-30)/4
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


//MARK:- Card
extension HomeViewController{
    
    
    func nextCardView() -> UIView? {
        if colorIndex >= colors.count {
            colorIndex = 0
        }

        let cardView = CardView(frame: swipeableView.bounds)
        cardView.backgroundColor = colorForName(colors[colorIndex])
        colorIndex += 1

        if loadCardsFromXib {
            let contentView = Bundle.main.loadNibNamed("CardContentView", owner: self, options: nil)?.first! as! UIView
            contentView.translatesAutoresizingMaskIntoConstraints = false
            contentView.backgroundColor = cardView.backgroundColor
            cardView.addSubview(contentView)

            // This is important:
            // https://github.com/zhxnlai/ZLSwipeableView/issues/9
            /*// Alternative:
            let metrics = ["width":cardView.bounds.width, "height": cardView.bounds.height]
            let views = ["contentView": contentView, "cardView": cardView]
            cardView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[contentView(width)]", options: .AlignAllLeft, metrics: metrics, views: views))
            cardView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[contentView(height)]", options: .AlignAllLeft, metrics: metrics, views: views))
            */
            constrain(contentView, cardView) { view1, view2 in
                view1.left == view2.left
                view1.top == view2.top
                view1.width == cardView.bounds.width
                view1.height == cardView.bounds.height
            }
        }
        return cardView
    }
    func colorForName(_ name: String) -> UIColor {
        let sanitizedName = name.replacingOccurrences(of: " ", with: "")
        let selector = "flat\(sanitizedName)Color"
        return UIColor.perform(Selector(selector)).takeUnretainedValue() as! UIColor
    }
}
