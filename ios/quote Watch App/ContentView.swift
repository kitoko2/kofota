//
//  ContentView.swift
//  quote Watch App
//
//  Created by Dogbo Josias Ezechiel on 14/07/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: WatchViewModel = WatchViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button(action: {
                viewModel.sendDataMessage(for: .sendMotivationToFlutter, data: ["motivation": "hello"])
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
