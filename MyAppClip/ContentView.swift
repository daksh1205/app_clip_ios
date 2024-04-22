//
//  ContentView.swift
//  MyAppClip
//
//  Created by Daksh  on 23/04/24.
//

import SwiftUI
import FirebaseDatabase

struct ContentView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var occupation: String = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var showDetails = false
    @State private var isSuccessAlert = false

    var body: some View {
        NavigationView {
            Form {
                TextField("Name *", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Email *", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Phone Number *", text: $phoneNumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Occupation", text: $occupation)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                HStack {
                    Spacer()
                    Button("Submit") {
                        if fieldsAreValid {
                            submitDetails()
                        } else {
                            alertMessage = "Please input all required fields"
                            isSuccessAlert = false
                            showingAlert = true
                        }
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(fieldsAreValid ? Color.green : Color.red)
                    .cornerRadius(10)
                    Spacer()
                }
               
            }
            .navigationTitle("Enter Your Details")
            .alert(isPresented: $showingAlert) {
                if isSuccessAlert {
                    return Alert(title: Text("Success"), message: Text("Information Submitted Successfully"), dismissButton: .default(Text("View Details")) {
                        showDetails = true
                    })
                } else {
                    return Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            }
        }
        .sheet(isPresented: $showDetails) {
            DetailsView(name: name, email: email, phoneNumber: phoneNumber, occupation: occupation)
        }
    }

    var fieldsAreValid: Bool {
        !name.isEmpty && !email.isEmpty && !phoneNumber.isEmpty
    }

    func submitDetails() {
        let ref = Database.database().reference()
        let userDetails = ["name": name, "email": email, "phone": phoneNumber, "occupation": occupation]
        
        ref.child("users").childByAutoId().setValue(userDetails) { error, _ in
            if let error = error {
                print("Data could not be saved: \(error).")
                alertMessage = "Data could not be saved: \(error.localizedDescription)"
                isSuccessAlert = false
                showingAlert = true
            } else {
                isSuccessAlert = true
                showingAlert = true
            }
        }
    }
}




#Preview {
    ContentView()
}
