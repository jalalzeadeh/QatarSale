//
//  MainViewController.swift
//  QatarSale
//
//  Created by Jalal on 12/18/21.
//

import UIKit
import Toast_Swift

class MainViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = Colors.white
        self.loadSubviews()
        // Do any additional setup after loading the view.
    }
    
    func loadSubviews() {
        // load all subviews after loading
       
    }
    
    var activityIndicatorTag: Int { return 999999 }
     
     func startActivityIndicator(
        style: UIActivityIndicatorView.Style = .gray,
         location: CGPoint? = nil) {
         
         //Set the position - defaults to `center` if no`location`
         
         //argument is provided
         
         let loc = location ?? self.view.center
         
         //Ensure the UI is updated from the main thread
         
         //in case this method is called from a closure
         
         DispatchQueue.main.async {
             
             //Create the activity indicator
             
             let activityIndicator = UIActivityIndicatorView(style: style)
             //Add the tag so we can find the view in order to remove it later
             
             activityIndicator.tag = self.activityIndicatorTag
             //Set the location
             
             activityIndicator.center = loc
             activityIndicator.hidesWhenStopped = true
             //Start animating and add the view
             
             activityIndicator.startAnimating()
             self.view.addSubview(activityIndicator)
         }
     }
     
     func stopActivityIndicator() {
         
         //Again, we need to ensure the UI is updated from the main thread!
         
         DispatchQueue.main.async {
             //Here we find the `UIActivityIndicatorView` and remove it from the view
             
             if let activityIndicator = self.view.subviews.filter(
                 { $0.tag == self.activityIndicatorTag}).first as? UIActivityIndicatorView {
                 activityIndicator.stopAnimating()
                 activityIndicator.removeFromSuperview()
             }
         }
     }
    
    
    var statusBarLight: Bool = false {
        didSet {
            if #available(iOS 13.0, *) {
                UIApplication.shared.statusBarStyle = statusBarLight ? .lightContent : .darkContent
            } else {
                // Fallback on earlier versions
                UIApplication.shared.statusBarStyle = statusBarLight ? .lightContent : .default
            }
        }
    }
    
    
    func ShowToast(title: String) {
        let toastView = UIView()
        toastView.frame = CGRect(x: 8, y: 50, width: UIScreen.main.bounds.width - 16 , height: 60)
        toastView.backgroundColor = Colors.ourBlack//.withAlphaComponent(0.9)
        let lab = UILabel()
        lab.font = Fonts.normalBold
        lab.textColor = Colors.white
        lab.numberOfLines = 0
        lab.text = title //"Already exist in cart"
        lab.textAlignment = appLanguage == .arabic ? .right :.left
        lab.frame = CGRect(x: 8, y: 22, width: toastView.frame.width - 16, height: 10)
        lab.sizeToFit()
        lab.layoutIfNeeded()
        let h = lab.frame.height
        lab.layoutIfNeeded()
        toastView.frame.size.height = h + 40
        toastView.addSubview(lab)
        toastView.layer.cornerRadius = 11
        toastView.layoutSubviews()
        toastView.layoutIfNeeded()
        
        self.view.showToast(toastView, duration: 3.0, position: ToastPosition.top, completion: nil)
    }

    
    func SetClearNavigationBar() {
            self.navigationController?.navigationBar.tintColor = Colors.black
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : Colors.black, NSAttributedString.Key.font: Fonts.big ?? UIFont.systemFont(ofSize: 20)]
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.layoutIfNeeded()
            self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func SetBlackNavigationBar() {
            self.navigationController?.navigationBar.tintColor = Colors.white
           self.navigationController?.navigationBar.backgroundColor = Colors.navGrey
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : Colors.white, NSAttributedString.Key.font: Fonts.bigBold ?? UIFont.systemFont(ofSize: 16)]
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        
        
       // last remove with new style nav bar
          UIApplication.shared.statusBarUIView?.backgroundColor = Colors.navGrey
          let statusBar =  UIView()
          statusBar.frame = UIApplication.shared.statusBarFrame
          statusBar.backgroundColor = Colors.navGrey
          UIApplication.shared.keyWindow?.addSubview(statusBar)
    }
    
    func SetBlueNavigationBar() {
        self.navigationController?.navigationBar.tintColor = Colors.white
        self.navigationController?.navigationBar.backgroundColor = Colors.navGrey
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : Colors.white, NSAttributedString.Key.font: Fonts.bigBold ?? UIFont.systemFont(ofSize: 16)]
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        
        
        
        // last remove with new style nav bar
        UIApplication.shared.statusBarUIView?.backgroundColor = Colors.navGrey
        let statusBar =  UIView()
        statusBar.frame = UIApplication.shared.statusBarFrame
        statusBar.backgroundColor = Colors.navGrey
        UIApplication.shared.keyWindow?.addSubview(statusBar)
    }
    
    
    
    @IBAction func closeButtonAction(_ sender: UIButton) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    

}

