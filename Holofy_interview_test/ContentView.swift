//
//  ContentView.swift
//  Holofy_interview_test
//
//  Created by Sergiu Corbu on 2/16/21.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    @State var item = VideoM(title: input["title"] ?? ".", subtitle: input["subtitle"] ?? ".", description: input["description"] ?? ".", player: AVPlayer(url: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4")!))
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    VStack(alignment: .leading, spacing: 10){
                        Text("Thursday, February 17")
                            .foregroundColor(.secondary)
                            .font(.footnote)
                            .bold()
                        Text("Holofy interview project")
                            .font(.title)
                            .bold()
                    }
                } //info
                .padding(.top, -120)
                CardView(item: self.$item)}
        }
    }
}

struct CardView: View{
    
    @Binding var item: VideoM //binding the variable to the one already existing in the content view
    @State var maxHeight: CGFloat = UIScreen.main.bounds.height * 0.3
    @State var maxWidth: CGFloat = UIScreen.main.bounds.width - 50 //screen sizes to fit the videoplayer for every dimensions
    
    var body: some View{
        
        VStack(spacing: 0){
            
            NavigationLink( //nav link to fullscreen player
                destination: FullScreen()){
                PlayerView(player: item.player)
                    .cornerRadius(15)
                    .frame(width: maxWidth, height: maxHeight, alignment: .center)
                    .shadow(color: Color.black.opacity(0.7), radius: 15)
                    //.onTapGesture { item.player.pause() }
            
            }
            
            HStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(item.title)
                        .font(.title)
                        .padding(.bottom, 4)
                    Text(item.subtitle)
                        .font(.subheadline)
                        .padding(.bottom,10)
                        .padding(.top, -5)
                        .foregroundColor(.secondary)
                    Text(item.description)
                        .fontWeight(.medium)
                        .lineLimit(4)
                        .font(.footnote)
                }
                Spacer()
            }.padding(.all, 15) //info hstack area
            
        }
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.gray), lineWidth: 1))
        .padding(.all, 30)
        .shadow(color: Color.black.opacity(0.2),radius: 20)
    }
}

struct PlayerView: UIViewControllerRepresentable{
    
    var player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController { //make the controls
        let view = AVPlayerViewController()
        view.player = player
        view.showsPlaybackControls = true
        view.videoGravity = .resizeAspectFill
        player.play()
        return view
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
    }
}

struct FullScreen: View{
    
    var body: some View{
        
        let video = AVPlayer(url: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4")!)
        VideoPlayer(player: video)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 5)
            .onAppear{ video.play() }
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
