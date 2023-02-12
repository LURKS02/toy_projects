//
//  ListView.swift
//  LearningApp
//
//  Created by 디해 on 2023/01/18.
//

import SwiftUI

struct BoardData: Identifiable {
    
    var id = UUID()
    var image: String
    var title: String
    var location: String
    
    var name: String
    var age: Int
    var des: Int
    var gender: Bool
    
    var reply: Int
}

struct BoardView: View {
    
    @State private var boards: [BoardData] = [
        .init(
            image: "dogImg",
            title: "저랑 산책하실 분!",
            location: "성동구 행당동",
            name: "초코",
            age: 4,
            des: 110,
            gender: true,
            reply: 2
        ),
        .init(
            image: "dogImg",
            title: "밤산책",
            location: "성동구 홍익동",
            name: "두부",
            age: 1,
            des: 500,
            gender: false,
            reply: 0
        )
    ]
    
    
    var body: some View {
        
        ZStack (alignment: .bottomTrailing){
            ScrollView(.vertical,
                       showsIndicators: false) {
                VStack {
                    ForEach(boards) {
                        board in
                        BoardPost(
                            id: board.id,
                            image: board.image,
                            title: board.title,
                            location: board.location,
                            name: board.name,
                            age: board.age,
                            des: board.des,
                            gender: board.gender,
                            reply: board.reply
                        )
                    }
                }
            }
            LinkCircle
        }
    }
    
    @ViewBuilder
    var LinkCircle: some View {
        NavigationLink(destination: NewPostView(), label: {
            ZStack {
                Ellipse()
                    .fill(Color.white)
                    .frame(width: 64, height: 64)
                    .shadow(radius: 4)
                
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .foregroundColor(Color(red: 0.50, green: 0.50, blue: 0.50, opacity: 0.50))
            }.padding()})
    }
}

struct BoardPost: View {
    let id: UUID
    var image: String
    var title: String
    var location: String
    
    var name: String
    var age: Int
    var des: Int
    var gender: Bool
    
    var reply: Int
    
    @ViewBuilder
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .fontWeight(.semibold)
                        .font(.subheadline)
                    
                    Spacer().frame(height: 2)
                    
                    Text(location)
                        .fontWeight(.semibold)
                        .font(.caption2)
                        .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.67))
                }
                Spacer()
            }
            Spacer()
            profile
            Rectangle()
                .foregroundColor(Color(red: 0.94, green: 0.94, blue: 0.94))
                .frame(height: 1)
        }
        .frame(minHeight: 100)
        
        .padding(.vertical, 5)
        .padding(.horizontal, 20)
    }
    
    
    @ViewBuilder
    var profile: some View {
        HStack(alignment: .center) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width:27, height:27)
                .clipShape(Circle())
            
            Text(name)
                .fontWeight(.semibold)
                .font(.subheadline)
            
            Text(String(age) + "살")
                .fontWeight(.semibold)
                .font(.caption2)
            
            Image(systemName: (gender ? "male" : "female"))
            
            Spacer()
            
            Image(systemName: "bubble.right")
                .foregroundColor(.gray)
            
            Text(String(reply))
        }
    }
    
    
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
