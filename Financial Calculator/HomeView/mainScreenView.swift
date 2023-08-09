//
//  mainScreenView.swift
//  Financial Calculator
//
//  Created by Eranga prabath on 2023-07-18.
//

import SwiftUI

struct mainScreenView: View {
    var body: some View {
            VStack{
                homeViewIcons()
            }.ignoresSafeArea()
       
    }
}

struct mainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        mainScreenView()
    }
}
