//
//  mortgageView.swift
//  Financial Calculator
//
//  Created by Eranga prabath on 2023-07-20.
//

import SwiftUI
import Combine

struct mortgageView: View {
    @State var loanAmount = ""
    @State var interest = ""
    @State var pyaments = ""
    @State var noOfYear = ""
    @FocusState var isFocused : Bool
    @StateObject var vm = savingViewController()
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.8),.blue]), startPoint: .top, endPoint: .bottom)
            VStack{
                
                Text("Mortgage")
                    .font(.system(size: 30,weight: Font.Weight.semibold))
                    .foregroundColor(Color.white)
                
                TextField("", text: $loanAmount)
                    .modifier(placeHolderTheme(showPlaceHolder: loanAmount.isEmpty, placeHolder: "Present Value"))
                    .font(.system(size: 16,weight: Font.Weight.semibold))
                    .frame(width: 356,height: 40)
                    .accentColor(Color.red)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.linearGradient(Gradient(colors: [.green,.orange,.red,.yellow]), startPoint: .trailing, endPoint: .leading),lineWidth: 2)
                    )
                
                    .keyboardType(.decimalPad)
                    .focused($isFocused)
                    .onReceive(Just(loanAmount)){
                        newValue in
                        let numberOnly = newValue.filter{"0123456789.".contains($0)}
                        if numberOnly != newValue{
                            self.loanAmount = numberOnly
                        }
                    }
                    .onChange(of: loanAmount){ newValue in
                        if let decimalIndex = newValue.firstIndex(of: "."){
                            let removeSeconDecimal = newValue[decimalIndex...].dropFirst()
                            if removeSeconDecimal.contains("."){
                                self.loanAmount = String(newValue.prefix(upTo: decimalIndex) + removeSeconDecimal.filter{
                                    $0 != "."
                                })
                            }
                        }
                    }
                TextField("", text: $interest)
                    .focused($isFocused)
                    .accentColor(Color.red)
                    .modifier(placeHolderTheme(showPlaceHolder: interest.isEmpty, placeHolder: "Future Value"))
                    .font(.system(size: 16,weight: Font.Weight.semibold))
                    .frame(width: 356,height: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.linearGradient(Gradient(colors: [.green,.orange,.red,.yellow]), startPoint: .trailing, endPoint: .leading),lineWidth: 2)
                    )
                
                    .keyboardType(.decimalPad)
                    .onReceive(Just(interest)){
                        newValue in
                        let numberOnly = newValue.filter{"0123456789.".contains($0)}
                        if numberOnly != newValue{
                            self.interest = numberOnly
                        }
                    }
                    .onChange(of: interest){ newValue in
                        if let decimalIndex = newValue.firstIndex(of: "."){
                            let removeSeconDecimal = newValue[decimalIndex...].dropFirst()
                            if removeSeconDecimal.contains("."){
                                self.interest = String(newValue.prefix(upTo: decimalIndex) + removeSeconDecimal.filter{
                                    $0 != "."
                                })
                            }
                        }
                    }
                TextField("", text: $interest)
                    .focused($isFocused)
                    .accentColor(Color.red)
                    .modifier(placeHolderTheme(showPlaceHolder: interest.isEmpty, placeHolder: "Interest"))
                    .font(.system(size: 16,weight: Font.Weight.semibold))
                    .frame(width: 356,height: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.linearGradient(Gradient(colors: [.green,.orange,.red,.yellow]), startPoint: .trailing, endPoint: .leading),lineWidth: 2)
                    )
                
                    .keyboardType(.decimalPad)
                    .onReceive(Just(interest)){
                        newValue in
                        let numberOnly = newValue.filter{"0123456789.".contains($0)}
                        if numberOnly != newValue{
                            self.interest = numberOnly
                        }
                    }
                    .onChange(of: interest){ newValue in
                        if let decimalIndex = newValue.firstIndex(of: "."){
                            let removeSeconDecimal = newValue[decimalIndex...].dropFirst()
                            if removeSeconDecimal.contains("."){
                                self.interest = String(newValue.prefix(upTo: decimalIndex) + removeSeconDecimal.filter{
                                    $0 != "."
                                })
                            }
                        }
                    }
                TextField("", text: $pyaments)
                    .focused($isFocused)
                    .accentColor(Color.red)
                    .modifier(placeHolderTheme(showPlaceHolder: pyaments.isEmpty, placeHolder: "Payment"))
                    .font(.system(size: 16,weight: Font.Weight.semibold))
                    .frame(width: 356,height: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.linearGradient(Gradient(colors: [.green,.orange,.red,.yellow]), startPoint: .trailing, endPoint: .leading),lineWidth: 2)
                    )
                
                    .keyboardType(.decimalPad)
                    .onReceive(Just(pyaments)){
                        newValue in
                        let numberOnly = newValue.filter{"0123456789.".contains($0)}
                        if numberOnly != newValue{
                            self.pyaments = numberOnly
                        }
                    }
                    .onChange(of: pyaments){ newValue in
                        if let decimalIndex = newValue.firstIndex(of: "."){
                            let removeSeconDecimal = newValue[decimalIndex...].dropFirst()
                            if removeSeconDecimal.contains("."){
                                self.pyaments = String(newValue.prefix(upTo: decimalIndex) + removeSeconDecimal.filter{
                                    $0 != "."
                                })
                            }
                        }
                    }
                
                
                Button(action:{
                    
                }){
                    ZStack{
                 RoundedRectangle(cornerRadius: 5)
                            .frame(width: 270,height: 50)
                            .foregroundStyle(.linearGradient(Gradient(colors: [.orange,.red,.yellow]), startPoint: .trailing, endPoint: .leading))
                        Text("Calculate")
                            .foregroundColor(Color.white)
                            .font(.system(size: 20,weight: Font.Weight.bold))
                    }
                }
            }
        }.ignoresSafeArea(.all)
        
        
            .navigationBarBackButtonHidden(true)
    }
}

struct mortgageView_Previews: PreviewProvider {
    static var previews: some View {
        mortgageView()
    }
}



