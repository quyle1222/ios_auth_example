//
//  RestHelper.swift
//  DemoApp
//
//  Created by TuPT on 19/09/2022.
//

import Foundation

class RestHelper {
    private let session = URLSession.shared
    private let baseURL = "http://10.20.22.173:8088/"
    
    func post(url:String, data:Data?, handle: @escaping (Data?,URLResponse?,Error?)->Void ){
        guard let serviceUrl = URL(string: baseURL + url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = data
        session.dataTask(with: request,completionHandler: handle ).resume()
    }
    
    func get(url:String, handle: @escaping (Data?,URLResponse?,Error?)->Void ){
        guard let serviceUrl = URL(string: baseURL + url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        session.dataTask(with: request,completionHandler: handle ).resume()
    }
}
