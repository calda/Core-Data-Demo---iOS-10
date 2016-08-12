# Core Data in iOS10

`CoreData` is super simple with Xcode 8 and iOS 10.

###Auto-Generated Models
Configure your models in the `.xcdatamodeld` file.

Code Data generates this class in your project's `DerivedData` folder:
```swift
@objc(CapturedPokemon)
public class CapturedPokemon: NSManagedObject { //CapturedPokemon+CoreDataClass.swift

}

extension CapturedPokemon { //CapturedPokemon+CoreDataProperties.swift

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CapturedPokemon> {
        return NSFetchRequest<CapturedPokemon>(entityName: "CapturedPokemon");
    }

    @NSManaged public var kind: String?
    @NSManaged public var name: String?

}
```
To update this auto-generated model, do a `Clean` and `Build`.

###Accessing the Core Data container
```swift
var CDContainer: NSPersistentContainer {
    return (UIApplication.shared.delegate! as! AppDelegate).persistentContainer
}
```

###Creating a new object
```swift
func catchPokemon(name: String?, ofKind kind: Pokemon) {
    let captured = CapturedPokemon(context: CDContainer.viewContext)
    captured.name = name
    captured.kind = kind.rawValue
    try? CDContainer.viewContext.save()
}
```

###Fetching objects
```swift
var capturedPokemon: [CapturedPokemon] = []
self.capturedPokemon = (try? CDContainer.viewContext.fetch(CapturedPokemon.fetchRequest())) ?? []
```

