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
    
    @State private var newPostTitle: String = ""
    @State private var location: String = ""
    @State private var newPostContents: String = ""
    
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
        VStack {
            TextField("제목", text: $newPostTitle)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.vertical, 10)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color(red: 228/255, green: 228/255, blue: 228/255))
                                 
            HStack {
                Text("현재 위치")
                    .fontWeight(.semibold)
                    .font(.subheadline)
                    .foregroundColor(Color(red: 168/255, green: 168/255, blue: 168/255))
                TextField("미확인", text: $location)
                    .fontWeight(.semibold)
                    .font(.subheadline)
                    .foregroundColor(Color(red: 127/255, green: 143/255, blue: 184/255))
                
                Spacer()
                
                /*Button(action: <#T##() -> Void#>, label: Image(systemName: <#T##String#>))
                 */
                                              
            }
            .padding(.vertical, 10)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color(red: 228/255, green: 228/255, blue: 228/255))
            
            TextField("애완동물 산책에 관한 글을 올려주세요.", text: $newPostContents)
                .font(.subheadline)
                .padding(.vertical, 10)
            
            Spacer()
        }
            .padding(25)
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
