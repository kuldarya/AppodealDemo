import UIKit
import Appodeal

class NativeViewController: UIViewController, APDNativeAdLoaderDelegate
{
    //Initialize Appodeal native ad service object
    private lazy var apdLoader: APDNativeAdLoader = {
        let loader = APDNativeAdLoader()
        loader.delegate = self
        loader.loadAd(with: APDNativeAdType.auto)
        return loader
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //disabling automatic caching
        Appodeal.setAutocache(false, types: .nativeAd)
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
        let loadAlert = UIAlertController(title: "Alert", message: "Loading Native Ad", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            Appodeal.cacheAd(.nativeAd)
        }
        loadAlert.addAction(okAction)
        self.present(loadAlert, animated: true, completion: nil)
    }
    
    private func displayShowAlert(){
        let showAlert = UIAlertController(title: "Alert", message: "Showing Native Ad", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            //ShowStyle .nativeAd is not available within this method => I used a banner style for it.
            Appodeal.showAd(AppodealShowStyle.bannerTop, rootViewController: self)
        }
        showAlert.addAction(okAction)
        self.present(showAlert, animated: true, completion: nil)
    }
    
    private func displayHideAlert() {
        let hideAlert = UIAlertController(title: "Alert", message: "Hiding Native Ad", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            Appodeal.hideBanner()
        }
        hideAlert.addAction(okAction)
        self.present(hideAlert, animated: true, completion: nil)
    }

    func nativeAdLoader(_ loader: APDNativeAdLoader!, didLoad nativeAds: [APDNativeAd]!){
        NSLog("native ad was loaded")
    }
    func nativeAdLoader(_ loader: APDNativeAdLoader!, didFailToLoadWithError error: Error!){
        NSLog("native ad failed to load")
    }

}

