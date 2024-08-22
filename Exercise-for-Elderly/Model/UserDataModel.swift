//
//  UserDataModel.swift
//  Exercise-for-Elderly
//
//  Created by Jasmine Mutia Alifa on 21/08/24.
//

import SwiftData
import Foundation

@Model
class UserDataModel {
    @Attribute(.unique) var id: UUID
    @Attribute var name: String
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}
