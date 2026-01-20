//
//  CodeBreaker.swift
//  CodeBreaker
//
//  Created by James Tench on 1/18/26.
//

// import Foundation
import SwiftUI

typealias Peg = Color

struct CodeBreaker {
    var masterCode = Code(kind: .master(isHidden: true))
    var guess = Code(kind: .guess)
    var attempts = [Code]()
    let pegChoices: [Peg]
    
    
    
    var isOver: Bool {
        return attempts.last?.pegs == masterCode.pegs
    }
    
    
    init(pegChoices: [Peg] = [.red, .green, .blue, .yellow]) {
        self.pegChoices = pegChoices
        masterCode.randomize(from: pegChoices)
    }
    
    
    mutating func setGuessPeg(_ peg: Peg, at index: Int) {
        guard index >= 0 && index < guess.pegs.count else { return }
        guess.pegs[index] = peg
    }
    
    mutating func attemptGuess() {
        var attempt = guess
        attempt.kind = .attempt(guess.match(against: masterCode))
        attempts.append(attempt)
        guess.reset()
        if isOver {
            masterCode.kind = .master(isHidden: false)
        }
    }
    
    
    mutating func changeGuessPeg(at index: Int) {
        let existingPeg = guess.pegs[index]
        if let indexOfExistingPegInePegChoices = pegChoices.firstIndex(of: existingPeg) {
            let newPeg = pegChoices[(indexOfExistingPegInePegChoices + 1) % pegChoices.count]
            guess.pegs[index] = newPeg
        } else {
            guess.pegs[index] = pegChoices.first ?? Code.missingPeg
        }
    }
    
    mutating func restart() {
        masterCode.randomize(from: pegChoices)
        attempts.removeAll()
        guess.reset()
        masterCode.kind = .master(isHidden: true)
    }
}





