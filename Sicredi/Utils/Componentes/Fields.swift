//
//  Fields.swift
//  ListaMercado
//
//  Created by Renato Ferraz on 05/03/21.
//

import SwiftUI
import FloatingLabelTextFieldSwiftUI

struct Fields: View {
    
    @Binding var field: String
    var placeHolder: String
    var textFieldValidator : TextFieldValidator
    var keyboardType : UIKeyboardType
    var capitalization : UITextAutocapitalizationType
    
    init(field: Binding<String>,
         placeHolder: String,
         fieldValidor: TextFieldValidator,
         keyboardType : UIKeyboardType = .default,
         capitalization: UITextAutocapitalizationType = .none,
         phone : Bool = false) {
        
        self._field = field
        self.placeHolder = placeHolder
        self.textFieldValidator = fieldValidor
        self.keyboardType = keyboardType
        self.capitalization = capitalization
    }
    
    var body: some View{
        
        FloatingLabelTextField($field, placeholder: placeHolder, editingChanged: { (isChanged) in
        })
        .addValidation(textFieldValidator) /// Sets the validation condition.
        .isShowError(true) /// Sets the is show error message.
        .errorColor(Color(.red)) /// Sets the error color.
        .titleColor(Color(.black))
        .selectedLineColor(.white)
        .selectedTextColor(.black)
        .selectedTitleColor(Color("back"))
        .placeholderColor(.white)
        .lineColor(Color("back"))
        .textColor(.black)
        .lineHeight(1).selectedLineHeight(1.5)
        .placeholderFont(.system(size: 15))
        .spaceBetweenTitleText(15)
        .font(.system(size: 15))
        .keyboardType(keyboardType)
        .autocapitalization(capitalization)
        .frame(height: 50)
//        .padding(.bottom, 5)
        .padding(.horizontal,10)
        
    }
    
}
