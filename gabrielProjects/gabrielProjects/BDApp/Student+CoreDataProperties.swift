//
//  Student+CoreDataProperties.swift
//  BDApp
//
//  Created by Administrador on 2/11/16.
//  Copyright © 2016 Tecnologico de Costa Rica. All rights reserved.
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student");
    }

    @NSManaged public var age: Int16
    @NSManaged public var career: String?
    @NSManaged public var name: String?

}
