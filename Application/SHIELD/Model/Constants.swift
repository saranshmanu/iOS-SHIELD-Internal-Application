//
//  Constants.swift
//  SHIELD
//
//  Created by Saransh Mittal on 22/01/18.
//  Copyright © 2018 Saransh Mittal. All rights reserved.
//

import SystemConfiguration
import Foundation
import UIKit

public class Data {
    
    public static var redColor:UIColor = UIColor.init(red: 222/255, green: 48/255, blue: 63/255, alpha: 1.0)
    public static var uid:String = ""
    public static var username:String = ""
    public static var password:String = ""
    public static var name:String = ""
    public static var registrationNumber:String = ""
    public static var departmentCode:String = ""
    public static var designation:String = ""
    public static var phoneNumber:Int = 0
    public static var isAdmin:Bool = false
    public static var isAvailable:Bool?
    public static var isLogged:Bool = false
    public static var messages:[NSDictionary] = []
    public static var tasks:[NSDictionary] = []
    public static var taskCodes:[String] = []
    public static var members:[NSDictionary] = []
    
    public static var departments:[String] = [
        "Editorial and Blog",
        "Events, UR and Stratergies",
        "Expansion",
        "General Secretary",
        "Human Resources",
        "Marketing",
        "Public Relations",
        "Startups" ,
        "Technical and Design"
    ]
    public static var departmentCount:Int = 6
    
    public static var designations:[String] = [
        "Core Commitee Member",
        "President",
        "Vice Precident",
        "Tech Head"
    ]
    
    public static func findCurrentDate() -> String{
        var date = Date()
        var calendar = Calendar.current
        var x = String(calendar.component(.day, from: date)) + " " + Data.findMonth(month: String(calendar.component(.month, from: date))) + " " + String(calendar.component(.year, from: date))
        return x
    }
    
    public static func findCurrentTime() -> String{
        var date = Date()
        var calendar = Calendar.current
        var x = String(calendar.component(.hour, from: date)) + ":" + String(calendar.component(.minute, from: date)) + ":" + String(calendar.component(.second, from: date))
        return x
    }

    public static func findDepartmentName(departmentCode:String) -> String{
        switch departmentCode {
            case "#0": return "Editorial and Blog"
            case "#1": return "Events, UR and Stratergies"
            case "#2": return "Expansion"
            case "#3": return "General Secretary"
            case "#4": return "Human Resources"
            case "#5": return "Marketing"
            case "#6": return "Public Relations"
            case "#7": return "Startups"
            case "#8": return "Technical and Design"
            default: return ""
        }
    }
    public static func findDepartmentCode(code:String) -> String{
        switch code {
            case "Editorial and Blog": return "#0"
            case "Events, UR and Stratergies": return "#1"
            case "Expansion": return "#2"
            case "General Secretary": return "#3"
            case "Human Resources": return "#4"
            case "Marketing": return "#5"
            case "Public Relations": return "#6"
            case "Startups": return "#7"
            case "Technical and Design": return "#8"
            default: return "#9"
        }
    }
    
    public static func findMonth(month:String) -> String{
        switch month {
            case "1": return "January"
            case "2": return "Febuary"
            case "3": return "March"
            case "4": return "April"
            case "5": return "May"
            case "6": return "June"
            case "7": return "July"
            case "8": return "August"
            case "9": return "September"
            case "10": return "October"
            case "11": return "November"
            case "12": return "December"
            default: return "#07"
        }
    }
}

extension UIViewController {
    class func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        return spinnerView
    }
    
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}

public class Reachability {
    class func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)
        return ret
    }
}



