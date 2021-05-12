//
//  MainView.swift
//  UI-183
//
//  Created by にゃんにゃん丸 on 2021/05/12.
//

import SwiftUI

struct MainView: View {
    @State var txt = ""
    @State var pas = ""
    var body: some View {
        ZStack{
            
            
            Color("n")
                .edgesIgnoringSafeArea(.all)
            
            
            VStack{
                
                VStack(spacing:15){
                    
                    Text("Let's Start")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 10, y: 10)
                        .shadow(color: .white.opacity(0.3), radius: 5, x: -10, y: -10)
                    
                    
                    Image("p1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 300)
                        .clipShape(Circle())
                        .modifier(TOPModify())
                        .padding(.bottom,30)
                    
                    HStack{
                        
                         Image(systemName: "envelope.fill")
                            .font(.title2)
                            .foregroundColor(.primary.opacity(0.3))
                            .modifier(ImagModefy())
                            .padding(.leading,3)
                        
                        TextField("Enter Name", text: $txt)
                        .modifier(TFModify())
                          
                        
                        
                        
                        
                    }
                    
               
                    
                    HStack{
                        
                        
                        Image(systemName: "lock.fill")
                           .font(.title2)
                            .foregroundColor(.primary.opacity(0.3))
                            .modifier(ImagModefy())
                            .padding(.leading,3)
                            
                        
                        
                            SecureField("Enter PassWord", text: $pas)
                               .modifier(TFModify())
                                .overlay(
                                
                                
                              
                            
                       
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "eye.fill")
                                    .font(.title2)
                                    .foregroundColor(.gray)
                                    
                            })
                                    ,alignment: .trailing
                                )
                            
                        
                       
                        
                        
                        
                    }
                    .padding(.top,15)
                    
                    
                    
                    Spacer(minLength: 0)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Login or Forgot Password　?")
                            .foregroundColor(.black.opacity(0.3))
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                    })
                    .buttonStyle(ButtonModifier())
                    .padding(.bottom,25)
                   
                    
                    NavigationLink(
                        destination: NEXT(),
                        label: {
                            Text("Enter Your Height & Weight")
                                .foregroundColor(.black.opacity(0.3))
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                        
                        
                        
                           
                        })
                        .buttonStyle(ButtonModifier())
                        .padding(.bottom,getSafeArea().bottom == 0 ? 15 : getSafeArea().bottom)
                    
                    
                      
                    
                    
                }
            }
            .padding(.horizontal)
        }
       
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct TOPModify : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(20)
            
            .background(Color("n"))
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.2), radius: 6, x: 10, y: 10)
            .shadow(color: .white.opacity(0.5), radius: 6, x: -8, y: -8)
    }
}

struct TFModify : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(20)
            .background(Color("n"))
            .cornerRadius(20)
            .overlay(
            
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black.opacity(0.05),lineWidth: 5)
                .shadow(color: .black.opacity(0.2), radius: 3, x: 5, y: 5)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(color: .white.opacity(0.5), radius: 3, x: -5, y: -5)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            
            )
    }
}

struct ButtonModifier : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.background(Color("n")).cornerRadius(10)
            .overlay(
                VStack{
                    
                    
                    if configuration.isPressed{
                        
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black.opacity(0.05),lineWidth: 5)
                            .shadow(color: .black.opacity(0.2), radius: 5, x: 5, y: 5)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(color: .white.opacity(0.5), radius: 5, x: -3, y: -3)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                        
                        
                    }
                }
            
            )
            .shadow(color: .black.opacity(0.2), radius: 5, x: 5, y: 5)
           .shadow(color: .white.opacity(0.5), radius: 5, x: -5, y: -5)
    }
}

struct ImagModefy : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(20)
         
            .background(Color("n"))
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.2), radius: 6, x: 5, y: 5)
            .shadow(color: .white.opacity(0.5), radius: 6, x: 5, y: 5)
           
    }
}

func getSafeArea()->UIEdgeInsets{
    
    return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
}
