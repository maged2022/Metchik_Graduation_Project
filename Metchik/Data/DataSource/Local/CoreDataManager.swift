//
//  CoreDataManager.swift
//  Metchik
//
//  Created by Hassan on 28/02/2024.
//

import Foundation
import CoreData

class CoreDataManager: ObservableObject {
    let container:NSPersistentContainer
    @Published var cartProducts: [CartProductSourceEntity] = []
    init () {
        container = NSPersistentContainer(name: "CartProductContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("error loading core data. \(error.localizedDescription)")
            }
        }
        fetchCartProducts()
    }
    
    func fetchCartProducts() {
        let request = NSFetchRequest<CartProductSourceEntity>(entityName: "CartProductSourceEntity")
        do {
            cartProducts = try         container.viewContext.fetch(request)
print(cartProducts)
        } catch {
            print("error fetching. \(error.localizedDescription)")
        }
        
    }
    
    func addCartProduct(cartProduct: CartProductSourceEntity) {
        var newProduct = CartProductSourceEntity(context: container.viewContext)
        newProduct = cartProduct
        saveData()
    }
    
    func deleteCartProduct(cartProduct: CartProductSourceEntity) {
        var entity = CartProductSourceEntity()
        entity = cartProduct
        container.viewContext.delete(entity)
        
    }
    
//    func updateCartProduct(entity: CartProductSource){
//        let currentName = entity.name ?? ""
//        let newName = currentName + "?"
//        entity.name = newName
//        saveData()
//    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchCartProducts()
        } catch {
            print(error.localizedDescription)
        }
    }
}
