//
//  splashScreen.swift
//  Financial Calculator
//
//  Created by Eranga prabath on 2023-07-18.
//

import SwiftUI

struct splashScreen: View {
    @State var isOpen = false
  
    var body: some View {
        Group{
            if isOpen{
                ZStack(alignment:.top){
                   
                  
                        
                    mainScreenView()
                    
                    topView()
                        .offset(y:25)
                    
                        
                  
                      
                }.edgesIgnoringSafeArea(.all)
            
            }
            
            else{
                ZStack{
                    
                    LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.8),.blue]), startPoint: .top, endPoint: .bottom)
                 topView()
                }.ignoresSafeArea(.all)
                    .onAppear{
                        withAnimation(.easeOut(duration: 0.3)){
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4){
                                self.isOpen = true
                            }
                        }
                    }
            }
        }
    }
}

struct splashScreen_Previews: PreviewProvider {
    static var previews: some View {
        splashScreen()
    }
}
