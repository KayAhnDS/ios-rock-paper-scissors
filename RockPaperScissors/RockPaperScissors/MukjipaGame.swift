//
//  MukjipaGame.swift
//  RockPaperScissors
//
//  Created by 조민호 on 2022/02/16.
//

import Foundation

struct MukjipaGame {
    private enum MukjipaType: Int {
        case muk = 1
        case ji = 2
        case pa = 3
        case exit = 0
    }
    
    private var currentTurn: Player = .none
    private let user: User
    private let computer: Computer
    private let userInterface: UserInterface
    
    init(user: User, computer: Computer, userInterface: UserInterface) {
        self.user = user
        self.computer = computer
        self.userInterface = userInterface
    }
    
    mutating func startMukjipaGame(currentTurn: Player) {
        self.currentTurn = currentTurn
        userInterface.printMukjipaGameUserInterface(currentTurn: currentTurn)
        playSelectedMenu()
    }
    
    private mutating func playSelectedMenu() {
        let userSelectedMenu: Int = user.selectedMenu()
        let muk: Int = MukjipaType.muk.rawValue
        let ji: Int = MukjipaType.ji.rawValue
        let pa: Int = MukjipaType.pa.rawValue
        
        switch userSelectedMenu {
        case muk, ji, pa:
            break
            
        case MukjipaType.exit.rawValue:
            userInterface.printGameOver()
            
        default:
            userInterface.printErrorMessage()
            self.currentTurn = .computer
            startMukjipaGame(currentTurn: self.currentTurn)
        }
    }
}
