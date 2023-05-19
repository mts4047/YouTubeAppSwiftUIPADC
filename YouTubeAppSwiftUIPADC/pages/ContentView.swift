//
//  ContentView.swift
//  YouTubeAppSwiftUIPADC
//
//  Created by Myo Thandar Soe on 07/04/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack{
                // Background
                Rectangle()
                    .background(.black)
                // Content
                VStack(spacing: 12.0) {
                    // App Bar
                    VideoListAppBarView()
                    
                    // Video List
                    VideoListView()
                }
                
            }.navigationBarHidden(true)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct VideoListAppBarView: View {
    
    @State var isProfileSheetShowing: Bool = false
    @State var isMultiDataPickerSheetShowing: Bool = false
    
    
    var body: some View {
        HStack(spacing: 12.0) {
            // Logo
            Image("yout_tube")
                .resizable()
                .frame(width: 50, height: 50)
            // Spacer
            Spacer()
            
            // Notification
            Image(systemName: "bell")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.white)
            
            // Search
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.white)
                .onTapGesture {
                    isMultiDataPickerSheetShowing.toggle()
                }
            
            // Profile
            Image("profile")
                .resizable()
                .frame(width: 32, height: 32)
                .clipShape(Circle())
                .onTapGesture {
                    isProfileSheetShowing.toggle()
                }
        }
        .padding([.leading, .trailing], 12.0)
        .sheet(isPresented: $isProfileSheetShowing) {
            ProfileBottomSheetView()
        }
        .sheet(isPresented: $isMultiDataPickerSheetShowing) {
            DatePickerBottomSheetView()
        }
    }
}

struct VideoListView: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(1...10, id: \.self) { id in
                    NavigationLink(value: id) {
                        VideoItemView()
                    }
                    .navigationDestination(for: Int.self) { id in
                        VideoDetailsView()
                    }
//                    NavigationLink(destination: VideoDetailsView()) {
//                      VideoItemView() }
                    
                }
            }
        }
    }
}

struct ProfileBottomSheetView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12.0) {
            Image("profile")
                .resizable()
                .frame(width: 54, height: 54)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 8.0) {
                Text("Mr.Smith")
                    .fontWeight(.bold)
                    .font(.system(size: 20.0))
                
                Text("Swift Guru. Please subscribe for more SwiftUI content.")
                    .fontWeight(.bold)
                    .font(.system(size: 14.0))
                    .italic()
                
                Text(SAMPLE_VIDEO_DESCRIPTION)
                    .font(.system(size: 14.0))
                
            }
        }
        .padding([.leading, .trailing, .top, .bottom], 8.0)
        .presentationDetents([.fraction(0.3), .medium, .large])
    }
}

struct DatePickerBottomSheetView : View {
    
    @State private var dates = Set<DateComponents>()
    
    var body: some View {
        MultiDatePicker("Select your preferred dates", selection: $dates, in: Date.now...)
            .presentationDetents([.medium, .large])
    }
}
