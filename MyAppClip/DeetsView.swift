//
//  DeetsView.swift
//  MyAppClip
//
//  Created by Daksh  on 27/04/24.
//


import SwiftUI

struct DeetsView: View {
    var name: String
    var email: String
    var phoneNumber: String
    var designation: String
    var companyName: String
    
    var body: some View {
        NavigationView {
            List {
                
                Text("Company Name: \(companyName)")
                Text("Name: \(name)")
                Text("Email: \(email)")
                Text("Phone Number: \(phoneNumber)")
                Text("Designation: \(designation)")
            }
            .navigationTitle("Your Details")
        }
    }
}


