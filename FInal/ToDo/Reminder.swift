//
//  Reminder.swift
//  FInal
//
//  Created by Jagtar Singh matharu on 2023-04-19.
//

import SwiftUI

struct Reminder: View {
    
    @Binding var items:[ReminderInput]
    @Environment(\.presentationMode) var presentationMode

    @State private var name: String = ""
    @State private var category: String = ""
    @State private var text2: String = "put your notes here"
    @State private var selectedDate = Date()
    @State private var isDatePickerShown = false
    @State private var isDatePickerShown2 = false
    
    
    let dateFormatter = DateFormatter() // Create a DateFormatter object
    let dateFormatter2 = DateFormatter() // Create a DateFormatter object


    @State private var time = Date()


    let emojis = ["😀", "😂", "😍", "👍"]
    @State private var text = ""
    @State private var showPicker = false
    
    var body: some View {
       
        GeometryReader{ geometry in
            
            VStack{
                Text("New Reminder")
                    .font(.title)
                    .bold()
                    .padding(.trailing,geometry.size.width*0.48)
                    .padding(.bottom)
                            
                TextField("Reminder Name", text: $name)
                    .frame(width: geometry.size.width, height: 60)
                    .font(.system(size: 20))
                    .cornerRadius(10)
                    .background(Color.gray.opacity(0.2))
                    .padding(.bottom)
             
                TextField("Category", text: $category)
                    .frame(width: geometry.size.width, height: 60)
                    .font(.system(size: 20))
                    .cornerRadius(10)
                    .background(Color.gray.opacity(0.2))
                    .padding(.bottom)
            
                Text("Details")
                    .padding(.bottom)
                
                HStack{
                    Button(action: {
                                   self.isDatePickerShown.toggle()
                               }) {
                                   HStack {
                                       Image(systemName: "calendar")
                                       Spacer()
                                       Text(selectedDate, style: .date)
                                           .foregroundColor(.blue)
                                   }
                                   .padding()
                                   .background(Color.gray.opacity(0.2))
                                   .cornerRadius(10)
                               }
                               .sheet(isPresented: $isDatePickerShown) {
                                   DatePicker("Select a date", selection: $selectedDate, displayedComponents: [.date])
                                       .datePickerStyle(WheelDatePickerStyle())
                                       .labelsHidden()
                            }
                    Button(action: {
                                   self.isDatePickerShown2.toggle()
                               }) {
                                   HStack {
                                       Image(systemName: "clock")
                                       Spacer()
                                       Text(time, style: .time)
                                           .foregroundColor(.blue)
                                   }
                                   .padding()
                                   .background(Color.gray.opacity(0.2))
                                   .cornerRadius(10)
                               }
                               .sheet(isPresented: $isDatePickerShown2) {
                                   DatePicker("Select a date", selection: $time, displayedComponents: [.hourAndMinute])
                                       .datePickerStyle(WheelDatePickerStyle())
                                       .labelsHidden()
                            }
                  
                          
                }
                .padding(.bottom)
             
                Text("Note")
                           TextEditor(text: $text)
                               .frame(height: 200)
                               .background(Color.gray.opacity(0.2))
                               .cornerRadius(8)
                               .padding(.horizontal)
                               .border(.orange)
                
                HStack {
                           ForEach(emojis, id: \.self) { emoji in
                               Button(action: {
                                   text += emoji
                               }) {
                                   Text(emoji)
                                       .font(.largeTitle)
                               }
                           }
                           Button(action: {
                               showPicker = true
                           }) {
                               Image(systemName: "plus")
                                   .font(.largeTitle)
                           }
                           .sheet(isPresented: $showPicker) {
                               Text("Emoji Picker")
                           }
                        }
                           .padding()
                Spacer()
                           
                Button(action: {
                    dateFormatter.dateFormat = "yyyy-MM-dd" // Set the date format
                    var date=dateFormatter.string(from: selectedDate)
                    dateFormatter2.dateFormat = "h:mm a"// Set the date format
                    let timeString = dateFormatter2.string(from: time) // Convert the Date to a String using the DateFormatter

                    var reminder=ReminderInput(name:name,category:category,date:date,time:timeString,note:text)

                    items.append(reminder)
                    
                    self.presentationMode.wrappedValue.dismiss()

                    
                }) {
                    Text("Create Reminder")
                }
                .frame(width: geometry.size.width, height: 60)
                .background(Color.blue)
                .foregroundColor(.white)
                .padding(.bottom)


            }
            .frame(width: geometry.size.width,height: geometry.size.height)

            
        }
    }
}
//struct Reminder_Previews: PreviewProvider {
//    static var previews: some View {
//        Reminder()
//    }
//}

