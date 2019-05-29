//
//  Pais+CoreDataProperties.swift
//  iOS_CoreData
//
//  Created by Benjamim on 28/05/19.
//  Copyright © 2019 Benjamim. All rights reserved.
//
//

import Foundation
import CoreData


extension Pais {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pais> {
        return NSFetchRequest<Pais>(entityName: "Pais")
    }

    @NSManaged public var nome: String?
    @NSManaged public var populacao: Int16
    @NSManaged public var temCidade: NSSet?

}

// MARK: Generated accessors for temCidade
extension Pais {

    @objc(addTemCidadeObject:)
    @NSManaged public func addToTemCidade(_ value: Cidade)

    @objc(removeTemCidadeObject:)
    @NSManaged public func removeFromTemCidade(_ value: Cidade)

    @objc(addTemCidade:)
    @NSManaged public func addToTemCidade(_ values: NSSet)

    @objc(removeTemCidade:)
    @NSManaged public func removeFromTemCidade(_ values: NSSet)

}
