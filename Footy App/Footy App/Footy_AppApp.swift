//
//  Footy_AppApp.swift
//  Footy App
//
//  Created by Aaron Strocchia on 7/1/24.
//

import SwiftUI
import FirebaseCore
import Firebase

@main
struct Footy_AppApp: App {
    
    
    
    init(){
        FirebaseApp.configure()
    }
    
    
    
    
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
