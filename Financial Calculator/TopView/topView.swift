//
//  topView.swift
//  Financial Calculator
//
//  Created by Eranga prabath on 2023-07-18.
//

import SwiftUI

struct topView: View {
    var body: some View {
        ZStack(alignment: .top){
            HStack(alignment:.center){
                Image("3427292")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                Text("Financial Calculator")
                    .font(.system(size: 20,weight: Font.Weight.medium))
                    .frame(width: 200,height: 50)
                    .foregroundStyle(.linearGradient(Gradient(colors: [.green,.orange,.red,.yellow]), startPoint: .trailing, endPoint: .leading))
                
            }.ignoresSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width,height: 120)
                .background(Color.clear)
            
            
        }
    }
}

struct topView_Previews: PreviewProvider {
    static var previews: some View {
        topView()
    }
}
