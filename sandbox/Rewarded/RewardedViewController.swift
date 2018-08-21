import UIKit
import Appodeal

class RewardedViewController: UIViewController, AppodealRewardedVideoDelegate
{    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //disabling automatic caching
        Appodeal.setAutocache(false, types: .rewardedVideo)
        
        Appodeal.setRewardedVideoDelegate(self)
        Appodeal.isReadyForShow(with: .rewardedVideo)
    }

    @IBAction func loadButtonPressed(_ sender: UIButton) {
        self.displayLoadAlert()
    }
    
    @IBAction func showButtonPressed(_ sender: UIButton) {
        self.displayShowAlert()
    }
    
    private func displayLoadAlert() {
        let loadAlert = UIAlertController(title: "Alert", message: "Loading Rewarded Video Ad", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            Appodeal.cacheAd(.rewardedVideo)
        }
        loadAlert.addAction(okAction)
        self.present(loadAlert, animated: true, completion: nil)
    }
    
    private func displayShowAlert(){
        let showAlert = UIAlertController(title: "Alert", message: "Showing Rewarded Video Ad", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            Appodeal.showAd(AppodealShowStyle.rewardedVideo, rootViewController: self)
        }
        showAlert.addAction(okAction)
        self.present(showAlert, animated: true, completion: nil)
    }
    
    func rewardedVideoDidLoadAd(){
        NSLog("video ad was loaded")
    }
    func rewardedVideoDidFailToLoadAd(){
        NSLog("video ad failed to load")
    }
    func rewardedVideoDidPresent(){
        NSLog("video ad was presented");
    }
    func rewardedVideoWillDismiss(){
        NSLog("video ad was closed");
    }
    func rewardedVideoDidFinish(_ rewardAmount: UInt, name rewardName: String!){
        NSLog("video ad was fully watched");
    }
    
}

