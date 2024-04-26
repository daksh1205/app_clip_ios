import SwiftUI
import FirebaseDatabase

struct UserDetailsView: View {
    @State private var companyName = ""
    @State private var name = ""
    @State private var designation = ""
    @State private var phoneNumber = ""
    @State private var email = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var showDetails = false
    @State private var isSuccessAlert = false
    
    
    
    var body: some View {
        NavigationView {
            ZStack() {
                Image("signupbg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center
                       , spacing: 24) {  // Reduced spacing from 24 to 10
                    // Company Name
                    VStack(alignment: .leading, spacing: 5) {  // Additional fine control over spacing
                        Label {
                            Text("Company Name").font(Font.custom("Kanit-Regular", size: 18))
                            Text("*").font(Font.custom("Kanit-Regular", size: 18))
                                .foregroundColor(.red)  // Makes the asterisk red
                        } icon: {
                            EmptyView()
                        }
                        .font(.headline)
                        TextField("Enter Company Name", text: $companyName) // Updated placeholder text
                            .foregroundColor(.black.opacity(0.4)) // Adjusted text opacity and color
                            .font(Font.custom("Kanit", size: 17))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(.top, 150)
                    .padding(.horizontal, 5)
                    
                    // Name
                    VStack(alignment: .leading, spacing: 5) {
                        Label {
                            Text("Name").font(Font.custom("Kanit-Regular", size: 18))
                            Text("*").font(Font.custom("Kanit-Regular", size: 18))
                                .foregroundColor(.red)  // Makes the asterisk red
                        } icon: {
                            EmptyView()
                        }
                        .font(.headline)
                        TextField("Enter Name", text: $name) // Updated placeholder text
                            .foregroundColor(.black.opacity(0.4))
                            .font(Font.custom("Kanit", size: 17))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(.horizontal, 5)
                    
                    // Designation
                    VStack(alignment: .leading, spacing: 5) {
                        Label {
                            Text("Designation").font(Font.custom("Kanit-Regular", size: 18))
                            Text("(Optional)").font(Font.custom("Kanit-Regular", size: 18))
                                .foregroundColor(.gray.opacity(0.4))  // Makes the asterisk red
                        } icon: {
                            EmptyView()
                        }
                        .font(.headline)
                        TextField("Enter Designation", text: $designation) // Updated placeholder text
                            .foregroundColor(.black.opacity(0.4))
                            .font(Font.custom("Kanit", size: 17))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.phonePad)
                    }
                    .padding(.horizontal, 5)
                    
                    // Phone Number
                    VStack(alignment: .leading, spacing: 5) {
                        Label {
                            Text("Phone Number").font(Font.custom("Kanit-Regular", size: 18))
                            Text("*").font(Font.custom("Kanit-Regular", size: 18))
                                .foregroundColor(.red)  // Makes the asterisk red
                        } icon: {
                            EmptyView()
                        }
                        .font(.headline)
                        TextField("Enter Phone Number", text: $phoneNumber) // Updated placeholder text
                            .foregroundColor(.black.opacity(0.4))
                            .font(Font.custom("Kanit", size: 17))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.phonePad)
                    }
                    .padding(.horizontal, 5)
                    
                    // Email
                    VStack(alignment: .leading, spacing: 5) {
                        Label {
                            Text("Email")
                            Text("*").font(Font.custom("Kanit-Regular", size: 18))
                                .foregroundColor(.red)  // Makes the asterisk red
                        } icon: {
                            EmptyView()
                        }
                        .font(.headline)
                        TextField("Enter Email", text: $email) // Updated placeholder text
                            .foregroundColor(.black.opacity(0.4))
                            .font(Font.custom("Kanit", size: 17))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.emailAddress)
                    }
                    .padding(.horizontal, 5)
                    .padding(.bottom, 100)
                    
                    
                    
                    Button("Submit") {
                        // Action for the button
                        if fieldsAreValid {
                            submitDetails()
                        } else {
                            alertMessage = "Please input all required fields"
                            isSuccessAlert = false
                            showingAlert = true
                        }
                    }
                    .font(Font.custom("Kanit-Regular", size: 18))
                    .frame(maxWidth: 210, maxHeight: 10)
                    .padding(.horizontal, 55)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.427, green: 0.455, blue: 0.831), Color(red: 0.694, green: 0.329, blue: 0.757)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                }
                       .padding()
                
                
                
            }
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
DeetsView(name: name, email: email, phoneNumber: phoneNumber, designation: designation, companyName: companyName)        }
    }

    var fieldsAreValid: Bool {
        !name.isEmpty && !email.isEmpty && !phoneNumber.isEmpty
    }

    func submitDetails() {
        let ref = Database.database().reference()
        let userDetails = ["companyName": companyName, "name": name, "email": email, "phone": phoneNumber, "designation": designation]
        
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
    
    
    struct UserDetailsView_Previews: PreviewProvider {
        static var previews: some View {
            UserDetailsView()
        }
    }

