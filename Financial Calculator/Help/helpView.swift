//
//  helpView.swift
//  Financial Calculator
//
//  Created by Eranga prabath on 2023-08-09.
//

import SwiftUI

struct helpView: View {
    var body: some View {
        ZStack{
            Color.red
            VStack{
                Text("Need helps")
            }
        }.ignoresSafeArea()
    }
}

struct helpView_Previews: PreviewProvider {
    static var previews: some View {
        helpView()
    }
}
