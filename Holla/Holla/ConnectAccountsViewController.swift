//
//  ConnectAccountsViewController.swift
//  Holla
//
//  Created by Rohan Mishra on 12/6/16.
//  Copyright © 2016 holla. All rights reserved.
//

import UIKit
import OAuthSwift
import KeychainSwift

class ConnectAccountsViewController: UIViewController {
    
    var oauthswift: OAuthSwift?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func connectTwitter(_ sender: Any) {
        let oauthswift = OAuth1Swift(
            consumerKey:     "CymaOl0EtIsolDE8RAKXEnnfS",
            consumerSecret:  "VTU2c6z7pkHhlgo8EidHjPSKTlqJiSxDo4ga7ZI61yAgeFshU1",
            requestTokenUrl: "https://api.twitter.com/oauth/request_token",
            authorizeUrl:    "https://api.twitter.com/oauth/authorize",
            accessTokenUrl:  "https://api.twitter.com/oauth/access_token"
        )
        self.oauthswift = oauthswift
        oauthswift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: oauthswift)
        let _ = oauthswift.authorize(
                withCallbackURL: URL(string: "holla://oauth-callback/twitter")!,
                success: { credential, response, parameters in
                    print(credential.oauthToken)
                    print(credential.oauthTokenSecret)
                    print(parameters["user_id"]!)
            },
                failure: { error in
                    print(error.localizedDescription)
            }             
        )
    }
    
    @IBAction func connectInstagram(_ sender: Any) {
        let oauthswift = OAuth2Swift(
            consumerKey:    "c3f298554cfb434e845e9d23cfa4dd84",
            consumerSecret: "7ac42c04d0674852a1a940e22aac7660",
            authorizeUrl:   "https://api.instagram.com/oauth/authorize",
            responseType:   "token"
        )
        self.oauthswift = oauthswift
        oauthswift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: oauthswift)
        let _ = oauthswift.authorize(
            withCallbackURL: URL(string: "http://get.Holla")!, scope: "likes+comments", state: "INSTAGRAM",
                success: { credential, response, parameters in
                    print(credential.oauthToken)
                    print(credential.oauthTokenSecret)
                    print(parameters)
            },
                failure: { error in
                    print(error.description)
            }
        )
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension SafariURLHandler {
    
}
