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
}

extension NetworkManager: NetworkServiceProtocol {
    
    func fetchTeachCards(completion: @escaping (Result<StockModel, Error>) -> ()) {
        self.getContent(urlString: "https://dc0b-109-173-20-55.ngrok.io/intro/", completion: completion)
    }
    
    func fetchFunCard(completion: @escaping (Result<Stock, Error>) -> ()) {
        self.getContent(urlString: "https://dc0b-109-173-20-55.ngrok.io/intro/", completion: completion)
    }
}
