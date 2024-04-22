//
//  DetailsView.swift
//  MyAppClip
//
//  Created by Daksh  on 23/04/24.
//

import SwiftUI

struct DetailsView: View {
    var name: String
    var email: String
    var phoneNumber: String
    var occupation: String
    
    var body: some View {
        NavigationView {
            List {
                Text("Name: \(name)")
                Text("Email: \(email)")
                Text("Phone Number: \(phoneNumber)")
                Text("Occupation: \(occupation)")
            }
            .navigationTitle("Your Details")
        }
    }
}


