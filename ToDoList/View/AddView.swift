//
//  AddView.swift
//  ToDoList
//
//  Created by Divyansh Dwivedi on 30/04/22.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var  presentationMode
    @EnvironmentObject var listviewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type Something Here ........", text: $textFieldText)
                    .padding(.horizontal)
                    .frame( height: 55)
                    .background(Color(hue: 0.621, saturation: 0.048, brightness: 0.916))
                .cornerRadius(10)
            
                Button(action: saveButtonTapped, label: {
                    Text("SAVE").foregroundColor(.white).font(.headline).frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }.padding(16)
        }.navigationTitle("Add An Item 🖋")
            .alert(isPresented: $showAlert, content: getAlert)
    }
    func saveButtonTapped() {
        if textIsValid() {
            listviewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsValid() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = " Your New Todo List Item Must Contain More Than 3 Characters !!! 🥺😰😓"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
