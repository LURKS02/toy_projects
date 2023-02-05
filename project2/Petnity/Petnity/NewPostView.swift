//
//  NewPostView.swift
//  Petnity
//
//  Created by 디해 on 2023/02/05.
//

import SwiftUI


struct NewPostData {
    var newPostTitle: String
    var location: String
    var newPostContents: String
}

struct NewPostView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var backButton : some View {
        Button(
            action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.backward")    // back button 이미지
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.gray)
            }
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationTitle("글 쓰기")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton, trailing: NavigationLink(destination: TabHomeView(selection: 2), label: { Text("완료").foregroundColor(Color(red: 0.78, green: 0.43, blue: 0.45))}))
                
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
