//
//  Settings.swift
//  FInal
//
//  Created by Jagtar Singh matharu on 2023-04-21.
//

import SwiftUI


    
struct Settings: View {
    @AppStorage("colorScheme") private var colorScheme: String = "dark"
    
    var body: some View {
        
        GeometryReader{ geometry in
            VStack{
                
                Text("Settings")
                    .font(.title)
                    .bold()
                    .padding(.trailing,geometry.size.width*0.74)
                    .padding(.bottom)
                Form {
                    Section(header: Text("Color Scheme")) {
                        Picker(selection: $colorScheme, label: Text("Color Scheme")) {
                            Text("Light").tag("light")
                            Text("Dark").tag("dark")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                
            }
            
        }
        .onChange(of: colorScheme) { newColorScheme in
          
             if newColorScheme == "light" {
                UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .light
            } else if newColorScheme == "dark" {
                let darkColor = UIColor(red: 23/255, green: 25/255, blue: 48/255, alpha: 1.0)
                UIApplication.shared.windows.first?.backgroundColor = darkColor
                UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .dark
            }
        }
        
        
        
    }
}




struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
