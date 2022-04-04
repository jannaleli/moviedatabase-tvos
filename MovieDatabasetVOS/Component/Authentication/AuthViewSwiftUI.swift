//
//  AuthViewSwiftUI.swift
//  MovieDatabasetVOS
//
//  Created by Jann Zaplan on 2022-03-24.
//

import SwiftUI

struct AuthViewSwiftUI: View {
    var body: some View {
        let epicoStop1 = UIColor(hue: 209/360, saturation: 100/100, brightness: 50/100, alpha: 1.0)
        let epicoStop2 = UIColor(hue: 221/360, saturation: 100/100, brightness: 38/100, alpha: 1.0)
        let activationEn = "Activation"
        let activationFr = "Activation"
        let activationQuestionEn = "Are you signed in on your Epic Box?"
        let activationQuestionFr = "Êtes-vous connectés à votre boîte EPICO ?"
        let textEn = "Before continuing on this new device, you must be signed in on your EPICO Box"
        let textFr = "Vous devez avoir complété votre connexion initiale à votre boîte EPICO avant d’utiliser ce service sur cet appareil."
        let questionEn = "If you did, you can continue with activation"
        let QuestionFr = "Si c’est le cas, vous pouvez poursuivre votre activation."
        ZStack {
            LinearGradient(gradient: Gradient(colors:[Color(epicoStop1), Color(epicoStop2) ]) , startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all, edges: .all)
            VStack (alignment: .leading,
                    spacing: 50
                    )  {
                Text(activationEn)
                    .font(.largeTitle)
                Spacer()
                Spacer()
                Text(activationQuestionEn)
                    .font(.largeTitle)
                Text(textEn)
                    .font(.system(size: 50))
                    .padding(.trailing,500)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)


                Text(questionEn)
                    .font(.largeTitle)
                Button(action: {
                          print("Right button is pressed")
                      }) {
                          Text("Continue")
                         
                       
                      }
                Spacer()
                Button(action: {
                          print("Right button is pressed")
                      }) {
                          Text("Francais")
                          
                      }
            }.padding(.leading, 50)
             

        }
    }
}

struct AuthViewSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        AuthViewSwiftUI()
    }
}
