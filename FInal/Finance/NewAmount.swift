//
//  FinanceView.swift
//  FInal
//
//  Created by Jagtar Singh matharu on 2023-04-21.
//

import SwiftUI

struct NewAmountView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var amounts:[FinanceModel]

    @State private var amount: Double = 20.0 // initial amount
    let screenBounds = UIScreen.main.bounds;
    @State private var name: String = ""
    @State private var category: String = ""
    @State private var selectedDate = Date()
    @State private var isDatePickerShown = false
    @State private var isDatePickerShown2 = false
    @State private var time = Date()
    @State private var showPicker = false
    
    
    let dateFormatter = DateFormatter() // Create a DateFormatter object
    let dateFormatter2 = DateFormatter() // Create a DateFormatter object
    
    var body: some View {

                 

        GeometryReader{ geometry in
            VStack{
                
                Text("New Amount")
                    .font(.title)
                    .bold()
                    .padding(.trailing,geometry.size.width*0.6)
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
                
                Slider(value: $amount, in: 0...100, step: 1)
                    .padding()
                    .border(Color.gray, width: 1)
                Text("CAD $\(String(format: "%.2f", amount))")
                    .font(.headline)
            
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
                Spacer()
                Button(action: {
                    
                    dateFormatter.dateFormat = "yyyy-MM-dd" // Set the date format
                    var date=dateFormatter.string(from: selectedDate)
                    dateFormatter2.dateFormat = "h:mm a"// Set the date format
                    let timeString = dateFormatter2.string(from: time) // Convert the Date to a String using the DateFormatter

                    var amount=FinanceModel(name:name,category:category,date:date,time:timeString,amount:String(amount))

                    amounts.append(amount)
                    self.presentationMode.wrappedValue.dismiss()

                }) {
                    Text("Button Text")
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


//struct NewAmount_Previews: PreviewProvider {
//    static var previews: some View {
//        NewAmountView()
//    }
//}
