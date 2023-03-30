//
//  SpiritDetectApp.swift
//  SpiritDetect
//
//  Created by Larry Bonnette on 2/6/23.
//

import SwiftUI

@main
struct SpiritDetectApp: App {
    
    @StateObject var setit = SetupData() // Needed to share data with all Views using @EnvironmentObject
    
    var body: some Scene {
        
        WindowGroup {
            RootView()
                .environmentObject(setit) // Needed to share data with all Views using @EnvironmentObject
        }
    }
    
}
