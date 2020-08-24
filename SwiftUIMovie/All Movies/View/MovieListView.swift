//
//  MovieListView.swift
//  SwiftUIMovie
//
//  Created by Jeevan-1382 on 18/04/20.
//  Copyright © 2020 Jeevan-1382. All rights reserved.
//
import Foundation
import SwiftUI

/*
 * Movie list view will show list all movies
 */
struct MovieListView: View {
    //Observer
    @ObservedObject var movieListViewModel:MovieListViewModel
    
    let router:ViewRouter
 
    let chunkedDishes = ["a", "b", "c", "d", "e", "f", "e", "f", "e", "f"].chunked(into: 3)
    
    var body: some View {
        VStack {
            HStack { //Todo Search Widget ...
                Text("FILMdb").font(.title).bold()
                Spacer()
                Button(action: {
                    //do search action
                }) {
                    Text("SEARCH")
                }
            }.padding()
            ScrollView(.vertical, showsIndicators: false) {
                
                //MARK: Section 1
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Coming Soon").font(.title).bold()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                            
                                ForEach($movieListViewModel.upcoming.wrappedValue, id:\.id) { result in
                                    self.movieItemWider(result)
                                }

                            }
                        }
                    }.padding([.leading], 20)
          
     
                ActivityIndicator(shouldAnimate: $movieListViewModel.isLoading)
                
                //MARK: Section 2
                VStack(alignment: .leading, spacing: 10) {
                    Text("Movies").font(.title).bold()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(spacing: 30.0) {
                            
                            Text("All").bold()
                            Text("Comedy").opacity(0.4)
                            Text("Drama").opacity(0.4)
                            Text("Action").opacity(0.4)
                            Text("Fiction").opacity(0.4)
                            Text("SiFi").opacity(0.4)
                            
                        }
                    }
                    
                    ScrollView {
                        
                        ForEach(0..<chunkedDishes.count) { index in
                            HStack(alignment: .center, spacing: 15) {
                                ForEach(0..<self.chunkedDishes[index].count) { dish in
                                    
                                    self.movieItemShort()
                                }
                            }
                            
                        }
                        
                    }
                    
                    
                }.padding()
                
            }
        }
            
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.white)
        .padding(0)
        
        
    }
    
    let screenWidth = UIScreen.main.bounds.width
    
    //SHORT
    func movieItemShort() -> some View {
        let widthFraction = screenWidth/3.5
        return VStack(alignment: .leading) {
            
            Image("sample").renderingMode(.original).resizable().aspectRatio(contentMode: ContentMode.fill)
                .frame(width: widthFraction, height:widthFraction*1.5)
                .cornerRadius(12.5)
            
            
            VStack(alignment: .leading) {
                Text("The Movie").foregroundColor(.black).font(.headline).bold()
                Text("drama, fiction").foregroundColor(Color.black.opacity(0.7))
                    .font(.subheadline)
            }
            
        }
        
        
    }
    
    //WIDER https://image.tmdb.org/t/p/w500/2KYGa23KJ5laLCtj6TwXwexDCKo.jpg
    func movieItemWider(_ movieResult:Results) -> some View {
        
        let fullPosterURL = URL.init(string: "https://image.tmdb.org/t/p/w500\(movieResult.poster_path ?? "")")!
        return Group {
            ZStack(alignment: .bottomLeading) {
 
                WebImage.init(imageURL:fullPosterURL)

                  //Dark shade inside box and below movie title
                  Rectangle()
                      .foregroundColor(.clear)
                      .background(LinearGradient(gradient: Gradient(colors: [.clear, .clear, .black]), startPoint: .top, endPoint: .bottom))

                  VStack(alignment: .leading) {
                      Text(movieResult.release_date ?? "").foregroundColor(Color.white.opacity(0.7)).font(.subheadline)
                      Text(movieResult.title ?? "").foregroundColor(.white).font(.title)
                  }.padding(30)
                  
              }
//              .frame(maxWidth: 450,
//                     minHeight: 150, maxHeight: 250) //keping 4:2.5 aspect ratio
                  .cornerRadius(25.0)
                  .padding(10)
        }

        
    }
    
}
 

struct WebImage: View {

    @ObservedObject private var imageLoader: DataLoader

    public init(imageURL: URL?) {
        imageLoader = DataLoader(resourseURL: imageURL)
    }

    public var body: some View {
        if let uiImage = UIImage(data: self.imageLoader.data) {
            return AnyView(Image(uiImage: uiImage)
                .resizable().aspectRatio(250/375, contentMode: .fit))
        } else {
            return AnyView(Image(systemName: "ellipsis")
                            .onAppear(perform: { self.imageLoader.loadImage() }))
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(movieListViewModel: MovieListViewModel(router: ViewRouter(), networkManager: NetworkManager()), router: ViewRouter())
    }
}

