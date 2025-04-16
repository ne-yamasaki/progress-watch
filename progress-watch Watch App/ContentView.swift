//
//  ContentView.swift
//  progress-watch Watch App
//
//  Created by Shohei Yamasaki on 2025/04/15.
//

import SwiftUI

struct ContentView: View {

    @StateObject var vm: ContentViewModel = .init();
    
    let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    let lightPink = Color(red: 1, green: 0.7137, blue: 0.7569)
    
    var body: some View {
        ZStack {
            Text("")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            skyBlue,
                            lightPink,
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    ))
            VStack {
                Text("\(vm.progressTime) %")
                    .font(.system(size: 40, weight: .bold, design: .default))
                    .onAppear() {
                        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) {timer in
                            vm.update();
                        }
                    }
                ProgressView(value: vm.progressValue)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
