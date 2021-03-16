//
//  SicrediApp.swift
//  Sicredi
//
//  Created by Renato Ferraz on 12/03/21.
//

import SwiftUI
import Defaults

@main
struct SicrediApp: App {

//    @UIApplicationDelegateAdaptor(Delegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            Splash()
        }
    }
}

//class Delegate : NSObject,UIApplicationDelegate{
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//
//        NetworkMonitor.shared.startMonitoring()
//
//        return true
//    }
//
//}

