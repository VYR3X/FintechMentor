//
//  NetworkManager.swift
//  FintechGame
//
//  Created by v.zhokhov on 09.10.2021.
//

import Foundation

/// Протокол для взаимодействия с сетевым сервисом
protocol NetworkServiceProtocol {
    
    func fetchTeachCards(completion: @escaping (Result<StockModel, Error>) -> ())

    func fetchFunCard(completion: @escaping (Result<Stock, Error>) -> ())
}

/// Класс отвечающий за парсинг курса валют
final class NetworkManager {
    
    // Синглтон сервиса
       static let shared = NetworkManager()
//       private init() {}

    // URL для получения валют в json формате
    private let jsonUrl = "https://dc0b-109-173-20-55.ngrok.io/intro/"
    
    /// Загрузка данных
    /// - Parameters:
    ///   - url: урл
    ///   - completion: блок завершения
    func getContent<ResultContent: Decodable>(urlString: String,
                                              completion: @escaping (Result<ResultContent, Error>) -> Void) {

        let url = URL(string: urlString)
        let request = URLRequest(url: url!)

        let session = URLSession.shared

        session.dataTask(with: request) { data, responce, error in
            guard let data = data else { return }
            do {
                let currencyJsonModel = try JSONDecoder().decode(ResultContent.self, from: data)
                completion(.success(currencyJsonModel))
            }
            catch let jsonError {
                print("Ошибка парсинга данных /n")
                completion(.failure(jsonError))
            }
        }.resume()
    }
    
    func postRequest(userAnswer: Bool, completion: @escaping (Result<TinderModel, Error>) -> Void) {
        let url = URL(string: "https://73b8-109-173-20-55.ngrok.io/card/")!
        var request = URLRequest(url: url)
        let parameters: [String: Any] = [
            "user_id": "228",
            "last_answer": "\(userAnswer)"
        ]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) else { return }
        request.httpMethod = "POST"
        request.httpBody = httpBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                let response = response as? HTTPURLResponse,
                error == nil else {
                print("error", error ?? "Unknown error")
                return
            }
            guard (200 ... 299) ~= response.statusCode else {
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }
            do {
//              let json = try JSONSerialization.jsonObject(with: data, options: [])
                let model = try JSONDecoder().decode(TinderModel.self, from: data)
                completion(.success(model))
                print(model)
            } catch {
                // добавить локальную выгружку данны из файла tinderCardInfo
                print("eror")
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    // delete
    func decode(data: Data) {
        let jsonDecoder = JSONDecoder()
        do {
            let secondDog = try jsonDecoder.decode(TinderModel.self, from: data)
            print("secondDog = \(secondDog)")
        } catch {
            print(error)
        }
    }
}

extension NetworkManager: NetworkServiceProtocol {
    
    func fetchTeachCards(completion: @escaping (Result<StockModel, Error>) -> ()) {
        self.getContent(urlString: "https://dc0b-109-173-20-55.ngrok.io/intro/", completion: completion)
    }
    
    func fetchFunCard(completion: @escaping (Result<Stock, Error>) -> ()) {
        self.getContent(urlString: "https://dc0b-109-173-20-55.ngrok.io/intro/", completion: completion)
    }
}
