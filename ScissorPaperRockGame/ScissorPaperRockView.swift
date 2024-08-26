//
//  ScissorPaperRockView.swift
//  ScissorPaperRockGame
//
//  Created by Prabesh Shrestha on 26/08/2024.
//

import SwiftUI

struct ScissorPaperRockView: View {
    @StateObject private var viewModel = ScissorPaperRockViewModel()
    @State private var showAlert = false
    let round: Int
    var body: some View {
        VStack{
            HStack{
                
                Text("Current round: \(round)")
                Spacer()
                NavigationLink {
                    ContentView()
                } label: {
                    Text("Change round")
                }
            }
            .padding(.horizontal)
            Text("Cpu Score: \(viewModel.cpuScoreCount)")
                .font(.largeTitle)
                .bold()
            if let cpuChoice = viewModel.cpuChoice{
                Text(cpuChoice)
                    .font(.system(size: 60))
                    .padding()
                    .background(Color.black.opacity(0.3))
                    .clipShape(Circle())
            }
            Spacer()
            Text(viewModel.text)
            Spacer()
            if let userChoice = viewModel.userChoice{
                Text(userChoice)
                    .font(.system(size: 60))
                    .padding()
                    .background(Color.black.opacity(0.3))
                    .clipShape(Circle())
            }
              
            HStack{
                ForEach(0..<3, id: \.self){number in
                    Button {
                        viewModel.userChoice = viewModel.gameComponent[number]
                        viewModel.showWinner()
                    } label: {
                        Text(viewModel.gameComponent[number])
                            .font(.system(size: 60))
                            .padding()

                    }.padding()

                }
                
            }
            Text("User Score: \(viewModel.userScoreCount)")
                .font(.largeTitle)
                .bold()
        }
        .alert(!viewModel.lose ? "Congratulation🥳" : "😔", isPresented: $viewModel.showAlert) {
            Button("Reset"){
                viewModel.reset()
            }
        } message: {
            Text(viewModel.message)
        }
        .onAppear{
            viewModel.chooseRound(number: round)
        }
        .onChange(of: round, {
            viewModel.chooseRound(number: round)
        })
        .navigationBarBackButtonHidden()

    }
}

#Preview {
    NavigationStack {
        ScissorPaperRockView(round: 3)
    }
}
 
