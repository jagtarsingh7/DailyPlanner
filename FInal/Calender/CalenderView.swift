//
//  CalenderView.swift
//  FInal
//
//  Created by Jagtar Singh matharu on 2023-04-19.
//

import SwiftUI

struct Event: Identifiable {
    let id: UUID
    let name: String
    let hour: Int
}

struct CalendarView: View {
    
    @State var selectedDate = Date()
    @State var events: [Event] = []
    
    @State var items:[EventModel]=[]

    @State private var showAlert = false
    
    var body: some View {
        GeometryReader{ geometry in
            NavigationView(){
                VStack {
                    Text("Calender")
                        .font(.title)
                        .bold()
                        .padding(.trailing,geometry.size.width*0.7)
                        .padding(.bottom,10)
                    DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                        .datePickerStyle(GraphicalDatePickerStyle())
                    Text("Please add events by + button")
                        .padding(.bottom)
                    ZStack(alignment: .bottomTrailing) {
                        ScrollView {
                            LazyVStack {
                                ForEach(items, id: \.self) { item in
                                    HStack{
                                        Text("\(item.date)")
                                            .padding(.trailing)
                                        Text("\(item.time)")
                                        Spacer()
                                        Text("By \(item.name)")
                                            .padding(.trailing)
                            
                                    }.padding()
                                        .frame(maxWidth: geometry.size.width)
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(10)
                                    
                                }
                            }
                            .padding()
                        }
                        NavigationLink(destination: CalenderEvent(items: $items)) {
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
                .onChange(of: selectedDate) { date in
                    
                             showAlert = true

                    
                    
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Event details"), message: Text("Name: \("Jagtar")\nDate: \(selectedDate)"), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
    
    func getEvents(for hour: Int?) -> [Event] {
        // Replace with your own logic to fetch events based on the selected date and hour
        let events = [
            Event(id: UUID(), name: "Event 1", hour: 10),
            Event(id: UUID(), name: "Event 2", hour: 12),
            Event(id: UUID(), name: "Event 3", hour: 16),
        ]
        
        if let hour = hour {
            return events.filter { $0.hour == hour }
        } else {
            return events
        }
    }
}


struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

