//
//  SavingViews.swift
//  Financial Calculator
//
//  Created by Eranga prabath on 2023-07-19.
//

import SwiftUI
import Combine

struct SavingViews: View {
    @State var presentValue = ""
    @State var futureValue = ""
    @State var interest = ""
    @State var payment = ""
    @State var noPaymentsPY = ""
    @State var compundsPY = ""
    @State var calculate = false
    @StateObject var vm = savingViewController()
    @FocusState var isFocused : Bool
    var body: some View {
  
            ZStack{
                       LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.8),.blue]), startPoint: .top, endPoint: .bottom)
                VStack(alignment:.center,spacing: 10){
                    Text("Compund and Loans")
                        .font(.system(size: 20,weight: Font.Weight.semibold))
                        .foregroundColor(Color.white)
                    
                    
                    TextField("", text: $presentValue)
                        .modifier(placeHolderTheme(showPlaceHolder: presentValue.isEmpty, placeHolder: "Present Value"))
                        .font(.system(size: 16,weight: Font.Weight.semibold))
                        .frame(width: 356,height: 40)
                        .accentColor(Color.red)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.linearGradient(Gradient(colors: [.green,.orange,.red,.yellow]), startPoint: .trailing, endPoint: .leading),lineWidth: 2)
                        )
                    
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                        .onReceive(Just(presentValue)){
                            newValue in
                            let numberOnly = newValue.filter{"0123456789.".contains($0)}
                            if numberOnly != newValue{
                                self.presentValue = numberOnly
                            }
                        }
                        .onChange(of: presentValue){ newValue in
                            if let decimalIndex = newValue.firstIndex(of: "."){
                                let removeSeconDecimal = newValue[decimalIndex...].dropFirst()
                                if removeSeconDecimal.contains("."){
                                    self.presentValue = String(newValue.prefix(upTo: decimalIndex) + removeSeconDecimal.filter{
                                        $0 != "."
                                    })
                                }
                            }
                        }
                    TextField("", text: $futureValue)
                        .focused($isFocused)
                        .accentColor(Color.red)
                        .modifier(placeHolderTheme(showPlaceHolder: futureValue.isEmpty, placeHolder: "Future Value"))
                        .font(.system(size: 16,weight: Font.Weight.semibold))
                        .frame(width: 356,height: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.linearGradient(Gradient(colors: [.green,.orange,.red,.yellow]), startPoint: .trailing, endPoint: .leading),lineWidth: 2)
                        )
                    
                        .keyboardType(.decimalPad)
                        .onReceive(Just(futureValue)){
                            newValue in
                            let numberOnly = newValue.filter{"0123456789.".contains($0)}
                            if numberOnly != newValue{
                                self.futureValue = numberOnly
                            }
                        }
                        .onChange(of: futureValue){ newValue in
                            if let decimalIndex = newValue.firstIndex(of: "."){
                                let removeSeconDecimal = newValue[decimalIndex...].dropFirst()
                                if removeSeconDecimal.contains("."){
                                    self.futureValue = String(newValue.prefix(upTo: decimalIndex) + removeSeconDecimal.filter{
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
                    TextField("", text: $payment)
                        .focused($isFocused)
                        .accentColor(Color.red)
                        .modifier(placeHolderTheme(showPlaceHolder: payment.isEmpty, placeHolder: "Payment"))
                        .font(.system(size: 16,weight: Font.Weight.semibold))
                        .frame(width: 356,height: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.linearGradient(Gradient(colors: [.green,.orange,.red,.yellow]), startPoint: .trailing, endPoint: .leading),lineWidth: 2)
                        )
                    
                        .keyboardType(.decimalPad)
                        .onReceive(Just(payment)){
                            newValue in
                            let numberOnly = newValue.filter{"0123456789.".contains($0)}
                            if numberOnly != newValue{
                                self.payment = numberOnly
                            }
                        }
                        .onChange(of: payment){ newValue in
                            if let decimalIndex = newValue.firstIndex(of: "."){
                                let removeSeconDecimal = newValue[decimalIndex...].dropFirst()
                                if removeSeconDecimal.contains("."){
                                    self.payment = String(newValue.prefix(upTo: decimalIndex) + removeSeconDecimal.filter{
                                        $0 != "."
                                    })
                                }
                            }
                        }
                    TextField("", text: $noPaymentsPY)
                        .focused($isFocused)
                        .accentColor(Color.red)
                        .modifier(placeHolderTheme(showPlaceHolder: noPaymentsPY.isEmpty, placeHolder: "No.Payments Per Year"))
                        .font(.system(size: 16,weight: Font.Weight.semibold))
                        .frame(width: 356,height: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.linearGradient(Gradient(colors: [.green,.orange,.red,.yellow]), startPoint: .trailing, endPoint: .leading),lineWidth: 2)
                        )
                    
                        .keyboardType(.decimalPad)
                        .onReceive(Just(noPaymentsPY)){
                            newValue in
                            let numberOnly = newValue.filter{"0123456789.".contains($0)}
                            if  numberOnly != newValue{
                                self.noPaymentsPY = numberOnly
                            }
                        }
                        .onChange(of: noPaymentsPY){ newValue in
                            if let decimalIndex = newValue.firstIndex(of: "."){
                                let removeSeconDecimal = newValue[decimalIndex...].dropFirst()
                                if removeSeconDecimal.contains("."){
                                    self.noPaymentsPY = String(newValue.prefix(upTo: decimalIndex) + removeSeconDecimal.filter{
                                        $0 != "."
                                    })
                                }
                            }
                        }
                    
                    TextField("", text: $compundsPY)
                        .focused($isFocused)
                        .accentColor(Color.red)
                        .modifier(placeHolderTheme(showPlaceHolder: compundsPY.isEmpty, placeHolder: "Compunds Per year"))
                        .font(.system(size: 16,weight: Font.Weight.semibold))
                        .frame(width: 356,height: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.linearGradient(Gradient(colors: [.green,.orange,.red,.yellow]), startPoint: .trailing, endPoint: .leading),lineWidth: 2)
                        )
                    
                        .keyboardType(.decimalPad)
                        .onReceive(Just(compundsPY)){
                            newValue in
                            let numberOnly = newValue.filter{"0123456789.".contains($0)}
                            if numberOnly != newValue{
                                if numberOnly == "."{
                                    
                                }
                                
                                self.compundsPY = numberOnly
                            }
                        }
                        .onChange(of: compundsPY){ newValue in
                            if let decimalIndex = newValue.firstIndex(of: "."){
                                let removeSeconDecimal = newValue[decimalIndex...].dropLast()
                                if removeSeconDecimal.contains("."){
                                    self.compundsPY = String(newValue.prefix(upTo: decimalIndex) + removeSeconDecimal.filter{
                                        $0 != "."
                                    })
                                }
                            }
                        }
                    Button(action:{
                   
                        setValues()

                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                            interestView()
                            compundView()
                        }
                      
                        
                       
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
                .onTapGesture {
                    isFocused = false
                }
       
    }
    func setValues(){
        
        vm.presentValue = Double(presentValue) ?? 0.00
        vm.futureValue = Double(futureValue) ?? 0.00
        vm.interest = Double(interest) ?? 0.00
        vm.payment = Double(payment) ?? 0.00
        vm.compundsPY = Double(compundsPY) ?? 0.00
        vm.noPaymentsPY = Double(noPaymentsPY) ?? 0.00
    }
    func interestView(){
        if interest == "" && futureValue != "" {
            vm.calInterestRate()
            interest = String(vm.interest)
        }
        
    }
    func compundView(){
        if futureValue == "" {
            vm.calculateCompundPayments()
            futureValue = String(vm.futureValue)
        }
        
    }
}

struct SavingViews_Previews: PreviewProvider {
    static var previews: some View {
        SavingViews()
    }
}


public struct placeHolderTheme:ViewModifier{
    var showPlaceHolder:Bool
    var placeHolder:String
    
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .leading){
            if showPlaceHolder{
                Text(placeHolder)
                    .padding()
                    .foregroundColor(Color.white.opacity(0.6))
            }
            content
                .foregroundColor(Color.white)
                .padding()
        }
    }
    
}
