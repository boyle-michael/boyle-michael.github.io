//
//  GameViewController.swift
//  Bounce Boy_The Final Push
//
//  Created by Michael Boyle on 7/25/15.
//  Copyright (c) 2015 Michael Boyle. All rights reserved.
//

import UIKit
import SpriteKit
import iAd

extension SKNode {
    class func unarchiveFromFile(_ file : String) -> SKNode? {
        if let path = Bundle.main.path(forResource: file, ofType: "sks") {
            let sceneData = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let archiver = NSKeyedUnarchiver(forReadingWith: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObject(forKey: NSKeyedArchiveRootObjectKey) as! GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

var adBannerView: ADBannerView?

class GameViewController: UIViewController, ADBannerViewDelegate {
    
    var scene:GameScene!
    
    func loadAds() {
        
        adBannerView = ADBannerView(frame: CGRect.zero)
        adBannerView!.delegate = self
        adBannerView!.isHidden = true
        view.addSubview(adBannerView!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Configure the view.
        let skView = self.originalContentView as! SKView
        
        loadAds()
        
        self.canDisplayBannerAds = true // <--
        
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.showsPhysics = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene = GameScene(size: view.bounds.size)
        scene.scaleMode = .aspectFill
        
        skView.presentScene(scene)
        
        
        //iAd
        loadAds()
    }
    
    //iAd
    func bannerViewWillLoadAd(_ banner: ADBannerView!) {
        
        
        print("Ad about to load", terminator: "")
        
    }
    
    func bannerViewDidLoadAd(_ banner: ADBannerView!) {
        
        //adBannerView!.center = CGPoint(x: adBannerView!.center.x, y: view.bounds.size.height - view.bounds.size.height + adBannerView!.frame.size.height / 2)
        
        adBannerView?.isHidden = false
        print("Displaying the Ad", terminator: "")
        
    }
    
    func bannerViewActionDidFinish(_ banner: ADBannerView!) {
        
        
        print("Close the Ad", terminator: "")
        
    }
    
    func bannerViewActionShouldBegin(_ banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        
        //pause game here
        
        
        print("Leave the application to the Ad", terminator: "")
        return true
    }
    
    func bannerView(_ banner: ADBannerView!, didFailToReceiveAdWithError error: Error!) {
        
        //move off bounds when add didnt load
        
        adBannerView!.center = CGPoint(x: adBannerView!.center.x, y: view.bounds.size.height + view.bounds.size.height)
        
        print("Ad is not available", terminator: "")
        
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return UIInterfaceOrientationMask.allButUpsideDown
        } else {
            return UIInterfaceOrientationMask.all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
}
