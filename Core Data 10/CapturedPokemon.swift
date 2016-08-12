//
//  CapturedPokemon.swift
//  Core Data 10
//
//  Created by Cal Stephens on 8/12/16.
//  Copyright © 2016 Cal Stephens. All rights reserved.
//



//CapturedPokemon class declaration auto-generated and maintained by CoreData

extension CapturedPokemon {
    
    var displayName: String {
        guard let kind = self.kind else { return "Unknown Pokemon" }
        
        if let name = self.name {
            return "\(name) (\(kind))"
        } else {
            return kind
        }
    }
    
}
