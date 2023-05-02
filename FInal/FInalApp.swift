//
//  FInalApp.swift
//  FInal
//
//  Created by Jagtar Singh matharu on 2023-04-18.
//


import SwiftUI
//import FBSDKCoreKit


@main
struct FInalApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            LoginView()
//                .onOpenURL(perform: { url in
//                    
//                    ApplicationDelegate.shared.application(
//                        UIApplication.shared, open:url,
//                        sourceApplication:nil,
//                        annotation: UIApplication.OpenURLOptionsKey.annotation)
//                })
        }
    }
}
//@main
//struct FINAL_MUDITDAHIYAApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView().onAppear() {
//                ApplicationDelegate.shared.application(UIApplication.shared,
//                                                       didFinishLaunchingWithOptions: nil)
//            }
//        }
//    }
//}
