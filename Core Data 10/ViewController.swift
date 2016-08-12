//
//  ViewController.swift
//  Core Data 10
//
//  Created by Cal Stephens on 8/12/16.
//  Copyright © 2016 Cal Stephens. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController {

    
    //MARK: - Code Data
    
    var capturedPokemon: [CapturedPokemon] = []
    
    var CDContainer: NSPersistentContainer {
        return (UIApplication.shared.delegate! as! AppDelegate).persistentContainer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.capturedPokemon = (try? CDContainer.viewContext.fetch(CapturedPokemon.fetchRequest())) ?? []
    }
    
    func catchPokemon(name: String?, ofKind kind: Pokemon) {
        let captured = CapturedPokemon(context: CDContainer.viewContext)
        captured.name = name
        captured.kind = kind.rawValue
        
        try? CDContainer.viewContext.save()
        
        self.capturedPokemon.insert(captured, at: 0)
    }
    
    
    //MARK: - Table View Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return capturedPokemon.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemon", for: indexPath)
        
        let pokemon = capturedPokemon[indexPath.item]
        cell.textLabel?.text = pokemon.displayName
        
        return cell
    }
    
    
    //MARK: - Interaction
    
    @IBAction func encounterPokemon(_ sender: AnyObject) {
        let pokemon = Pokemon.spawn()
        self.catchPokemon(name: nil, ofKind: pokemon)
        
        self.tableView.insertRows(at: [IndexPath(item: 0, section: 0)], with: .top)
    }
    
    @IBAction func deletePokemon(_ sender: AnyObject) {
        capturedPokemon.forEach(CDContainer.viewContext.delete)
        try? CDContainer.viewContext.save()
        
        capturedPokemon = []
        self.tableView.reloadSections([0], with: .bottom)
    }
}

