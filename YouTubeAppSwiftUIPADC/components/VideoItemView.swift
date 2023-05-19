//
//  VideoItemView.swift
//  YouTubeAppSwiftUIPADC
//
//  Created by Myo Thandar soe on 07/04/2023.
//

import SwiftUI

struct VideoItemView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12.0) {
            
            // Video Thumbnil
            VideoThumnilView()
            
            // Channel and Video Info
            ChannelAndVideoInfoView()
            
        }.background(Color.black)
            .padding(.bottom, 16.0)
    }
}

struct VideoItemView_Previews: PreviewProvider {
    static var previews: some View {
        VideoItemView()
            .previewLayout(.fixed(width: 500, height: 400))
    }
}

struct VideoThumnilView: View {
    var body: some View {
        Image("swift_ui_thumbnil")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0.0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0.0, idealHeight: 200, maxHeight: 200)
            .clipped()
    }
}

struct ChannelAndVideoInfoView: View {
    var body: some View {
        HStack(spacing: 12.0) {
            Image("swiftui_image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            // Video Title And Information (Channel Name, Views, Date)
            VideoTitleAndInformationView()
            
        }.padding([.leading, .trailing], 12.0)
    }
}

struct VideoTitleAndInformationView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Text("How to show pop overs in SwiftUI")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 16))
            
            // Channel Name Views Date
            HStack {
                Text("Swift UI Guru")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                Text(".")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                Text("5.4K Views")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                Text(".")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                Text("2 hours ago")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                
                
            }
        }
    }
}
