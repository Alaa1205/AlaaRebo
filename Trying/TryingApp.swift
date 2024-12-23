//
//  TryingApp.swift
//  Trying
//
//  Created by Alaa Emad Alhamzi on 21/06/1446 AH.
//

import SwiftUI
import SwiftData

@main
struct TryingApp: App {
    var body: some Scene {
        WindowGroup {
            AgeSelectionView()
        }
        .modelContainer(for: [Child.self])
    }
    
}
