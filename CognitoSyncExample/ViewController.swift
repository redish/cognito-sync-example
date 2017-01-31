//
//  ViewController.swift
//  CognitoSyncExample
//
//  Created by Yusuke Yasuo on 2017/01/28.
//  Copyright © 2017 redish.inc. All rights reserved.
//

import UIKit
import AWSCore
import AWSCognito

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Initialize the Amazon Cognito credentials provider
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:.APNortheast1,
                                                                identityPoolId:"ap-northeast-1:b5e7ba68-6b00-4caf-a8f1-ed5a9a03077b")
        let configuration = AWSServiceConfiguration(region:.APNortheast1, credentialsProvider:credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration

        // Create Now String
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let nowString = formatter.string(from: now)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClick(_ sender: Any) {
        // Initialize the Cognito Sync client
        let syncClient = AWSCognito.default()
        // Sync Access Log
        let accessLogDataset = syncClient.openOrCreateDataset("access_logs")
        accessLogDataset.synchronize()
        print("---------------aaaaaaaaaaaaaaa")
        if (accessLogDataset.string(forKey: "session") == nil) {
            print("session is null")
        } else {
            print(accessLogDataset.string(forKey: "session"))
        }
        print("---------------bbbbbbbbbbbbbbb")
        accessLogDataset.setString("{\"type\":\"session\",\"user_id\":\"1\"}", forKey:"session")
        //        accessLogDataset?.clear()
        print("---------------ccccccccccccccc")
        print(accessLogDataset.string(forKey: "session"))
        print("---------------ddddddddddddddd")
        accessLogDataset.synchronize()
    }

}

