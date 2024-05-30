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
    @Published private var cartProductsEntity: [CartProductSourceEntity] = []
    @Published var cartProducts: [CartProductSource] = []
    init () {
        container = NSPersistentContainer(name: "CartProductContainer")
        container.loadPersistentStores { _ , error in
            if let error = error {
                print("error loading core data. \(error.localizedDescription)")
            }
        }
        fetchCartProducts()
    }
    
    func fetchCartProducts() {
        let request = NSFetchRequest<CartProductSourceEntity>(entityName: "CartProductSourceEntity")
        do {
            cartProductsEntity = try container.viewContext.fetch(request)
            self.cartProducts = cartProductsEntity.map {
                CartProductSource(
                    productID: $0.productID ?? "555",
                    size: $0.size ?? "m",
                    color: $0.color ?? "",
                    selectedCount: Int($0.selectedCount)
                )
            }
//            print("core data manager \(self.cartProducts) end get data ")
        } catch {
            print("error fetching. \(error.localizedDescription)")
        }
        
    }
    
    func addCartProduct(cartProduct: CartProductSource) {
        if let savedProduct = getSavedCartProduct(cartProduct: cartProduct) {
            savedProduct.selectedCount = Int32(cartProduct.selectedCount)
        } else {
            let newProduct = CartProductSourceEntity(context: container.viewContext)
            newProduct.productID = cartProduct.productID
            newProduct.size = cartProduct.size
            newProduct.color = cartProduct.color
            newProduct.selectedCount = Int32(cartProduct.selectedCount)
        }
        saveData()
    }
    
    func deleteCartProduct(index: Int) {
        let cartProduct = cartProductsEntity[index]
        container.viewContext.delete(cartProduct)
        saveData()
    }
    
    func updateCartProduct(for product: CartProductSource ,with count: Int) {
        guard let savedProduct = getSavedCartProduct(cartProduct: product)
        else {return}
        savedProduct.selectedCount = Int32(count)
        saveData()
        
    }
    
    func getSavedCartProduct(cartProduct: CartProductSource) -> CartProductSourceEntity? {
        if let index = cartProductsEntity
            .firstIndex(where: {
                $0.productID == cartProduct.productID && $0.color == cartProduct.color && $0.size == cartProduct.size
            }) {
            return cartProductsEntity[index]
        }
        return nil
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchCartProducts()
        } catch {
            print(error.localizedDescription)
        }
    }
}
