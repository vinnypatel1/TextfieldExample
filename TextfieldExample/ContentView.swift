//
//  ContentView.swift
//  TextfieldExample
//
//  Created by Vin on 12/09/2020.
//  Copyright © 2020 Vin. All rights reserved.
//

import SwiftUI



class TextFieldViewData: ObservableObject {
    @Published var titleInput: String = ""
    @Published var contactDetails: String = ""
    @Published var firstNameInput: String = ""
    @Published var surnameInput: String = ""
    @Published var contactPhoneInput: String = ""
    @Published var colorTitle: Color = Color.white
    @Published var colorFirstName: Color = Color.white
    @Published var colorSurname: Color = Color.white
    @Published var colorContactPhone: Color = Color.white
    
    init (defaultData: AppData) {
        if defaultData.details != ""
        {
            contactDetails = defaultData.details
            titleInput =  defaultData.title
            firstNameInput = defaultData.firstName
            surnameInput = defaultData.surname
            contactPhoneInput = defaultData.phone
            
        }
    }
    


}


struct ContentView: View {
    @ObservedObject var appData: AppData
    @ObservedObject var textFieldData = TextFieldViewData(defaultData: AppData())
  

    var colors = [Color.white, Color(red: 0.7, green: 0.7, blue: 0.7)]

    var body: some View {
        
        VStack (spacing: 15) {
                Text(appData.details)
                    .lineLimit(1)
                    .padding()
                    .background(Color.blue)
            TextField(appData.title, text: $textFieldData.titleInput, onEditingChanged: {self.textFieldData.colorTitle = $0 ? self.colors[1] : self.colors[0]})
                    .padding(4)
                    .background(textFieldData.colorTitle)
                TextField(appData.firstName, text: $textFieldData.firstNameInput, onEditingChanged: {self.textFieldData.colorFirstName = $0 ? self.colors[1] : self.colors[0]})
                    .padding(4)
                    .background(textFieldData.colorFirstName)
                TextField(appData.surname, text: $textFieldData.surnameInput, onEditingChanged:      {self.textFieldData.colorSurname = $0 ? self.colors[1] : self.colors[0]})
                    .padding(4)
                    .background(textFieldData.colorSurname)
                TextField(appData.phone, text: $textFieldData.contactPhoneInput, onEditingChanged: {self.textFieldData.colorContactPhone = $0 ? self.colors[1] : self.colors[0]})
                    .keyboardType(.decimalPad)
                    .padding(4)
                    .background(textFieldData.colorContactPhone)
            
            HStack {
                Spacer()
                Button("Save") {
                    self.textFieldData.contactDetails =  self.textFieldData.titleInput + " " + self.textFieldData.firstNameInput + " " + self.textFieldData.surnameInput + ":" + self.textFieldData.contactPhoneInput

                    self.textFieldData.colorFirstName = self.colors[0]
                    self.textFieldData.colorSurname = self.colors[0]
                    self.textFieldData.colorContactPhone = self.colors[0]
                    self.appData.details = self.textFieldData.contactDetails
                    self.appData.title = self.textFieldData.titleInput
                    self.appData.firstName = self.textFieldData.firstNameInput
                    self.appData.surname = self.textFieldData.surnameInput
                    self.appData.phone = self.textFieldData.contactPhoneInput
                }
            }
            if self.textFieldData.contactDetails != "" {
                QRCodeView (url: self.textFieldData.contactDetails)
            }
            Spacer()
        }.padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(appData: AppData())
    }
}
