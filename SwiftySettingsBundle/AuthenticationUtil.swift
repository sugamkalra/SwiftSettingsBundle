//
//  AuthenticationUtil.swift
//  SwiftySettingsBundle
//
//  Created by Sugam Kalra on 20/12/15.
//  Copyright © 2015 Sugam Kalra. All rights reserved.
//

import Foundation

/**
 * AuthenticationUtil
 * A Singleton for managing all things related to authentication
 *
 * @author Sugam
 * @version 1.0
 */

class AuthenticationUtil {
    
    /// the singleton
    static let sharedInstance = AuthenticationUtil()
    
    // This prevents others from using the default '()' initializer for this class.
    private init() {
        loadKey()
    }
    
    var apikey: String?
    
    
    /**
    Save apikey to user defaults
    
    - Parameter key: the key
    */
    func saveKey(key: String) {
        apikey = key
        NSUserDefaults.standardUserDefaults().setObject(key, forKey: "apikey")
    }
    
    /**
    load current key
    
    - Returns: the key
    */
    func loadKey() -> String? {
        if let key = NSUserDefaults.standardUserDefaults().stringForKey("apikey") {
            apikey = key
            return key
        }
        return nil
    }
    
    /**
    Save username to user defaults
    
    - Parameter username: the username
    */
    func saveUsername(username: String) {
        NSUserDefaults.standardUserDefaults().setObject(username, forKey: "username")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    /**
    load username
    
    - Returns: the username
    */
    func getUsername() -> String? {
        if let key = NSUserDefaults.standardUserDefaults().stringForKey("username") {
            return key
        }
        return nil
    }
    
    /**
    Check whether it's already logged in or not
    */
    func isLogin() -> Bool {
        return apikey != nil
    }
    
    // Added by Sugam
    
    /**
    Save grower id to user defaults
    
    - Parameter growerId: the growerid
    */
    func saveGrowerId(growerId: String) {
        
        NSUserDefaults.standardUserDefaults().setObject(growerId, forKey: "growerId")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    /**
     load growerId
     
     - Returns: the growerid
     */
    func retrieveGrowerId() -> String? {
        if let growerId = NSUserDefaults.standardUserDefaults().stringForKey("growerId") {
            return growerId
        }
        return nil
    }

    /**
     Clean up NSUserDefaults
     */
    func logout() {
        self.apikey = nil
        NSUserDefaults.standardUserDefaults().removeObjectForKey("apikey")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("username")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("growerId")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    
}