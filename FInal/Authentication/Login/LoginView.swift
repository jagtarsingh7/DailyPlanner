//
//  Controller.swift
//  FInal
//
//  Created by Jagtar Singh matharu on 2023-04-18.
//

import SwiftUI
//import FBSDKLoginKit

struct LoginView: View {
    
    @State private var name: String = ""
    @State private var password: String = ""
    @AppStorage("email") var email: String = ""
    @AppStorage("logged") var logged=false;
    @State private var navigationLinkIsActive = false


//    @State var manager = LoginManager()
    var body: some View {
        GeometryReader{ geometry in
            NavigationView(){
                VStack{
                    Text("Login")
                        .font(.title)
                        .bold()
                        .padding(.trailing,geometry.size.width*0.82)
                    
                    Text("Welcome to login page")
                        .padding(.trailing,20)
                        .padding(.trailing,geometry.size.width*0.54)
                        .padding(.bottom,geometry.size.width*0.4)

                    TextField("Name", text: $name)
                    
                        .frame(width: geometry.size.width, height: 60)
                        .font(.system(size: 20))
                        .cornerRadius(10)
                        .background(Color.gray.opacity(0.2))
                    
                        .padding()
                    
                    SecureField("Password", text: $password)
                        .frame(width: geometry.size.width, height: 60)
                        .font(.system(size: 18))
                        .cornerRadius(10)
                        .background(Color.gray.opacity(0.2))
                    
                    
                    Text("Sign up or reset?")
                        .padding(.bottom,geometry.size.width*0.45)
                        .padding(.leading,geometry.size.width*0.62)
                    Text("or login with")
                    Button(action: {
                        
//                        manager.logIn(permissions:["public_profile","email"], from:nil ){(result, err ) in
//
//                            if(err != nil)
//                            {
//                                print(err!.localizedDescription)
//                                return
//                            }
//                            //loggin success
//
//                            if !result!.isCancelled{
//                                logged = true
//
//                                //getting details
//
//
//                                let request = GraphRequest(graphPath: "me",
//                                                           parameters:["fields":"email"])
//
//                                request.start{(_, res, _) in
//
//                                    guard let profileData=res as? [String :Any] else {return}
//
//                                    email=profileData["email"] as! String
//
//                                }
//                                navigationLinkIsActive = true
//
//                            }
                    //    }
                                                
                    }) {
                        Text("Facebook")
                    }
                    .frame(width: geometry.size.width*0.46, height: 40)
                    .border(.black)
                   
                    
                    Spacer()
                    //                        Button(action: {}) {
                    //
                    //                      }
                    //                      .frame(width: geometry.size.width, height:60)
                    //                      .border(.gray)
//                        .background(Color.blue)
//                        .foregroundColor(.white)
                    
                    NavigationLink(destination: Menu()) {
                        Text("Logged In")
                    }.frame(width: geometry.size.width, height:60)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .padding(.bottom)
                    
                }
                .frame(width: geometry.size.width,height: geometry.size.height)
                
            }
        }
        
    
    }
}
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

