//
//  AppData.swift
//  TextfieldExample
//
//  Created by Vin on 21/09/2020.
//  Copyright © 2020 Vin. All rights reserved.
//

import SwiftUI

class AppData: ObservableObject {

    @Published var details: String = UserDefaults.standard.string(forKey: "details") ?? "" {
        didSet {
            UserDefaults.standard.set(details,forKey: "details")
        }
    }
    @Published var title: String = UserDefaults.standard.string(forKey: "title" ) ?? "" {
        didSet {
            UserDefaults.standard.set(title,forKey: "title")
        }
    }
    var firstName: String = UserDefaults.standard.string(forKey: "firstName") ?? "" {
        didSet {
            UserDefaults.standard.set(firstName,forKey: "firstName")
        }
    }
    var surname: String = UserDefaults.standard.string(forKey: "surname") ?? "" {
        didSet {
            UserDefaults.standard.set(surname,forKey: "surname")
        }
    }
    var phone: String = UserDefaults.standard.string(forKey: "phone") ?? "" {
        didSet {
            UserDefaults.standard.set(phone,forKey: "phone")
        }
    }
    
    init() {
            self.details = UserDefaults.standard.string(forKey: "details") ?? ""
            self.title = UserDefaults.standard.string(forKey: "title") ?? ""
            self.firstName = UserDefaults.standard.string(forKey: "firstName") ?? ""
            self.surname = UserDefaults.standard.string(forKey: "surname") ?? ""
            self.phone = UserDefaults.standard.string(forKey: "phone") ?? ""
        
    }
    
    
}
