//
//  ScissorPaperRockViewModel.swift
//  ScissorPaperRockGame
//
//  Created by Prabesh Shrestha on 26/08/2024.
//

import Foundation
final class ScissorPaperRockViewModel: ObservableObject{
    @Published var round = 3
    let gameComponent: [String] = ["✂️","🧻","🪨"]
    @Published var userChoice: String? = nil
    
    @Published var cpuChoice: String? = nil
    
    @Published var lose: Bool = false
    
    @Published var cpuScoreCount: Int = 0
    @Published var userScoreCount: Int = 0
    @Published var message = ""
    @Published var showAlert = false
    
    @Published var text = ""
    
    enum Winner{
        case cpu, user, draw
    }
    
    func chooseRound(number: Int){
        self.round = number
    }
    
    func cpuMove(){
        let randomNumber = [0,1,2].randomElement() ?? 1
        cpuChoice = gameComponent[randomNumber]
    }
    
    func choseWinner() -> Winner{
        if (cpuChoice == gameComponent[0] && userChoice == gameComponent[1]) || (cpuChoice == gameComponent[1] && userChoice == gameComponent[2]) || (cpuChoice == gameComponent[2] && userChoice == gameComponent[0]) {
            return .cpu
        }else if(userChoice == gameComponent[0] && cpuChoice == gameComponent[1]) || (userChoice == gameComponent[1] && cpuChoice == gameComponent[2]) || (userChoice == gameComponent[2] && cpuChoice == gameComponent[0]){
            return .user
        }else{
            return .draw
        }
    }
    
    func showWinner(){
        if round != 0{
            cpuMove()
            let winner = choseWinner()
            switch winner{
            case .cpu:
                cpuScoreCount += 1
                text = "CPU won this round!"
                round -= 1
            case .user:
                userScoreCount += 1
                text = "User won this round!"
                round -= 1
            case .draw:
                text = "It's a draw!"
            }
        }
        
        if round == 0{
             if cpuScoreCount > userScoreCount{
                showAlert = true
                message = "Cpu win!"
                lose = true
            }else{
                showAlert = true
                message = "User win!"
            }
        }
    }
    
    
    func reset(){
        lose = false
        cpuChoice = nil
        userChoice = nil
        cpuScoreCount = 0
        userScoreCount = 0
        round = 3
        text = ""
    }
}
