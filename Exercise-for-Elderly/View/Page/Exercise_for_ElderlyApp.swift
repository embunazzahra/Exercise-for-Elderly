//
//  Exercise_for_ElderlyApp.swift
//  Exercise-for-Elderly
//
//  Created by Dhau Embun Azzahra on 12/08/24.
//

import SwiftUI

@main
struct Exercise_for_ElderlyApp: App {
    var body: some Scene {
        let viewModelFactory = ViewModelFactory()
        
        WindowGroup {
            ContentView(viewModel: viewModelFactory.makeCreateEventViewModel()).environmentObject(viewModelFactory)
        }
    }
}
