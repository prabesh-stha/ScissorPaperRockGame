//
//  ContentView.swift
//  ScissorPaperRockGame
//
//  Created by Prabesh Shrestha on 26/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var round = 3
    let rounds = [3,5,7]
    var body: some View {
        VStack {
            Text("Choose a number of round")
                .font(.headline)
                .bold()
            Picker("Choose round", selection: $round) {
                ForEach(rounds, id: \.self){round in
                        Text("\(round)")
                }
            }
            .pickerStyle(.segmented)
            
            NavigationLink {
                ScissorPaperRockView(round: round)
            } label: {
                Text("Set round")
                    .font(.headline)
                    .padding()
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }

        }
        .navigationTitle("Scissor Paper Rock")
        .padding()
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
