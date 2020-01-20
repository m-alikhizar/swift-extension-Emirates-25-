//
//  ContentView.swift
//  calculator
//
//  Created by KH on 1/15/20.
//  Copyright © 2020 KH. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var firstValue = 0
    @State private var secondValue = 0
    @State private var operand = ""
    @State private var isTypingNumber = false
    @State private var calculatorText = "0"
    
    var body: some View {
        VStack(spacing: 0.0){
            Text(calculatorText)
                .font(.largeTitle)
                .multilineTextAlignment(.trailing)
                
            HStack(spacing: 1.0){
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("C")
                        .padding(.all)
                        .frame(width: 89
                            , height: 89)
                    .onTapGesture {
                        self.clear()
                    }
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("")
                        .padding(.all)
                        .frame(width: 89
                            , height: 89)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("")
                        .padding(.all)
                        .frame(width: 89, height: 89)
                }
                Button(action: {
                    self.calculate("/")
                }) {
                    Text("/")
                        .padding(.all)
                        .frame(width: 89, height: 89)
                }
            }
            .padding(0.0)
            HStack(spacing: 1.0){
                
                Button(action: {
                    self.digitTapped(7)
                }) {
                    Text("7")
                        .padding(.all)
                        .frame(width: 89
                            , height: 89)
                }
                Button(action: {
                    self.digitTapped(8)
                }) {
                    Text("8")
                        .padding(.all)
                        .frame(width: 89
                            , height: 89)
                }
                Button(action: {
                    self.digitTapped(9)
                }) {
                    Text("9")
                        .padding(.all)
                        .frame(width: 89, height: 89)
                }
                Button(action: {
                    self.calculate("x")
                }) {
                    Text("x")
                        .padding(.all)
                        .frame(width: 89, height: 89)
                }
            }
            .padding(0.0)
            HStack(spacing: 1.0){
                
                Button(action: {
                    self.digitTapped(4)
                }) {
                    Text("4")
                        .padding(.all)
                        .frame(width: 89
                            , height: 89)
                }
                Button(action: {
                    self.digitTapped(5)
                }) {
                    Text("5")
                        .padding(.all)
                        .frame(width: 89
                            , height: 89)
                }
                Button(action: {
                    self.digitTapped(6)
                }) {
                    Text("6")
                        .padding(.all)
                        .frame(width: 89, height: 89)
                }
                Button(action: {
                    self.calculate("-")
                }) {
                    Text("-")
                        .padding(.all)
                        .frame(width: 89, height: 89)
                }
            }
            .padding(0.0)
            HStack(spacing: 1.0){
                
                Button(action: {
                    self.digitTapped(1)
                }) {
                    Text("1")
                        .padding(.all)
                        .frame(width: 89
                            , height: 89)
                }
                Button(action: {
                    self.digitTapped(2)
                }) {
                    Text("2")
                        .padding(.all)
                        .frame(width: 89
                            , height: 89)
                }
                Button(action:{
                    self.digitTapped(3)
                }) {
                    Text("3")
                        .padding(.all)
                        .frame(width: 89, height: 89)
                }
                Button(action: {
                    self.calculate("+")
                }) {
                    Text("+")
                        .padding(.all)
                        .frame(width: 89, height: 89)
                }
            }
            .padding(0.0)
            HStack(spacing: 1.0){
                
                Button(action: {
                    self.digitTapped(0)
                }) {
                    Text("0")
                        .padding(.all)
                        .frame(width: 178
                            , height: 89)
                }
                Button(action:{
                    self.float(".")
                }) {
                    Text(".")
                        .padding(.all)
                        .frame(width: 89, height: 89)
                }
                Button(action: {
                    self.result()
                }) {
                    Text("=")
                        .padding(.all)
                        .frame(width: 89, height: 89)
                }
            }
            .padding(0.0)
        }
    }

    private func digitTapped(_ number: Int) -> Void{
        if isTypingNumber {
            calculatorText += String(number)
        } else {
            calculatorText = String(number)
            isTypingNumber = true
        }
    }
    
    private func float(_ dot: String) -> Void{
        if !calculatorText.contains(dot) {
            if isTypingNumber {
                calculatorText += dot
            } else {
                calculatorText = "0" + dot
                isTypingNumber = true
            }
        }
    }

    private func calculate(_ op: String) -> Void{
        secondValue = Int(calculatorText)!
        
        
        if op == "+" {
            firstValue = firstValue + secondValue
        } else if op == "-" {
            firstValue = firstValue - secondValue
        } else if op == "x" {
           firstValue = firstValue * secondValue
        } else if op == "/" {
            firstValue = firstValue / secondValue
        }

//        firstValue = firstValue operand secondValue
        
        operand = op
        calculatorText = op

        print(firstValue)
        print(operand)
        print(secondValue)

        isTypingNumber = false
    }
    
    private func result() {
        self.calculate(operand)
        calculatorText = String(firstValue)
    }

    private func clear() -> Void{
        calculatorText = "0"
        firstValue = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
