//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Kembly Muñoz valencia on 15/9/23.
//

import Foundation

final class RMCharacterDetailViewViewModel{
    private let character: RMCharacter
    init (character: RMCharacter) {
        self.character = character
        
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
