//
//  SavingViewController.swift
//  Financial Calculator
//
//  Created by Eranga prabath on 2023-07-19.
//

import Foundation
class savingViewController:ObservableObject{
    
    @Published var presentValue:Double = 0.0
    @Published var futureValue:Double = 0.0
    @Published var interest:Double = 0.0
    @Published var payment:Double = 0.0
    @Published var noPaymentsPY:Double = 0.0
    @Published var compundsPY:Double = 0.0
    @Published var totalSaving:Double = 0.0
    @Published var principalvalue:Double = 0.0
    
    func calcutateTime() -> Double{
        let time = (log(futureValue / presentValue)) / compundsPY * (log(1 + (0.032 / compundsPY)))
        return time
    }
    func calculateCompundPayments(){
        let powerValue = compundsPY * 5.0
        let baseValue = 1 + interest/compundsPY
        futureValue = presentValue * pow(baseValue, powerValue)
        print(futureValue)
    }
    func calInterestRate(){
        let powerValue = 1 / compundsPY * 10
        let baseValue = futureValue / presentValue
        interest = compundsPY * (pow(baseValue, powerValue) - 1)
        print(interest)
    }
    func pricipalValueCalculation(){
        let powerValue = compundsPY * 5
        let baseVaue = 1 + (interest/compundsPY)
        principalvalue = futureValue / pow(baseVaue,powerValue)
        print(principalvalue)
    }
   
}
