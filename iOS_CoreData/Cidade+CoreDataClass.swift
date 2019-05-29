//
//  Cidade+CoreDataClass.swift
//  iOS_CoreData
//
//  Created by Benjamim on 28/05/19.
//  Copyright © 2019 Benjamim. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Cidade)
public class Cidade: NSManagedObject {
    
    //Get all
    static func getAll(appDel: AppDelegate)-> [Cidade]? {
        let dataFetchRequest = NSFetchRequest<Cidade>(entityName: "Cidade")
        var results : [Cidade]
        
        do {
            results = try appDel.persistentContainer.viewContext.fetch(dataFetchRequest)
            return results
        } catch {
            
        }
        return nil
    }
    
    //Get by nome
    static func getByNome(nome:String, appDel: AppDelegate) -> Cidade? {
        let dataFetchRequest = NSFetchRequest<Cidade>(entityName: "Cidade")
        let predicate = NSPredicate(format: "nome == %@", nome)
        dataFetchRequest.predicate = predicate
        
        var results : [Cidade]
        
        do {
            results = try appDel.persistentContainer.viewContext.fetch(dataFetchRequest)
            if(results.count>0) {
                return results[0]
            }
        } catch {
            
        }
        return nil
    }
    
    // ADD
    static func insert(nome: String, nomePais: String, populacao:Int16, appDel: AppDelegate) {
        let context = appDel.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Cidade", in: context)
        let transc = NSManagedObject(entity: entity!, insertInto: context)
        
        transc.setValue(nome, forKey: "nome")
        transc.setValue(populacao, forKey: "populacao")
        let p:Pais = Pais.getByNome(nome: nomePais, appDel: appDel)!
        transc.setValue(p, forKey: "temPais")
        
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save")
        } catch {
            
        }
    }

}
