//
//  ContentView.swift
//  animations
//
//  Created by Till Hemmerich on 12.07.23.
//

import SwiftUI

struct ContentView: View {
    @State var buttonX = 0.0
    @State var buttonY = 0.0
    @State var animateButton = false
    @State var turnRectangle = false
    @State var animateME = false
    @State var isOn = false
    var body: some View {
        VStack {
            Button("Click ME"){
                animateButton.toggle()
            }
            .offset(y:animateButton ? 200 : 0)
            
            Button("FlipMe"){
                turnRectangle.toggle()
            }
            Button("LETS GO"){
                animateME.toggle()
            }
            Rectangle()
                .frame(width: 100,height: 100)
                .foregroundColor(.red)
                .rotationEffect(Angle(degrees: turnRectangle ? 75 : 0))
            Circle()
                .frame(width: animateME ? 50 : 200)
            Image(systemName: "square.and.arrow.up.circle")
                .resizable()
                .frame(width: 50,height: 50)
                .offset(x: animateME ? 150 : 0)
            Toggle(isOn: $isOn) {
                Text("test")
            }
            .rotationEffect(Angle(degrees: animateME ? 289 : 0))
        }
        
        .padding()
        .animation(.spring(), value: animateButton)
        .animation(.linear, value: turnRectangle)
        .animation(.spring(), value: animateME)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
