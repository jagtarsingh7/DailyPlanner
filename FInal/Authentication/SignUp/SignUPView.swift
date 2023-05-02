//
//  SignUPView.swift
//  FInal
//
//  Created by Jagtar Singh matharu on 2023-04-18.
//

import SwiftUI

struct SignUP: View {
    
    let screenBounds = UIScreen.main.bounds;
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var email: String = ""

    
    var body: some View {
       
        GeometryReader{ geometry in
            
            VStack{
                Text("Sign Up")
                    .font(.title)
                    .bold()
                    .border(.red)
                    .padding(.trailing,geometry.size.width*0.72)
                    .border(.black)
                    .padding(.bottom,3)
                Text("Welcome to SignUp page")
                    .border(.yellow)
                    .padding(.trailing,20)
                    .padding(.trailing,geometry.size.width*0.42)
                    .padding(.bottom,geometry.size.width*0.31)
                    .border(.orange)
                
                HStack{
                    Button(action: {
                        print("hello")
                    }) {
                        Text("Google")
                    }
                    .frame(width: geometry.size.width*0.46, height: 40)
                    .border(.gray)
                    .padding(.trailing)
                   
                    
                    Button(action: {
                        print("hello")
                    }) {
                        Text("Facebook")
                    }
                    .frame(width: geometry.size.width*0.46, height: 40)
                    .border(.gray)
                   
                    
                }
                .border(.orange)
                .padding(.bottom)
                Text("or register with E-Mail")
                    .border(.yellow)
                    .padding(.bottom)
                
              
                TextField("Email", text: $email)
                
                    .frame(width: geometry.size.width, height: 60)
                    .font(.system(size: 20))
                    .cornerRadius(10)
                    .border(.blue)
                    .background(Color.gray.opacity(0.2))
                    .border(.orange)
                    .padding(.bottom)
             
                TextField("Name", text: $name)
                
                    .frame(width: geometry.size.width, height: 60)
                    .font(.system(size: 20))
                    .cornerRadius(10)
                    .border(.blue)
                    .background(Color.gray.opacity(0.2))
                    .border(.orange)
                    .padding(.bottom)

               
                
                SecureField("Password", text: $password)
                    .frame(width: geometry.size.width, height: 60)
                    .font(.system(size: 18))
                    .cornerRadius(10)
                    .background(Color.gray.opacity(0.2))
                    .border(.orange)
                    .padding(.bottom,geometry.size.width*0.4)
                    .padding(.bottom)

                Button(action: {
                    print("hello")
                }) {
                    Text("Button Text")
                }
                .frame(width: geometry.size.width, height: 60)
                .border(.gray)
                .background(Color.blue)
                .foregroundColor(.white)

            }
            .frame(width: geometry.size.width,height: geometry.size.height)
            .border(.red)

            
        }
        .border(.blue)
        
    
    }
}
struct SignUP_Previews: PreviewProvider {
    static var previews: some View {
        SignUP()
    }
}

