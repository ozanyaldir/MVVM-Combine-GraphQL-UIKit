//
//  SEAPIService.swift
//  home-task-ios
//
//  Created by Ozan Yaldır on 12.02.2022.
//

import Foundation

enum SEAPICallError: Error{
    case failureResponse(statusCode: Int, message: String)
    case responseMapping(message: String = SEAPIConstants.Messages.responseMappingFailure)
    case unknown(message: String = SEAPIConstants.Messages.unknownError)
}

// MARK: Apollo iOS Client would be used here. Kept the original method.
struct SEAPIService{
    
    let session: URLSession?
    let request: URLRequest?
    
    init(){
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: nil)
        self.session = session

        var request = URLRequest(url: SEAPIConstants.baseURL)
        request.httpMethod = SEAPIConstants.httpMethod
        request.allHTTPHeaderFields = SEAPIConstants.defaultHeaders
        self.request = request
    }
    
    func executeQuery<T: Decodable>(query: BaseQuery, _ completion: @escaping(Result<T, SEAPICallError>) -> Void){
        do {
            let encoder = JSONEncoder()
            let httpBody = try encoder.encode(query)
            
            guard var request = self.request else{
                return
            }
            request.httpBody = httpBody
            
            self.session?.dataTask(with: request) { (data, httpUrlResponse, error) in
                guard let data = data else {
                    return completion(.failure(.responseMapping(message: "Getting Response Failed")))
                }
                do {
                    let responseDTO = try JSONDecoder().decode(BaseResponseDTO<T>.self, from: data)
                    guard let data = responseDTO.data else{
                        return completion(.failure(.responseMapping(message: "Mapping Response Failed")))
                    }
                    return completion(.success(data))
                    
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                    return completion(.failure(.unknown(message: error.localizedDescription)))
                }
            }.resume()
            
        } catch let error as NSError {
            print("Failed to encode query: \(error.localizedDescription)")
            return completion(.failure(.unknown(message: error.localizedDescription)))
        }
    }
}
