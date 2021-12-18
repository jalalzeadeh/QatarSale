//
//  PostAdSetp3ViewController.swift
//  QatarSale
//
//  Created by Jalal on 12/18/21.
//

import UIKit
import DropDown
import TransitionButton



class PostAdSetp3ViewController: MainViewController {

    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var marketTypeLabel: UILabel!
    @IBOutlet weak var marketTypeView: UIView!
    @IBOutlet weak var marketTypeImage: UIImageView!
    @IBOutlet weak var auctionTypeImage: UIImageView!
    @IBOutlet weak var auctionTypeView: UIView!
    @IBOutlet weak var auctionTypeLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    //
    @IBOutlet weak var setpNameLabel: UILabel!
    @IBOutlet weak var stepHintLabel: UILabel!
    @IBOutlet weak var circleLabel: UILabel!
    @IBOutlet weak var circleProgress: CircularProgressView!
    //
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceText: UITextField!
    //
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var durationErrorLabel: UILabel!
    @IBOutlet weak var bottomSpace: NSLayoutConstraint!
    @IBOutlet weak var durationHintLabel: UILabel!
    @IBOutlet weak var durationMenuView: UIView!
    //
    @IBOutlet weak var nextButton: TransitionButton!
    @IBOutlet weak var backButton: UIButton!
    //
    private let menuView = DropDown()
    private var iskeyboardOpen = false
    
    // view model
    let viewModel = PostAdStep3ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // uodate ui
        self.customizeUI()
        
        // keyboard actions
        NotificationCenter.default.addObserver(self, selector: #selector(self.willShowKeyboard(_:) ), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.willHideKeyboard(_:) ), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        circleProgress.setProgress(to: 0.6, animated: true)
    }
    
    // MARK: Keyboard actions
    @objc func willShowKeyboard(_ sender: NSNotification) {
        iskeyboardOpen = true
        self.bottomSpace.constant = 200
        self.mainScrollView.scrollRectToVisible(self.priceText.frame, animated: true)
//        let bottomOffset = CGPoint(x: 0, y: mainScrollView.contentSize.height - mainScrollView.bounds.height + mainScrollView.contentInset.bottom)
//        mainScrollView.setContentOffset(bottomOffset, animated: true)
        self.view.layoutIfNeeded()
       }
       
    @objc func willHideKeyboard(_ sender: NSNotification) {
        iskeyboardOpen = false
        self.bottomSpace.constant = 16
        self.view.layoutIfNeeded()
    }
    
    
    
    
    
    // MARK: ui functions
    func customizeUI() {
        self.navigationItem.title = "POST_AD_TITLE".localized()
        
        self.typeLabel.text = "TYPE_SALE".localized()
        typeLabel.font = Fonts.xSmall
        self.marketTypeLabel.text = "MARKET_TYPE".localized()
        marketTypeLabel.font = Fonts.xSmall
        self.auctionTypeLabel.text = "AUCTION_TYPE".localized()
        auctionTypeLabel.font = Fonts.xSmall
        
        updateLabelRequiredStyle(text: "TYPE_SALE".localized(), label: typeLabel)
        
        self.priceText.placeholder = "PRICE_PLACEHOLDER".localized()
        priceText.autocorrectionType = .no
        priceLabel.font = Fonts.xSmall
        self.priceLabel.text = "PRICE".localized()
        priceText.font = Fonts.xSmall
        updateLabelRequiredStyle(text: "PRICE".localized(), label: priceLabel)
        
        self.durationLabel.text = "DURATION_HINT".localized()
        durationLabel.font = Fonts.xSmall
        updateLabelRequiredStyle(text: "DURATION_HINT".localized(), label: durationLabel)
        self.durationErrorLabel.text = "ERROR_DURATION_TEXT".localized()
        durationErrorLabel.font = Fonts.xSmall
        durationErrorLabel.textColor = Colors.red
        durationHintLabel.text = "SELECT_DURATION_PLACEHOLDER".localized()
        durationHintLabel.textColor = Colors.grayDark
        durationHintLabel.font = Fonts.xSmall
        self.durationMenuView.layer.borderColor = Colors.red.cgColor
        
        self.setpNameLabel.text = "STEP_3_TITLE".localized()
        self.setpNameLabel.textColor = Colors.black
        self.setpNameLabel.font = Fonts.normalBold
        self.stepHintLabel.text = "STEP_3_HINT".localized()
        self.stepHintLabel.textColor = Colors.grayDark
        self.stepHintLabel.font = Fonts.smallMedium
        
        circleLabel.text = "3 of 5"
        circleLabel.textColor = Colors.black
        circleLabel.font = Fonts.xXSmallBold
        
        circleProgress.text = ""
        circleProgress.backgroundBarColor = Colors.grayLight
        circleProgress.foregroundBarColor = Colors.blue
        circleProgress.isUserInteractionEnabled = false
        circleProgress.animationDuration = 0
        circleProgress.lineWidth = 3
        circleProgress.transform = CGAffineTransform(scaleX: -1, y: -1)
        
        self.nextButton.layer.cornerRadius = 26
        self.nextButton.setTitle("NEXT_BUTTON".localized(), for: .normal)
        self.nextButton.setTitleColor(Colors.white, for: .normal)
        self.nextButton.titleLabel?.font = Fonts.bigBold
        self.nextButton.showsTouchWhenHighlighted = false
        //
        self.backButton.layer.cornerRadius = 26
        self.backButton.setTitle("BACK_BUTTON".localized(), for: .normal)
        self.backButton.setTitleColor(Colors.blueButton, for: .normal)
        self.backButton.titleLabel?.font = Fonts.bigBold
        self.backButton.backgroundColor = Colors.grayLight
        
        updateNextButton()
        updateTypeViews()
        customizeMenuView()
    }
    
    func customizeMenuView() {
        menuView.dataSource = []
        menuView.direction = .bottom
        DropDown.appearance().setupCornerRadius(10)
        menuView.cellHeight = 44
        menuView.selectionBackgroundColor = Colors.white
        menuView.cellConfiguration = { (index, item) in
            return "\(item)"
        }
        // menu colors
        menuView.backgroundColor = Colors.white
        menuView.textColor = Colors.black
        menuView.selectedTextColor = Colors.blue
        
        // menu shadow
        menuView.shadowColor = Colors.black
        menuView.shadowOffset = CGSize(width: 8, height: 8)
        menuView.shadowRadius = 8
        menuView.shadowOpacity = 0.06
    }
    
    func openDurationsMenu() {
        // close keyboard
        if iskeyboardOpen {
            self.view.endEditing(true)
        }
        // main logic
        self.customizeMenuView()
        menuView.dataSource = []
        menuView.anchorView = durationErrorLabel
        menuView.dataSource = viewModel.durations.map({"\($0)"})
        menuView.selectionAction = { [unowned self] (index: Int, item: String) in
            let selected = Int(item) ?? 0
            self.viewModel.selectedDuration = selected
            self.durationHintLabel.text = item
            self.durationErrorLabel.isHidden = true
            self.durationMenuView.layer.borderColor = Colors.grayLight.cgColor
            updateNextButton()
        }
        menuView.show()
    }
    
    
    func updateTypeViews() {
        if viewModel.selectrdType == .market {
            // market type selected
            self.marketTypeLabel.textColor = Colors.blue
            self.auctionTypeLabel.textColor = Colors.grayDark
            self.marketTypeView.layer.borderColor = Colors.blue.cgColor
            self.auctionTypeView.layer.borderColor = Colors.grayDark.cgColor
            self.marketTypeImage.image = #imageLiteral(resourceName: "market_type").withTintColor(Colors.blue)
            self.auctionTypeImage.image = #imageLiteral(resourceName: "auction_type").withTintColor(Colors.grayDark)
            self.marketTypeView.backgroundColor = Colors.blue.withAlphaComponent(0.2)
            self.auctionTypeView.backgroundColor = Colors.white
        } else { // auction
            self.marketTypeLabel.textColor = Colors.grayDark
            self.auctionTypeLabel.textColor = Colors.blue
            self.marketTypeView.layer.borderColor = Colors.grayDark.cgColor
            self.auctionTypeView.layer.borderColor = Colors.blue.cgColor
            self.marketTypeImage.image = #imageLiteral(resourceName: "market_type").withTintColor(Colors.grayDark)
            self.auctionTypeImage.image = #imageLiteral(resourceName: "auction_type").withTintColor(Colors.blue)
            self.marketTypeView.backgroundColor = Colors.white
            self.auctionTypeView.backgroundColor = Colors.blue.withAlphaComponent(0.2)
        }
    }
    
    func updateNextButton() {
        if let txt = self.priceText.text, !txt.isEmpty, viewModel.selectedDuration != -1  {
            self.nextButton.backgroundColor = Colors.blueButton
        } else {
            self.nextButton.backgroundColor = Colors.bluePlaceholder
        }
    }
    
    func updateLabelRequiredStyle(text: String, label: UILabel) {
        let StarText = "*"
        let range = (text as NSString).range(of: StarText)

         let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: Colors.red , range: range)
         label.attributedText = attributedString
    }
    
    // MARK: Actions
    @IBAction func marketTypeAction(_ sender: UIButton) {
        viewModel.selectrdType = .market
        updateTypeViews()
    }
    
    @IBAction func auctionTypeAction(_ sender: UIButton) {
        viewModel.selectrdType = .auction
        updateTypeViews()
    }
    
    @IBAction func durationAction(_ sender: UIButton) {
        openDurationsMenu()
    }
    
    
    @IBAction func nextButtonAction( _ sender: UIButton) {
        if viewModel.isNextAvaliable {
            
        } else {
            nextButton.shake(delegate: self)
        }
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.navigationController?.dismiss(animated: false, completion: nil)
    }
    

}

extension PostAdSetp3ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateNextButton()
        return true
    }
}

extension PostAdSetp3ViewController: CAAnimationDelegate {
    
}
