//
//  PostAdSetp2ViewController.swift
//  QatarSale
//
//  Created by Jalal on 12/18/21.
//
import UIKit
import Foundation
import TransitionButton

class PostAdSetep2ViewController: MainViewController {
    
    @IBOutlet weak var nextButton: TransitionButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var setpNameLabel: UILabel!
    @IBOutlet weak var stepHintLabel: UILabel!
    @IBOutlet weak var circleLabel: UILabel!
    @IBOutlet weak var circleProgress: CircularProgressView!
    //
    @IBOutlet weak var mainImage:UIImageView!
    @IBOutlet weak var mainImageView: UIView!
    @IBOutlet weak var mainImageLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var collectionImages: UICollectionView!
    
    let cellId = "Cell"
    // view model
    let viewModel = PostAdSetp2ViewModel()
    
    
    // MARK: view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // register cell
        let nib = UINib(nibName: "ImagesStep2CollectionCell", bundle: nil)
        collectionImages.register(nib, forCellWithReuseIdentifier: cellId)
        // uodate ui
        self.customizeUI()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionImages.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        circleProgress.setProgress(to: 0.4, animated: true)
    }
    
    /// Update ui
    func customizeUI() {
        self.SetClearNavigationBar()
        self.navigationItem.title = "POST_AD_TITLE".localized()
        
        self.setpNameLabel.text = "STEP_2_TITLE".localized()
        self.setpNameLabel.textColor = Colors.black
        self.setpNameLabel.font = Fonts.normalBold
        self.stepHintLabel.text = "STEP_2_HINT".localized()
        self.stepHintLabel.textColor = Colors.grayDark
        self.stepHintLabel.font = Fonts.smallMedium
        
        self.messageLabel.text = "STEP_2_MESSAGE".localized()
        self.messageLabel.font = Fonts.small
        self.messageLabel.textAlignment = .center
        
        
        circleLabel.text = "2 of 5"
        circleLabel.textColor = Colors.black
        circleLabel.font = Fonts.xXSmallBold
        
        circleProgress.text = ""
        circleProgress.backgroundBarColor = Colors.grayLight
        circleProgress.foregroundBarColor = Colors.blue
        circleProgress.isUserInteractionEnabled = false
        circleProgress.animationDuration = 0
        circleProgress.lineWidth = 3
        circleProgress.transform = CGAffineTransform(scaleX: -1, y: -1)
        
        mainImageView.backgroundColor = Colors.grayLight
        mainImageLabel.text = "UPLOAD_IMAGE_HINT".localized()
        mainImageLabel.font = Fonts.xSmall
        mainImageLabel.textColor = Colors.grayDark
        
        
        self.nextButton.layer.cornerRadius = 26
        self.nextButton.setTitle("NEXT_BUTTON".localized(), for: .normal)
        self.nextButton.setTitleColor(Colors.white, for: .normal)
        self.nextButton.titleLabel?.font = Fonts.bigBold
        //
        self.backButton.layer.cornerRadius = 26
        self.backButton.setTitle("BACK_BUTTON".localized(), for: .normal)
        self.backButton.setTitleColor(Colors.blueButton, for: .normal)
        self.backButton.titleLabel?.font = Fonts.bigBold
        self.backButton.backgroundColor = Colors.grayLight
        updateNextButton()
    }
    
    func updateNextButton() {
        if viewModel.selectedIndex != -1 {
            self.nextButton.backgroundColor = Colors.blueButton
        } else {
            self.nextButton.backgroundColor = Colors.bluePlaceholder
        }
    }
    
    @IBAction func nextButtonAction( _ sender: UIButton) {
        if viewModel.selectedIndex == -1 {
            nextButton.shake(delegate: self)
            return
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostAdSetp3ViewController") as! PostAdSetp3ViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: false, completion: nil)
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.navigationController?.dismiss(animated: false, completion: nil)
    }
    
    
    
    
}

extension PostAdSetep2ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item < viewModel.imagesList.count {
            viewModel.selectedIndex = indexPath.item
            self.mainImage.image = viewModel.imagesList[indexPath.item]
            collectionView.reloadData()
            updateNextButton()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImagesStep2CollectionCell
        let width = self.view.frame.width / 6
        let height = self.view.frame.width / 8
        if indexPath.item < viewModel.imagesList.count {
            cell.populateCell(img: viewModel.imagesList[indexPath.item], isSelected: viewModel.selectedIndex == indexPath.item, width: width, height: height)
        } else {
            cell.populateCell(img: UIImage(), isSelected: viewModel.selectedIndex == indexPath.item, width: width, height: height)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

extension PostAdSetep2ViewController: CAAnimationDelegate {
    
}
