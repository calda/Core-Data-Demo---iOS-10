//
//  Pokemon.swift
//  Core Data 10
//
//  Created by Cal Stephens on 8/12/16.
//  Copyright © 2016 Cal Stephens. All rights reserved.
//

import Foundation


//MARK: - Pokemon Kinds

enum Pokemon : String {
    case Bulbasaur
    case Charmander
    case Squirtle
    case Pidgey
    case Ekans
    case Ratatta
    case Pidgeotto
    case Magikarp
    case Pikachu
    case Meowth
    case Psyduck
    case Mankey
    case Abra
    
    static let all: [Pokemon] = [.Bulbasaur, .Charmander, .Squirtle, .Pidgey, .Ekans, .Ratatta, .Pidgeotto, .Magikarp, .Pikachu, .Meowth, .Psyduck, .Mankey, .Abra]
    
    private var info: (type: Type, rarity: Rarity) {
        switch(self) {
            case .Bulbasaur:  return (type: .Grass,    rarity: .Rare)
            case .Charmander: return (type: .Fire,     rarity: .Rare)
            case .Squirtle:   return (type: .Water,    rarity: .Rare)
            case .Pidgey:     return (type: .Flying,   rarity: .Common)
            case .Ekans:      return (type: .Flying,   rarity: .Common)
            case .Ratatta:    return (type: .Normal,   rarity: .Common)
            case .Magikarp:   return (type: .Water,    rarity: .Common)
            case .Pidgeotto:  return (type: .Flying,   rarity: .Uncommon)
            case .Pikachu:    return (type: .Electric, rarity: .Uncommon)
            case .Meowth:     return (type: .Normal,   rarity: .Uncommon)
            case .Psyduck:    return (type: .Psychic,  rarity: .Uncommon)
            case .Mankey:     return (type: .Fighting, rarity: .Rare)
            case .Abra:       return (type: .Psychic,  rarity: .Rare)
        }
    }
    
    var type: Type {
        return self.info.type
    }
    
    var rarity: Rarity {
        return self.info.rarity
    }
    
    static func spawn() -> Pokemon {
        let selectedRarity = Rarity.random()
        let candidates = Pokemon.all.filter{ $0.rarity == selectedRarity }
        
        let random = Int(arc4random_uniform(UInt32(candidates.count)))
        return candidates[random]
    }
    
}


//MARK: - Rarity


enum Rarity : String {
    case Common
    case Uncommon
    case Rare
    
    static let all: [Rarity] = [.Common, .Uncommon, .Rare]
    
    var range: CountableClosedRange<Int> {
        switch(self) {
            case .Rare:     return (0...100)
            case .Uncommon: return (101...400)
            case .Common:   return (401...1000)
        }
    }
    
    static func random() -> Rarity {
        let randomInt = Int(arc4random_uniform(1000))
        let selected = Rarity.all.first(where: { $0.range.contains(randomInt) })
        return selected ?? .Common
    }
}


//MARK: - Pokemon Types

enum Type : String {
    case Water
    case Fire
    case Grass
    case Flying
    case Poison
    case Electric
    case Normal
    case Psychic
    case Fighting
}
