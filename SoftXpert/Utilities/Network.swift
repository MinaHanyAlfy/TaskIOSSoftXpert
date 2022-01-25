//
//  Network.swift
//  SoftXpert
//
//  Created by John Doe on 2022-01-25.
//

import Foundation
class NetworkLayer {
    
    static let shared = NetworkLayer()
    
    func getResults<M: Codable>(APICase: API,decodingModel: M.Type, completed: @escaping (Result<M,ErrorMessage> ) -> Void) {
        var request : URLRequest = APICase.request
       
        request.httpMethod = APICase.method.rawValue
        if APICase.body != nil{
           
            let jsonData = try? JSONSerialization.data(withJSONObject: APICase.body, options: [])
            request.httpBody = jsonData
//            request.httpBody = jsonData.
            print(APICase.body)
        }
     // request.httpBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error =  error {
                completed((.failure(.InvalidData)))

            }
            guard let data = data else {
                completed((.failure(.InvalidData)))
                return
            }
            guard let response =  response  as? HTTPURLResponse ,response.statusCode == 200 else{
                completed((.failure(.InvalidResponse)))
                return
            }
            let decoder = JSONDecoder()
            do
            {
                
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let results = try decoder.decode(M.self, from: data)
                
                print(results)
                completed((.success(results)))
                
            }catch {
                print(error)
                completed((.failure(.InvalidData)))
            }
            
        }
        task.resume()
    }
    
    
}
