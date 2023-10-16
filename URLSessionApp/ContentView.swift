//
//  ContentView.swift
//  URLSessionApp
//
//  Created by Oncu Can on 16.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var dataText: String = ""
    
    var body: some View {
        VStack {
            Text(dataText)
                .padding()
            Button("Fetch Data") {
                            fetchData()
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                    }
                }
    
    func fetchData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No Data")
                return
            }
            
            if let dataString = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    self.dataText = dataString
                }
            }
        } .resume()
    }
}

#Preview {
    ContentView()
}
