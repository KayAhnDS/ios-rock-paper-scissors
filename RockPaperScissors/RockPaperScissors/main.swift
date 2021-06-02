//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockScissorsPaper: Int {
    case scissors = 1
    case rock
    case paper
}

enum Winner {
    case user
    case computer
    case tie
    
    var resultMessage: String {
        switch self {
        case .user:
            return "이겼습니다!"
        case .computer:
            return "졌습니다!"
        case .tie:
            return "비겼습니다!"
        }
    }
}

struct Game {
    func sanitizeNumber(from userInput: Int) -> Int {
        switch userInput {
        case 0...3:
            return userInput
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return inputFromUser()
        }
    }
    
    func inputFromUser() -> Int {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        guard let input = readLine(), let number = Int(input) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return inputFromUser()
        }
        return sanitizeNumber(from: number)
    }
    
    func whoIsWinner(userChoice: RockScissorsPaper , computerChoice: RockScissorsPaper) -> Winner {
        let valueDifference = userChoice.rawValue - computerChoice.rawValue
        switch valueDifference {
        case -2, 1:
            return Winner.user
        case 2, -1:
            return Winner.computer
        default:
            return Winner.tie
        }
    }
    
    func printGameResult(winner result: Winner) {
        print(result.resultMessage)
    }
    
    func playRound(userInput: Int) {
        guard let userChoice = RockScissorsPaper(rawValue: userInput),
              let computerChoice = RockScissorsPaper(rawValue: Int.random(in: 1...3))
        else {
            return
        }
        let result = whoIsWinner(userChoice: userChoice, computerChoice: computerChoice)
        printGameResult(winner: result)
        start()
    }
    
    func isGameEnd(userInput: Int) -> Bool {
        return userInput == 0
    }
    
    func start() {
        let userInput = inputFromUser()
        if isGameEnd(userInput: userInput) {
            print("게임 종료")
            return
        }
        playRound(userInput: userInput)
    }
}

let game = Game()
game.start()
