import UIKit
import Appodeal

class BottomBannerViewController: UIViewController
{
    var bannerView: AppodealBannerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //disabling automatic caching
        Appodeal.setAutocache(false, types: .banner)
        
        // required: init ad banner
        let bannerView = AppodealBannerView(size: kAppodealUnitSize_320x50, rootViewController: self)
        
        // required: add banner to superview
        if let banner = bannerView {
            self.view.addSubview(banner)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func loadButtonPressed(_ sender: UIButton) {
        self.displayLoadAlert()
    }
    
    @IBAction func showButtonPressed(_ sender: UIButton) {
        self.displayShowAlert()
    }
    
    @IBAction func hideButtonPressed(_ sender: UIButton) {
        self.displayHideAlert()
    }
    
    private func displayLoadAlert() {
        let loadAlert = UIAlertController(title: "Alert", message: "Loading Bottom Banner", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            Appodeal.cacheAd(.banner)
        }
        loadAlert.addAction(okAction)
        self.present(loadAlert, animated: true, completion: nil)
    }
    
    private func displayShowAlert() {
        let showAlert = UIAlertController(title: "Alert", message: "Showing Bottom Banner", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            Appodeal.showAd(AppodealShowStyle.bannerBottom, rootViewController: self)
        }
        showAlert.addAction(okAction)
        self.present(showAlert, animated: true, completion: nil)
    }
    
    private func displayHideAlert() {
        let hideAlert = UIAlertController(title: "Alert", message: "Hiding Bottom Banner", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            Appodeal.hideBanner()
        }
        hideAlert.addAction(okAction)
        self.present(hideAlert, animated: true, completion: nil)
    }

}

