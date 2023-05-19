//
//  VideoDetailsView.swift
//  YouTubeAppSwiftUIPADC
//
//  Created by Myo Thandar soe on 07/04/2023.
//

import SwiftUI
import AVKit

let SAMPLE_VIDEO_URL = "https://jsoncompare.org/LearningContainer/SampleFiles/Video/MP4/sample-mp4-file.mp4"

let SAMPLE_VIDEO_DESCRIPTION = "In our SwiftUI in Production blog post, we wrote about our learnings from first using SwiftUI in a product we shipped. This included some workarounds, explanations, and issues we faced. \n\nIn the blog post, we’ll dig deeper into one of those issues and provide a more sophisticated approach to solving it: presenting popovers on iPhone using SwiftUI. \n\nTo summarize the problem: By default, it’s currently not possible to present a standard popover on an iPhone - or rather on any environment that uses a compact width size class, including some Split View configurations on iPad - when using pure SwiftUI. \n\nIn some cases, presenting a popover on iPhone could still be useful, and it could be a better option in your app’s UI than showing a modal screen. That was also the case for our product, as we wanted to have a coherent design across all devices. As such, we did some digging into how to solve presenting popovers in all scenarios while still using SwiftUI."

struct VideoDetailsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Rectangle().background(.black)
            
            VStack(spacing: 12.0) {
                // Video View
                VideoPlayerAndBackButtonView() {
                    dismiss()
                }
                
                
                // Video Title
                VideoTitleView()
                
                // Divider
                DividerView()
                
                // Likes, Views And Date
                LikesViewsAndDateView()
                
                // Divider
                DividerView()
                
                // Description
                DescriptionView()
                
            }
        }.navigationBarHidden(true)
    }
}

struct VideoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailsView()
    }
}

struct VideoPlayerAndBackButtonView: View {
    var onTapBack : () -> Void = {}
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            // Video Player
            VideoPlayer(player: AVPlayer(url: URL(string: SAMPLE_VIDEO_URL)!))
                .frame(height: 300)
            // Back Button
            Button(action: {
                // TODO:- Navigate Back
                onTapBack()
                
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
                    .frame(width: 24, height: 24)
                    .padding(.leading, 24.0)
                    .padding(.top, 48.0)
            }
        }
    }
}

struct DividerView: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.gray)
            .frame(height: 1.0)
            .padding(.top, 16.0)
    }
}

struct LikesViewsOrDateView: View {
    
    var value : String = ""
    var label : String = ""
    
    var body: some View {
        VStack{
            Text(value)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 20.0))
            Text(label)
                .foregroundColor(.white)
                .font(.system(size: 16.0))
        }
    }
}

struct VideoTitleView: View {
    var body: some View {
        Text("Custom Pop Overs Using SwiftUI - Designing Pop Over with arrow using SwiftUI")
            .foregroundColor(.white)
            .fontWeight(.bold)
            .font(.system(size: 24))
    }
}

struct LikesViewsAndDateView: View {
    var body: some View {
        HStack{
            Spacer()
            LikesViewsOrDateView(value: "165", label: "Likes")
            Spacer()
            LikesViewsOrDateView(value: "10,669", label: "Views")
            Spacer()
            LikesViewsOrDateView(value: "2020", label: "Mar 31")
            Spacer()
        }.padding(.top, 16.0)
    }
}

struct DescriptionView: View {
    var body: some View {
        ScrollView(.vertical){
            Text(SAMPLE_VIDEO_DESCRIPTION)
                .foregroundColor(.white)
                .font(.system(size: 14.0))
        }
        .padding([.leading, .trailing], 12.0)
        .padding(.top, 16.0)
    }
}
