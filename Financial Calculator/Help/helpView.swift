//
//  helpView.swift
//  Financial Calculator
//
//  Created by Eranga prabath on 2023-08-09.
//

import SwiftUI

struct helpView: View {
    @State var savingAmount:String = ""
    @State var savingIntersetRate:String = ""
    var body: some View {
        ZStack{
            Color.red
            VStack{
                Text("Need helps")
                Button(action:{
                   
                }){
                    Text("For saving help click here")
                }
               
                
          
            }
        }.ignoresSafeArea()
    }
}

struct helpView_Previews: PreviewProvider {
    static var previews: some View {
        helpView()
    }
}
