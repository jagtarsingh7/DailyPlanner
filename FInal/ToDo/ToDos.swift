//
//  ToDos.swift
//  FInal
//
//  Created by Jagtar Singh matharu on 2023-04-19.
//



import SwiftUI

struct ToDos: View {
    
    @State var items:[ReminderInput]=[]
    @State private var name: String = ""
    @State private var password: String = ""
   
    var body: some View {
       
        GeometryReader{ geometry in
            
            NavigationView(){
                VStack{
                    
                    Text("ToDos")
                        .font(.title)
                        .bold()
                        .padding(.trailing,geometry.size.width*0.8)
                    
                    
                    if(items.count==0)
                    {
                        Text("Welcome to ToDos page")
                            .padding(.trailing,geometry.size.width*0.54)
                            .padding(.bottom,geometry.size.width*0.4)
                        Text("Please add notes by + button")
                            .padding(.bottom)
                    }
                    if(items.count>0)
                    {
                        Text("Welcome to ToDos page")
                            .padding(.trailing,geometry.size.width*0.54)
                            .padding(.bottom,geometry.size.width*0.2)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(items, id: \.self) { item in
                                    Text("Note:\(item.note)")
                                        .frame(width: 100,height: 100)
                                        .font(.headline)
                                        .padding(10)
                                        .foregroundColor(.white)
                                        .background(Color.gray)
                                        .cornerRadius(10)
                                }
                            }
                            .padding()
                        }
                        .padding(.bottom,geometry.size.width*0.2)

                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(items, id: \.self) { item in
                                Text("Added:\(item.time)")
                                    .font(.headline)
                                    .padding(10)
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                        }
                        .padding()
                    }
                    ZStack(alignment: .bottomTrailing) {
                        ScrollView {
                            LazyVStack {
                                ForEach(items, id: \.self) { item in
                                    HStack{
                                        Text("\(item.date)")
                                            .padding(.trailing)
                                        Spacer()
                                        Text("By \(item.name)")
                                            .padding(.trailing)
                                        Text("On \(item.category)")
                                            .padding(.trailing)
                                       
                                    
                                    }.padding()
                                        .frame(maxWidth: geometry.size.width)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                               
                                }
                            }
                            .padding()
                        }
                        NavigationLink(destination: Reminder(items: $items)) {
                            Image(systemName: "plus")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                                .frame(width: 56, height: 56)
                                .background(Color.blue)
                                .cornerRadius(28)
                                .padding(.trailing, 16)
                                .padding(.bottom, 16)
                                .shadow(color: .gray, radius: 4, x: 0, y: 4)
                        }
                    }
                    
                    
                }
                .frame(width: geometry.size.width,height: geometry.size.height)
                
            }
        }
    
    }
}
struct ToDos_Previews: PreviewProvider {
    static var previews: some View {
        ToDos()
    }
}
