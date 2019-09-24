//
//  ContentView.swift
//  Bullseye
//
//  Created by Brett Ferrell on 9/22/19.
//  Copyright © 2019 Brett Ferrell. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
   @State var alertIsVisible: Bool = false
   @State var sliderValue: Double = 50.0
   @State var target: Int = Int.random(in: 1...100)
    
    var body: some View {
      VStack {
        // Target Row
         Spacer()
        HStack{
            Text("Put the Bullseye as close as you can to:")
         Text("\(self.target)")
        }
         Spacer()
         
        // Slider Row
        HStack{
            Text("1")
            Slider(value: self.$sliderValue, in: 1...100)
            Text("100")

        }
         Spacer()
         
         // Hit Me Row
         Button(action: {
           print("Start Over was pressed")
           self.alertIsVisible = true
         }) {
           Text("Hit Me!")
         }
         Spacer()
         
        // Score Row
         HStack{
            Button(action: {
              print("Start Over was pressed")
              self.alertIsVisible = true
            }) {
              Text("Start over")
            }
            Spacer()
            Text("Score: ")
            Text("99999")
            Spacer()
            Text("Round: ")
            Text("999")
            Spacer()
            Button(action: {
              print("Info was pressed")
              self.alertIsVisible = true
            }) {
              Text("Info")
            }
         }
         .padding(.bottom, 20)
         .alert(isPresented: $alertIsVisible) { () ->
            Alert in
            let roundedValue: Int = Int(self.sliderValue.rounded())
            return Alert(title: Text("Hello There"), message: Text(
               "Slider Value: \(roundedValue).\n" +
               "You Scored \(self.pointsForCurrentRound()) points this round"
               ), dismissButton: .default(Text("Awesome!")))
        }
      }
    }
   // Functions
   func pointsForCurrentRound() -> Int {
      let roundedValue: Int = Int(self.sliderValue.rounded())
      let difference: Int = abs(self.target - roundedValue)
      let awardedPoints: Int = 100 - difference
      return awardedPoints
      
/*      var difference: Int
      var roundedValue: Int = Int (self.sliderValue.rounded())
      if roundedValue > self.target {
         difference = roundedValue - self.target
      } else if self.target > roundedValue {
         difference = self.target - roundedValue
      } else {
         difference = 0
      }
      var awardedPoints: Int = 100 - difference
      return awardedpPints */
      
/*      var difference: Int
      var roundedValue: Int = Int (self.sliderValue.rounded())
      difference = roundedValue - self.target
      if difference < 0 {
         difference *= -1
      }
      var awardedPoints: Int = 100 - difference
      return awardedPoints */
      
      
      
   }
   
  /* func differnceToTarget() -> Int {
      let differenceTarget = abs(self.sliderValue.rounded() - self.target)
      return differenceTarget
   } */
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(
            .fixed(width: 896, height: 414))
    }
}
