//
//  NarcanAPIManager.swift
//  Narcan App
//
//  Created by Alex on 21/10/2016.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit
import AFNetworking

class NarcanAPIManager: NSObject {
    
    typealias tFailureBlock = (_ failure : NSError) -> ()!
    typealias tSuccessBlock = (_ success : NSDictionary) -> ()!
    
    var httpManager:AFHTTPSessionManager! = nil;
    var isUserOffline:Bool = false;
    
    override init() {
        if (httpManager == nil) {
            httpManager = AFHTTPSessionManager();
            httpManager.responseSerializer = AFJSONResponseSerializer(); //TIMEOUT WILL BE SETTED AT AFURLSessionManager LINE: 391
        }
    }
    
    class var sharedInstance: NarcanAPIManager {
        struct Static {
            static var instance = NarcanAPIManager()
        }
        
        
        return Static.instance
    }
    
    func startMonitoring() {
        AFNetworkReachabilityManager.shared().startMonitoring();
        
        AFNetworkReachabilityManager.shared().setReachabilityStatusChange { (status: AFNetworkReachabilityStatus) in
            switch (status) {
            case .reachableViaWiFi, .reachableViaWWAN:
                self.isUserOffline = false;
                break;
            case .notReachable, .unknown:
                self.isUserOffline = true;
                break;
            }
        };
    }
    
    func isOnline() -> Bool {
        var isOnline = false;
        let success: Bool;
        
        let host_name = "salesforce.com";
        let reachability: SCNetworkReachability = SCNetworkReachabilityCreateWithName(nil, host_name)!;
        
        var flags:SCNetworkReachabilityFlags = SCNetworkReachabilityFlags();
        
        success = SCNetworkReachabilityGetFlags(reachability, &flags);
        isOnline = success && (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0 && !((flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0);
        
        return isOnline;
    }
    
    func getMethodAPI (url: String, params: NSDictionary, successBlock: @escaping tSuccessBlock, failureBlock: @escaping tFailureBlock) {
        //Start Monitoring
        self.startMonitoring();
        
        httpManager = AFHTTPSessionManager();
        httpManager.requestSerializer = AFJSONRequestSerializer();
        httpManager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type")
        httpManager.responseSerializer = AFJSONResponseSerializer();
        
        let token = AppDelegate.defaultManager.access_token
        if token != nil && !(token?.isEmpty)! {
            httpManager.requestSerializer.setValue("\(AppDelegate.defaultManager.token_type) \(token)", forHTTPHeaderField: "Authorization");
        }
        
        httpManager.get(url, parameters: params, progress: nil, success: { (task, responseObj) in
            AFNetworkReachabilityManager.shared().stopMonitoring()
            successBlock(responseObj as! NSDictionary)
            
        }) { (task, error) in
            AFNetworkReachabilityManager.shared().stopMonitoring()
            failureBlock(error as NSError)
            
        };
    }
    
    func postMethodAPI (url: String, params: NSDictionary, successBlock:@escaping tSuccessBlock, failureBlock:@escaping tFailureBlock) {
        //Start Monitoring
        self.startMonitoring();
        
        httpManager = AFHTTPSessionManager();
        
        httpManager.requestSerializer = AFJSONRequestSerializer();
        httpManager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type")
        httpManager.responseSerializer = AFJSONResponseSerializer();
        
        httpManager.post(url, parameters: params, progress: nil, success: { (task, responseObj) in
            AFNetworkReachabilityManager.shared().stopMonitoring()
            successBlock(responseObj as! NSDictionary)
            
        }) { (task, error) in
            AFNetworkReachabilityManager.shared().stopMonitoring()
            failureBlock(error as NSError)
        };
    }

}
