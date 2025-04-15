//
//  ContentView.swift
//  progress-watch Watch App
//
//  Created by Shohei Yamasaki on 2025/04/15.
//

import SwiftUI

struct ContentView: View {

    @StateObject var vm: ContentViewModel = .init()
    
    var body: some View {
        VStack {
            Text("\(vm.progressTime) %")
                .font(.system(size: 40, weight: .bold, design: .default))
            Button(action: {
                vm.update();
            }, label: {
                Text("Update");
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
