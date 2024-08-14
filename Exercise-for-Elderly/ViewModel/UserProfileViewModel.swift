//
//  UserProfileViewModel.swift
//  Exercise-for-Elderly
//
//  Created by Dhau Embun Azzahra on 12/08/24.
//

import Foundation

internal class UserProfileViewModel: ObservableObject {
    var userController: UserController
    @Published var user: User
    
    init(userController: UserController) {
        self.userController = userController
        self.user = userController.user!
    }
}
