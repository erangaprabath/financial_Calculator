//
//  homeView.swift
//  Financial Calculator
//
//  Created by Eranga prabath on 2023-07-18.
//

import SwiftUI

struct homeViewIcons: View {

    var body: some View {
        NavigationView{
            
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.8),.blue]), startPoint: .top, endPoint: .bottom)
                VStack(spacing:50){
               
                    HStack(spacing:30){
                        NavigationLink(destination: SavingViews()){
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .scaledToFill()
                                    .foregroundColor(Color.black.opacity(0.3))
                                    .frame(width: 150,height: 100)
                                VStack{
                                    Image("3347971")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100,height: 100)
                                    
                                    Text("Savings")
                                    .foregroundColor(Color.white)
                                    
                                }
                            }
                        }
                        NavigationLink(destination: splashScreen()){
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .scaledToFill()
                                    .foregroundColor(Color.black.opacity(0.3))
                                    .frame(width: 150,height: 100)
                                VStack{
                                    
                                    Image("images")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100,height: 100)
                            
                                    Text("Compund Savings")
                                        .foregroundColor(Color.white)
                                }
                            }
                        }
                    }
                    HStack(spacing:30){
                        NavigationLink(destination:mortgageView()){
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .scaledToFill()
                                    .foregroundColor(Color.black.opacity(0.3))
                                    .frame(width: 150,height: 100)
                                VStack{
                                    Image("1102760")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100,height: 100)
                                    Text("Mortgage")
                                        .foregroundColor(Color.white)
                                }
                            }
                        }
                        NavigationLink(destination:helpView()){
                            ZStack(alignment:.center){
                                RoundedRectangle(cornerRadius: 10)
                                    .scaledToFill()
                                    .foregroundColor(Color.black.opacity(0.3))
                                    .frame(width: 150,height: 100)
                                VStack{
                                    Image("868681")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100,height: 100)
                                        .onTapGesture {
                                            
                                        }
                                    Text("Help")
                                        .foregroundColor(Color.white)
                                }
                            }
                        }
                    }
                }
            }.ignoresSafeArea()
            
        }
      
    }
}

struct homeViewIcons_Previews: PreviewProvider {
    static var previews: some View {
        homeViewIcons()
    }
}
