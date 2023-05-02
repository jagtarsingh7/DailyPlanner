//
//  FinanceView.swift
//  FInal
//
//  Created by Jagtar Singh matharu on 2023-04-21.
//

import SwiftUI

struct FinanceView: View {
    @State var amounts:[FinanceModel]=[]

    @State var month: Int = 0
    @State private var name: String = ""
    @State private var category: String = ""
    @State private var selection = 0
    @State private var amount: Double=100
    @State private var text: String="Your summary"
    
    @State private var show: Bool=false

    var body: some View {
       
        GeometryReader{ geometry in
            
            VStack{
                
                Text("Money Tracker")
                    .font(.title)
                    .bold()
                    .padding(.trailing,geometry.size.width*0.55)
                Picker(selection: $selection, label: Text("")) {
                    Text("Movements").tag(0)
                    Text("Statistics").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                Divider()
                if(amounts.count == 0)
                {
                    VStack(alignment: .leading) {
                     
                            Text("Please add data by plus button")
                                .font(.headline)
                                .padding(.all, 10)
                        }
                        
                }
                if(selection==0)
                {
                   
                   
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(amounts, id: \.self) { item in
                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text( "$ \(item.amount)")
                                            .font(.headline)
                                            .padding(.all, 10)
                                        Spacer()
                                        Text( "By \(item.name)")
                                            .font(.headline)
                                            .padding(.all, 10)
                                        
                                    }
                                    ZStack(alignment: .leading) {
                                        Rectangle()
                                            .foregroundColor(.gray)
                                            .opacity(0.3)
                                            .frame(height: 20)
                                        Rectangle()
                                            .foregroundColor(.green)
                                            .frame(width: CGFloat(Double(item.amount)! / 100) * 200, height: 20)
                                    }
                                    .cornerRadius(5)
                                    .padding(.horizontal, 10)
                                    Text(text)
                                        .foregroundColor(.gray)
                                        .font(.caption)
                                        .padding()
                                    Text( "On \(item.category)")
                                        .font(.headline)
                                        .padding(.bottom,5)
                                    Text( "when \(item.date)")
                                        .font(.subheadline)
                                        .padding(.bottom,5)
                                    Text( "at \(item.time)")
                                        .font(.subheadline)
                                        .padding(.bottom,5)
                                    Text( "by \(item.name)")
                                        .font(.subheadline)
                                        .padding(.bottom)
                                }
                                .background(
                                    Image("4")
                                        .resizable()
                                        .scaledToFill()
                                )
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .padding(.all, 10)
                            }
                        }
                      
                        .padding()
                        
                    }
                }
                else
                {
                        BoxView(name: "Jagtar", category: "Food", date: "Now", time: "22:10", amount: "100")
               
                }
                
                HStack {
                    Text(getMonthName(month: month))
                    Spacer()
                           Button("<") {
                               if month > 0 {
                                   month -= 1
                               }
                           }
                          
                           Button(">") {
                               if month < 11 {
                                   month += 1
                               }
                           }
                       }
                       .padding()
                   
                ZStack(alignment: .bottomTrailing) {
                    ScrollView {
                        LazyVStack {
                            ForEach(amounts, id: \.self) { item in
                                HStack{
                                   
                                    
                                    Text("$ \(item.amount)")
                                        .padding(.trailing)
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
                    NavigationLink(destination: NewAmountView(amounts: $amounts)) {
                        
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
    private func getMonthName(month: Int) -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "MMMM"
           return dateFormatter.string(from: Calendar.current.date(from: DateComponents(year: 2000, month: month + 1))!)
       }
}



struct BoxView: View {
    
    var name: String
    var category: String
    var date:String
    var time:String
    var amount:String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.black)
               
          
            HStack {
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(category)
                        .font(.subheadline)
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    Text(date)
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Text(time)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                
               Spacer()
                
                Text("CAD $\(amount) ")
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
            }
          
            .padding()
            
        }
        .frame(height: 300)
    }
}


struct FinanceView_Previews: PreviewProvider {
    static var previews: some View {
        FinanceView()
    }
}

