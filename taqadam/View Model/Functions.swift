//
//  Functions.swift
//  taqadam
//
//  Created by Alaa Alabdullah on 17/03/2023.
//

import SwiftUI
import Alamofire

class functions: ObservableObject{
    var id = UUID()
    @State var JobTitle = "software engineer"
    @State var CompanyName = "aramco"
    @State var Country = "Saudi Arabia"
    @Published var myVslue: GetInfo?
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    @Published var array: [String]?
    
    let headers: HTTPHeaders = [
        "Content-Type": "application/json",
        "customer-id":"4236465023",
        "x-api-key": "zqt__INTfwOKqCNm1oNcq3JXbjDXA1GJgRNBOYVseg"
    ]
    func getData()  {
        let urlString = "https://experimental.willow.vectara.io/v1/completions"
        
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("4236465023", forHTTPHeaderField: "customer-id")
        request.setValue("zqt__INTfwOKqCNm1oNcq3JXbjDXA1GJgRNBOYVseg", forHTTPHeaderField: "x-api-key")
                let prompt = "What kind of skills a \(JobTitle) at \(CompanyName) Company in \(Country) that i could do to get this job step by step??"
//        let prompt = "what is the capital city of saudi arabia?"
        let requestInput = RequestInput(model: "text-davinci-003", prompt: prompt, max_tokens: 256, temperature: 0)
        
        encoder.outputFormatting = .prettyPrinted
        let body = try! encoder.encode(requestInput)
        request.httpBody = body
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
//                        print(String(data: data, encoding: .utf8))
                        let response = try self.decoder.decode(GetInfo.self, from: data)
                        
                        self.myVslue = response
                        
                        if(self.myVslue?.choices[0].text != nil){
                            self.array = self.myVslue?.choices[0].text.components(separatedBy: "\n\n")
                        }
                        
//                        print(self.JobTitle)
//                        print(self.CompanyName)
//                        print(self.Country)
//                        print(response)
                        
                    } catch(let error) {
                        print(error.localizedDescription)
                    }
                }
            }
            
        }.resume()
    }
}
