//
//  KAKAOView.swift
//  LearningApp
//
//  Created by 디해 on 2023/01/23.
//

import SwiftUI

struct ShopData: Identifiable {
    let id = UUID()
    
    var imageSource: String
    var shopName: String
    var shopLocation: String
    var distance: Int
    var tag: String
}

struct categoryModifier: ViewModifier {
    func body(content: Content) -> some View {
        
        content
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .foregroundColor(.black)
            .background(.white)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 2))
    }
}

extension View {
    func categoryTag() -> some View {
        modifier(categoryModifier())
    }
}

struct KAKAOView: View {
    @State private var shops: [ShopData] = [
        .init(
            imageSource: "dogImg",
            shopName: "미르동물병원",
            shopLocation: "서울특별시 성동구 행당동 23번지",
            distance: 140,
            tag: "#동물병원"
        )
    ]
    
    var body: some View {
        VStack {
            KakaoMapView()
                .frame(
                    maxWidth: .infinity,
                    maxHeight: 400
                )
            categoryStack
            shopStack
            }
        }
        
    @ViewBuilder
    var categoryStack: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Button("#동물병원") {
                }.categoryTag()
                Button("#애견용품샵") {
                }.categoryTag()
                Button("#미용실"){
                }.categoryTag()
                Button("#공원"){
                }.categoryTag()
                Button("#애견동반"){
                }.categoryTag()
                
            }
            .frame(minHeight: 30)
            .padding()
        }
    }
    
    @ViewBuilder
    var shopStack: some View {
        ScrollView(.vertical,
                   showsIndicators: false) {
            VStack {
                ForEach(shops) {
                    shop in
                    ShopView(
                        id: shop.id,
                        imageSource: shop.imageSource,
                        shopName: shop.shopName,
                        shopLocation: shop.shopLocation,
                        distance: shop.distance,
                        tag: shop.tag
                    )
                }
            }
        }
    }
}

struct ShopView: View {
    let id: UUID
    var imageSource: String
    var shopName: String
    var shopLocation: String
    var distance: Int
    var tag: String
    
    var body: some View {
        HStack {
            Image(imageSource)
                .resizable()
                .scaledToFill()
                .frame(width: 111, height: 127)
                .cornerRadius(8)
            shopInfo
            Spacer()
        }.padding(.horizontal, 20)
    }
    
    @ViewBuilder
    var shopInfo: some View {
        VStack(alignment: .leading) {
            Text(shopName)
                .fontWeight(.semibold)
                .font(.body)
            
            Spacer().frame(height: 3)
            
            Text(shopLocation)
                .fontWeight(.semibold)
                .font(.footnote)
                .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
            
            Spacer().frame(height: 3)
            
            Text(String(distance) + "m")
                .fontWeight(.semibold)
                .font(.footnote)
                .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
            
            Spacer()
            Text(tag)
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .font(.footnote)
                .foregroundColor(.black)
                .background(.white)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 2))
        }.padding(10)
    }
    
}

struct KakaoMapView: UIViewRepresentable {
    func updateUIView(_ uiView: MTMapView, context: Context) {}
    
    
    func makeUIView(context: Context) -> MTMapView {
        let view = MTMapView()
        view.currentLocationTrackingMode = .onWithoutHeading
        view.showCurrentLocationMarker = true
        
        return view
    }
}

struct KAKAOView_Previews: PreviewProvider {
    static var previews: some View {
        KAKAOView()
    }
}
