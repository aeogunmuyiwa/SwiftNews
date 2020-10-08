//
//  ApiRequestManager.swift
//  SwiftNews
//
//  Created by Adebayo  Ogunmuyiwa on 2020-10-05.
//

import UIKit
import Combine

//APPError enum which shows all possible errors

enum APPError: String, Error {
    typealias RawValue = String
    
    case networkError = "Something is temporarily wrong with your network connection. Please make sure you are connected to the internet and try again."
    case dataNotFound =  "Error decoding data"
    case jsonParsingError = "Error decoding json"
}

@available(iOS 13.0, *)
class apiManager {
    private weak var MainController : UIViewController?
    var Subscriber: AnyCancellable?
    //Result enum to show success or failure
    enum Result<T> {
        case success(T)
        case failure(APPError)
    }
    init(controller : UIViewController) {
        self.MainController = controller
    }
    /*MARK : api request : Takes in apikey and object type, it returns the decoded object and an error completion
     errorHandler : .cancel - When the user discard the alert
                    .retry - When the user selects the retry option
    */
    func makeReqeust <T: Codable>(apiKey : String , objectType : T.Type, completionHandler : @escaping(Any) -> Void, errorHandler : @escaping(errorType) -> Void) {
        
        let result  = dataRequest(with: apiKey, objectType: objectType).receive(on: RunLoop.main)
        .sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                DispatchQueue.main.async {
                    //Error alert if failure occurs while fetching data
                    AlertModel.init().presentAlert(contoller: self.MainController, message: error.rawValue, title: "Error" , alertType: .error, completionHandler: { errorType in
                        switch errorType {
                            case .cancel :
                                errorHandler(.cancel)
                            case .retry:
                                errorHandler(.retry)
                        }
                    })
                }
            case .finished :
                print("finished")
            }
        }, receiveValue: { data in
           DispatchQueue.main.async {
                completionHandler(data)
            }
        })
        Subscriber = AnyCancellable(result)
    }
 


    //dataRequest which sends request to given URL and convert to Decodable Object
    private func dataRequest<T: Codable>(with url: String, objectType: T.Type)  -> Future<Any, APPError> {
        return Future(){ promise in
            //create the url with NSURL
            if let url = URL(string: url){
                let dataURL = url //change the url
                
                //create the session object
                let session = URLSession.shared
                
                //now create the URLRequest object using the url object
                let request = URLRequest(url: dataURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
                
                //create dataTask using the session object to send data to the server
                let task = session.dataTask(with: request, completionHandler: { data, response, error in
                   
                    guard error == nil else {
                        DispatchQueue.main.async {
                            promise(.failure(APPError.networkError))
                        }
                      //  completion(Result.failure(APPError.networkError(error!)))
                        return
                    }
                    
                    guard let data = data else {
                        DispatchQueue.main.async {
                            promise(.failure(.dataNotFound))
                        }
                       // completion(Result.failure(APPError.dataNotFound))
                        return
                    }
                    
                   
                    
                    do {
                        //create decodable object from data
                        let decodedObject = try JSONDecoder().decode(objectType.self, from: data)
                        DispatchQueue.main.async {
                            promise(.success(decodedObject))
                        }
                    
                       // completion(Result.success(decodedObject))
                    } catch let error {
                        DispatchQueue.main.async {
                            promise(.failure(.jsonParsingError))
                        }
                       // completion(Result.failure(APPError.jsonParsingError(error as! DecodingError)))
                    }
                })
                task.resume()
            }
        }
    
    }
}


