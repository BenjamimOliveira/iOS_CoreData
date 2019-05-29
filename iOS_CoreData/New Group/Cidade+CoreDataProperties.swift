//
//  Cidade+CoreDataProperties.swift
//  iOS_CoreData
//
//  Created by Benjamim on 28/05/19.
//  Copyright © 2019 Benjamim. All rights reserved.
//
//

import Foundation
import CoreData


extension Cidade {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cidade> {
        return NSFetchRequest<Cidade>(entityName: "Cidade")
    }

    @NSManaged public var nome: String?
    @NSManaged public var populacao: Int16
    @NSManaged public var temPais: Pais?

}
