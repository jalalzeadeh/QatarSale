//
//  PoostAdSetp1ViewController.swift
//  QatarSale
//
//  Created by Jalal on 12/18/21.
//

import UIKit
import TransitionButton

class PostAdSetp1ViewController: MainViewController {

    // MAEK: properities
    @IBOutlet weak var nextButton: TransitionButton!
    @IBOutlet weak var setpNameLabel: UILabel!
    @IBOutlet weak var stepHintLabel: UILabel!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var circleLabel: UILabel!
    @IBOutlet weak var circleProgress: CircularProgressView!
    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var favoriteTableView: UITableView!
    
    // view model
    let viewModel = PostAdSetp1ViewModel()
    
    let CategoryCellId = "CellId"
    
    // MARK: view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // register cell
        let nib = UINib(nibName: "CategoryTableViewCell", bundle: nil)
        categoryTableView.register(nib, forCellReuseIdentifier: CategoryCellId)
        let nib2 = UINib(nibName: "FavoriteTableViewCell", bundle: nil)
        favoriteTableView.register(nib2, forCellReuseIdentifier: CategoryCellId)
        
        // uodate ui
        self.customizeUI()
        
        // Do any additional setup after loading the view.
    }
    
    
    /// Update ui
    func customizeUI() {
        self.SetClearNavigationBar()
        self.navigationItem.title = "POST_AD_TITLE".localized()
        
        categoryTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
        categoryTableView.contentInsetAdjustmentBehavior = .never
        categoryTableView.tableFooterView = nil
        categoryTableView.sectionHeaderTopPadding = 0.0
        favoriteTableView.sectionHeaderTopPadding = 0.0
        
        
        self.setpNameLabel.text = "CATEGORY_LABEL".localized()
        self.setpNameLabel.textColor = Colors.black
        self.setpNameLabel.font = Fonts.normalBold
        self.stepHintLabel.text = "CHOOSE_CATEGORY_HINT".localized()
        self.stepHintLabel.textColor = Colors.grayDark
        self.stepHintLabel.font = Fonts.smallMedium
        
        self.searchTextField.placeholder = "SEARCH_PLACEHOLDER".localized()
        searchTextField.font = Fonts.smallBold
        searchTextField.placeHolderColor = Colors.grayDark
        
        circleLabel.text = "1 of 5"
        circleLabel.textColor = Colors.black
        circleLabel.font = Fonts.xXSmallBold
        
        circleProgress.text = ""
        circleProgress.backgroundBarColor = Colors.grayLight
        circleProgress.foregroundBarColor = Colors.blue
        circleProgress.isUserInteractionEnabled = false
        circleProgress.animationDuration = 0
        circleProgress.lineWidth = 3
        circleProgress.transform = CGAffineTransform(scaleX: -1, y: -1)
        
        searchView.backgroundColor = Colors.graySearch
        searchView.layer.cornerRadius = 8
        searchView.layer.borderColor = Colors.grayLight.cgColor
        searchView.layer.borderWidth = 1
        
        self.nextButton.layer.cornerRadius = 26
        self.nextButton.setTitle("NEXT_BUTTON".localized(), for: .normal)
        self.nextButton.setTitleColor(Colors.white, for: .normal)
        self.nextButton.titleLabel?.font = Fonts.bigBold
        updateNextButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        circleProgress.setProgress(to: 0.2, animated: true)
    }
    
    func updateNextButton() {
        if viewModel.isNextAvaliable {
            self.nextButton.backgroundColor = Colors.blueButton
        } else {
            self.nextButton.backgroundColor = Colors.bluePlaceholder
        }
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        if !viewModel.isNextAvaliable {
            nextButton.shake(delegate: self)
            return
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostAdSetp2ViewController") as! PostAdSetep2ViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: false, completion: nil)
    }
    

}

// MARK: - table view delegates
extension PostAdSetp1ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 2 { // favorite table
            return // do noting
        }
        viewModel.categoryIdSelected = self.viewModel.SectionsList[indexPath.section].categories[indexPath.row].id ?? -1
        tableView.reloadData()
        if (viewModel.categoryIdSelected == 1 && indexPath.section == 0) {
            viewModel.isNextAvaliable = true
        } else {
            viewModel.isNextAvaliable = false
        }
        updateNextButton()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView.tag == 2 { // favorite table
            return 1
        } else {
            return self.viewModel.SectionsList.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 2 { // favorite table
            return self.viewModel.favorites.count
        } else {
            return self.viewModel.SectionsList[section].categories.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 2 { // favorite table
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCellId ) as! FavoriteTableViewCell
            cell.selectionStyle = .none
            cell.populateCell(fav: self.viewModel.favorites[indexPath.row])
            return cell
        }
        
        // category table
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCellId ) as! CategoryTableViewCell
        cell.selectionStyle = .none
        let cat = self.viewModel.SectionsList[indexPath.section].categories[indexPath.row]
        cell.populateCell(cat: cat, isSelected: viewModel.categoryIdSelected == cat.id && indexPath.section == 0 )
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView.tag == 2 { // favorite table
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0) )
            return headerView
        } else {
            // category table
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30) )
            headerView.clipsToBounds = true
            headerView.backgroundColor = Colors.white
            let lab = UILabel(frame: CGRect(x: 22, y: 4, width: headerView.frame.width - 30, height: 22) )
            lab.text = self.viewModel.SectionsList[section].name
            lab.font = Fonts.smallBold
            headerView.addSubview(lab)
            
            return headerView
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView.tag == 2 { //
            return CGFloat.leastNormalMagnitude
        } else {
            return 30
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
}

extension PostAdSetp1ViewController: CAAnimationDelegate {
    
}
