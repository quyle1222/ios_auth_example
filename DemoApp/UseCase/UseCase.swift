//
//  UseCase.swift
//  DemoApp
//
//  Created by TuPT on 19/09/2022.
//

import Foundation
class UseCase {
    static let instance =  UseCase()
    private var user: User = User(username: "", password: "")
    private var token:String?
    
    func updateAccount(text:String){
        self.user.username = text
    }
    
    func updatePassword(text:String){
        self.user.password = text
    }
    
    func login(success: @escaping(Bool)->Void){
        guard let json = try? JSONEncoder().encode(user) else {return success(false)}
        RestHelper().post(url: "auth/login", data: json)
        {data, response, error in
            if let data = data {
                do {
                    let json = try JSONDecoder().decode(AuthResponse.self, from: data)
                    success(json.success)
                    guard let token = json.data?.token else {return success(false)}
                    self.token = token
                }catch {
                    success(false)
                }
            }
        }
    }
}
