//
//  ContentView.swift
//  FInal
//
//  Created by Jagtar Singh matharu on 2023-04-18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            Image("")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    Text("Hello, world!")
                       
                )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
