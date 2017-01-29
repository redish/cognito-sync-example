//
//  ViewController.swift
//  CognitoSyncExample
//
//  Created by Yusuke Yasuo on 2017/01/28.
//  Copyright © 2017 redish.inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Initialize the Amazon Cognito credentials provider
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:.apNortheast1,
                                                                identityPoolId:"ap-northeast-1:b5e7ba68-6b00-4caf-a8f1-ed5a9a03077b")
        let configuration = AWSServiceConfiguration(region:.apNortheast1, credentialsProvider:credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

