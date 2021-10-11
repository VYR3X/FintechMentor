//
//  NetworkManager.swift
//  FintechGame
//
//  Created by v.zhokhov on 09.10.2021.
//

import Foundation

/// Протокол для взаимодействия с сетевым сервисом
protocol NetworkServiceProtocol {
    
    /// Пост запрос на получение данных
    /// - Parameters:
    ///   - userAnswer: Выбор пользователя true или false
    ///   - completion: Обработчик завершения
    func postRequest(userAnswer: Bool, completion: @escaping (Result<TinderModel, Error>) -> Void)
}

/// Сетевой менеджер
final class NetworkManager {
    
    // Синглтон сервиса
    static let shared = NetworkManager()
    
    func postRequest(userAnswer: Bool, completion: @escaping (Result<TinderModel, Error>) -> Void) {
        guard let url = URL(string: "https://73b8-109-173-20-55.ngrok.io/card/") else { return }
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
                // загрузка мок файла
                self.loadMockData { completion(.success($0)) }
                return
            }
            do {
                let model = try JSONDecoder().decode(TinderModel.self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    /// Загрузка мока
    private func loadMockData(completion: (TinderModel) -> Void) {
        switch Int.random(in: 0..<3) {
        case 0:
            guard let model = TinderModel.defaultCard else { return }
            completion(model)
        case 1:
            guard let model = TinderModel.linkCard else { return }
            completion(model)
        case 2:
            guard let model = TinderModel.mentorCard else { return }
            completion(model)
        default:
            print("Che")
        }
    }
}
