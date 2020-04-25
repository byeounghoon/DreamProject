//
//  ContentView.swift
//  DreamProject
//
//  Created by ByoungHoon Yun on 27/09/2019.
//  Copyright © 2019 ByoungHoon. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var magicNumber : [Int] = [1, 4, 5, 8, 10,
                               11, 12, 13, 14, 15,
                               18, 19, 20, 21, 24,
                               26, 31, 33, 36, 37,
                               39, 45]
    
    @State var firstNumber: String = " "
    @State var secondNumber: String = " "
    @State var thirdNumber: String = " "
    @State var fourthNumber: String = " "
    @State var fifthNumber: String = " "
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: HorizontalAlignment.center, spacing: 30) {
                Text(firstNumber).font(Font.system(size: 30, weight: Font.Weight.bold, design: Font.Design.monospaced))
                Text(secondNumber).font(Font.system(size: 30, weight: Font.Weight.bold, design: Font.Design.monospaced))
                Text(thirdNumber).font(Font.system(size: 30, weight: Font.Weight.bold, design: Font.Design.monospaced))
                Text(fourthNumber).font(Font.system(size: 30, weight: Font.Weight.bold, design: Font.Design.monospaced))
                Text(fifthNumber).font(Font.system(size: 30, weight: Font.Weight.bold, design: Font.Design.monospaced))
                Button(action: {
                    self.firstNumber = self.magicNumber.randomNumber()
                    self.secondNumber = self.magicNumber.randomNumber()
                    self.thirdNumber = self.magicNumber.randomNumber()
                    self.fourthNumber = self.magicNumber.randomNumber()
                    self.fifthNumber = self.magicNumber.randomNumber()
                }) {
                    Text("랜덤 시작!")
                }
            }//.navigationBarTitle(Text("인생 역전 가즈앗!!!"))
        }
        
    }
}

extension Collection where Element==Int {
    func randomNumber() -> String {
        return shuffled().enumerated()
            .compactMap{ $0 < 6 ? $1 : nil }
            .sorted(by: <)
            .map{"\($0)"}
            .joined(separator: ",")
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}
#endif

