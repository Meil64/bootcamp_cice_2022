//
//  CiceTmdbAppApp.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 4/4/22.
//

import SwiftUI
import Firebase

@main
struct CiceTmdbAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(LoginViewModel()) //Para poder acceder a LoginViewModel desde toda la jerarquía
        }
    }
}

final class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
