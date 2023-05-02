//
//  MenuTab.swift
//  FInal
//
//  Created by Jagtar Singh matharu on 2023-04-21.
//

import SwiftUI

struct Menu: View {
    
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }.tag(0)
            ToDos()
                .tabItem {
                    Image(systemName: "checkmark.circle")
                    Text("ToDos")
                }.tag(1)
            FinanceView()
                .tabItem {
                    Image(systemName: "chart.bar.xaxis")
                    Text("Finance")
                }.tag(2)
            
            Settings()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }.tag(3)
            
        }.navigationBarBackButtonHidden(true)
    }
}


struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
