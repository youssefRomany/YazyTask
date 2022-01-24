//
//  RequestManager.swift
//  Task
//
//  Created by YoussefRomany on 24/01/2022.
//


import Foundation
import Moya

// MARK: - Error
enum TKError: Int, Error {
    case unAuthorized = 401
    case badRequest = 400
    case notHandleStatusCode = 0
}

extension TKError {
    func getErrorMessage() -> String? {
        switch self {
        case .unAuthorized:
            return "Unauthorized"
        case .badRequest:
            return "Bad Requst"
        case .notHandleStatusCode:
            return "Unknown Error"
        }
    }
}

class RequestManager {
    
    class func beginRequest<T: Codable, ProvidertType: TargetType>(withTarget target: ProvidertType,
                                                                   responseModel model: T.Type,
                                                                   andHandler handler: @escaping (Result<T, Error>)->()) {

        let provider = MoyaProvider<ProvidertType>(plugins: [NetworkLoggerPlugin()])
        provider.request(target) { (result) in
            switch result {
            case let .success(response):
                if response.statusCode == 200 {
                    do {
                        let model = try JSONDecoder().decode(T.self, from: response.data)
                        handler(.success(model))
                    }catch let error{
                        handler(.failure(error))
                    }
                }else {
                    if let reason = TKError(rawValue: response.statusCode) {
                        handler(.failure(reason))
                    }else {
                        handler(.failure(TKError.notHandleStatusCode))
                    }
                }
            case let .failure(error):
                handler(.failure(error))
            }
        }
    }
    
}
