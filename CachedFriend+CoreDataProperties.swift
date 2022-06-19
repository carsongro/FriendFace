//
//  CachedFriend+CoreDataProperties.swift
//  FriendFace
//
//  Created by Carson Gross on 6/18/22.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var origin: CachedUser?
    
    var wrappedName: String {
        name ?? "Unknown"
    }
    
    var wrappedId: String {
        id ?? "Unknown"
    }

}

extension CachedFriend : Identifiable {

}
