//
//  CoreService.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 6.08.2020.
//

import Alamofire
import PromiseKit

class CoreService {
    
    private var baseApiUrl = Bundle.main.object(forInfoDictionaryKey: "ApiUrl") as! String
    private var endPoint: String = ""
    
    private let sessionManager: Session?
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        sessionManager = Alamofire.Session(configuration: configuration)
    }
    
    func headers() -> HTTPHeaders {
        let userDefaults = UserDefaults.standard
        let headerLang = userDefaults.value(forKey: "langHeader") as? String ?? "en-US"
        
        if let token: String = UserDefaults.standard.value(forKey: Constants.Api.token) as? String {
            
            return  ["Authorization": "Bearer \(token)",
                     "Content-Type" : "application/json",
                     "Accept-Language": headerLang]
        }
        
        return ["Content-Type" : "application/json",
                "Accept-Language": headerLang ]
    }
    
    //MARK: - Request
    
    @discardableResult
    public func request<T:Decodable>(fullUrl url: String,method: HTTPMethod, parameters: Parameters?) -> Promise<T> {
        
        var encodinga: ParameterEncoding? = nil
        if(method != .get) {
            encodinga = JSONEncoding.default
        } else {
            encodinga = URLEncoding.queryString
        }
      
                
        return Promise<T> { seal in
            sessionManager!.request(url, method: method, parameters: parameters, encoding: encodinga!, headers: headers())
                .validate(statusCode: 200..<300)
                .responseDecodable { (response: DataResponse<T, AFError>) in
                    if response.data != nil {
                        switch response.result {
                        case .success(let value):
                            seal.fulfill(value)
                        case .failure(let error):
                            guard let data = response.data else {
                                seal.reject(error)
                                return
                            }
                            
                            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else{
                                seal.reject(error)
                                return
                            }
                            
                            print(json)
                            if let code = response.response?.statusCode {
                                switch code {
                                case 400..<599, 0:
                                    if let code = json["errorCode"] as? Int{
                                        print(code)
                                    }
                                    if let title = json["message"] as? String{
                                        print(title)
                                    }
                                default:
                                    print("Unexpected status")
                                }
                            }
                            seal.reject(error)
                        }
                    } else {
                        print("response nil non value \(String(describing: response.error?.localizedDescription))")
                        seal.reject(response.error!)
                    }
                }
        }
        
        
    }

    
    
    
    //MARK: - Actions
    
    func getPagination<T:Decodable>(url: String, page: Int = 0, size: Int = 20) -> Promise<T> {
        endPoint = baseApiUrl+url
        return self.request(fullUrl: endPoint, method: .get, parameters: ["page":page, "size": size])
    }
    
    func get<T: Decodable>(url: String, parameters : [String:Any]? = nil) -> Promise<T> {
        endPoint = baseApiUrl+url
        return self.request(fullUrl: endPoint , method: HTTPMethod.get , parameters : parameters)
    }
    
    func post<T: Decodable>(url: String, parameters: Parameters?) -> Promise<T>  {
        endPoint = baseApiUrl+url
        return self.request(fullUrl: endPoint , method: HTTPMethod.post , parameters : parameters)
    }
    
    func put<T: Decodable>(url: String, parameters: Parameters) -> Promise<T> {
        endPoint = baseApiUrl+url
        return self.request(fullUrl: endPoint , method: HTTPMethod.put , parameters : parameters)
    }
    
    func patch<T: Decodable>(url: String, parameters: Parameters) -> Promise<T> {
        endPoint = baseApiUrl+url
        return self.request(fullUrl: endPoint , method: HTTPMethod.patch , parameters : parameters)
    }
    
    func delete<T: Decodable>(url: String, parameters: Parameters? = nil) -> Promise<T> {
        endPoint = baseApiUrl+url
        return self.request(fullUrl: endPoint , method: HTTPMethod.delete , parameters : parameters)
    }
}

