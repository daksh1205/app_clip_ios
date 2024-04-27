import SwiftUI
import FirebaseDatabase

struct ContentView: View {
    @State private var companyName = ""
    @State private var name = ""
    @State private var designation = ""
    @State private var phoneNumber = ""
    @State private var email = ""
    @State private var showThankYouView = false  // State to manage the display of the Thank You view

    var body: some View {
        NavigationStack {
            ZStack {
                Image("signupbg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    
                
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
                                      TextField("Pathfinder.global", text: $companyName) // Updated placeholder text
                                          .foregroundColor(.black.opacity(0.4)) // Adjusted text opacity and color
                                          .font(Font.custom("Kanit", size: 17))
                                          .textFieldStyle(RoundedBorderTextFieldStyle())
                                  }
                                  .padding(.top, 180)
                                  .padding(.horizontal, 8)
                                  
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
                                      TextField("Ahmed", text: $name) // Updated placeholder text
                                          .foregroundColor(.black.opacity(0.4))
                                          .font(Font.custom("Kanit", size: 17))
                                          .textFieldStyle(RoundedBorderTextFieldStyle())
                                  }
                                  .padding(.horizontal, 8)
                                  
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
                                  .padding(.horizontal, 8)
                                  
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
                                      TextField("+91 75541 42165", text: $phoneNumber) // Updated placeholder text
                                          .foregroundColor(.black.opacity(0.4))
                                          .font(Font.custom("Kanit", size: 17))
                                          .textFieldStyle(RoundedBorderTextFieldStyle())
                                          .keyboardType(.phonePad)
                                  }
                                  .padding(.horizontal, 8)
                                  
                                  
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
                                      TextField("info@\u{200B}pathfinder.\u{200B}global", text: $email)// Updated placeholder text
                                          .foregroundColor(.black.opacity(0.4))
                                          .font(Font.custom("Kanit", size: 17))
                                          .textFieldStyle(RoundedBorderTextFieldStyle())
                                          .keyboardType(.emailAddress)
                                        
                                         
                                          
                                      
                                  }
                                  .padding(.horizontal, 8)
                    
                                  .padding(.bottom, 100)
                    
                       
                    Button("Submit") {
                        submitDetails()
                    }
                    .font(Font.custom("Kanit-Regular", size: 18))
                    .frame(maxWidth: .infinity, maxHeight: 15)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.427, green: 0.455, blue: 0.831), Color(red: 0.694, green: 0.329, blue: 0.757)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.bottom, 50)
                }
                .padding()
            }
           
            .navigationDestination(isPresented: $showThankYouView) {
                ThankYouView()
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }

    var fieldsAreValid: Bool {
        !name.isEmpty && !email.isEmpty && !phoneNumber.isEmpty
    }

    func submitDetails() {
        guard fieldsAreValid else { return }

        let ref = Database.database().reference()
        let userDetails = ["companyName": companyName, "name": name, "email": email, "phone": phoneNumber, "designation": designation]

        ref.child("users").childByAutoId().setValue(userDetails) { error, _ in
            if let error = error {
                print("Data could not be saved: \(error).")
            } else {
                self.showThankYouView = true  // Trigger the Thank You view on success
            }
        }
    }
}



    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

