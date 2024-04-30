import SwiftUI


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
                
                VStack() {
                    Image("signuplogo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(maxWidth: .infinity, maxHeight: 15)
                                        .padding(.bottom, 680)
                                        .padding(.horizontal, 20)
                }
                    
                
                    
                
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
                                  .padding(.top, 200)
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
                                      TextField("Ahmed", text: $name) // Updated placeholder text
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
                                          .keyboardType(.default)
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
                                      TextField("+91 75541 42165", text: $phoneNumber) // Updated placeholder text
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
                                      TextField("info@\u{200B}pathfinder.\u{200B}global", text: $email)// Updated placeholder text
                                          .foregroundColor(.black.opacity(0.4))
                                          .font(Font.custom("Kanit", size: 17))
                                          .textFieldStyle(RoundedBorderTextFieldStyle())
                                          .keyboardType(.emailAddress)
                                        
                                         
                                          
                                      
                                  }
                                  .padding(.horizontal, 5)
                    
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
                    .padding(.bottom, 100)
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

        // Create the URL and request
        guard let url = URL(string: "https://dummy.restapiexample.com/api/v1/create") else {
            print("Invalid URL")
            return
        }

        // Set up the JSON to send
        let userDetails = ["name": name, "salary": phoneNumber, "age": email] // Mapping your fields to the API's expected keys
        guard let encoded = try? JSONEncoder().encode(userDetails) else {
            print("Failed to encode user details")
            return
        }

        // Create the URLRequest object
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = encoded

        // Perform the request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                print("HTTP Error: \(httpResponse.statusCode)")
                return
            }

            if let data = data {
                // Handling the JSON response
                if let responseString = String(data: data, encoding: .utf8) {
                    print("Response: \(responseString)")
                    DispatchQueue.main.async {
                        self.showThankYouView = true  // Show the Thank You view on successful response
                    }
                }
            }
        }.resume()
    }

}



    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
