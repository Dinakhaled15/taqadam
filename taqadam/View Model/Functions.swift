//
//  Functions.swift
//  taqadam
//
//  Created by Alaa Alabdullah on 17/03/2023.
//

//import SwiftUI
//import Alamofire
//
//
//class Functions {
//    @State static var JobTitle = ""
//    @State static var CompanyName = ""
//    @State static var Country = ""
//    static let encoder = JSONEncoder()
//    static let decoder = JSONDecoder()
//    
//    let headers: HTTPHeaders = [
//        "Content-Type": "application/json",
//        "customer-id":"4236465023",
//        "x-api-key": "zqt__INTfwOKqCNm1oNcq3JXbjDXA1GJgRNBOYVseg"
//    ]
//   
//
//   
//    static func getData()  {
//        let urlString = "https://experimental.willow.vectara.io/v1/completions"
//        
//        guard let url = URL(string: urlString) else { return }
//        var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            request.setValue("4236465023", forHTTPHeaderField: "customer-id")
//            request.setValue("zqt__INTfwOKqCNm1oNcq3JXbjDXA1GJgRNBOYVseg", forHTTPHeaderField: "x-api-key")
//        let prompt = "What kind of skills a \(JobTitle) at \(CompanyName) Company in \(Country) that i could do to get this job step by step??"
//        let requestInput = RequestInput(model: "text-davinci-003", prompt: prompt, max_tokens: 256, temperature: 0)
////        do{
////            request.httpBody = try JSONSerialization.data(
////                withJSONObject: requestInput,
////                options: []
////            )
////        } catch(let error) {
////            print(error.localizedDescription)
////        }
//        
//        encoder.outputFormatting = .prettyPrinted
//        let body = try! encoder.encode(requestInput)
//        request.httpBody = body
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            DispatchQueue.main.async {
//                if let data = data {
//                    do {
//                        print(String(data: data, encoding: .utf8))
//                        let response = try decoder.decode(GetInfo.self, from: data)
//                        print(JobTitle)
//                        print(CompanyName)
//                        print(Country)
//                        print(response)
//                        
//                    } catch(let error) {
//                        print(error.localizedDescription)
//                    }
//                    
////                    print("ttttttt")
////                    print(response)
////                    guard let data = data else { return }
//                }
//            }
//          
//        }.resume()
//    }
//}
