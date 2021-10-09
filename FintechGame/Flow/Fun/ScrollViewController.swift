//
//  ScrollView.swift
//  FintechGame
//
//  Created by v.zhokhov on 09.10.2021.
//

import UIKit

class ScrollViewController: UIViewController {

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        return scrollView
    }()

    let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0 //10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // 1
    let redView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 500).isActive = true
        view.backgroundColor = .red
        return view
    }()

    // 2
    let blueView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        view.backgroundColor = .blue
        return view
    }()

    // 3
    private lazy var greenView: FunView = {
        let view = FunView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.heightAnchor.constraint(equalToConstant: 1200).isActive = true
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
//        scrollViewContainer.addArrangedSubview(redView)
//        scrollViewContainer.addArrangedSubview(blueView)
        scrollViewContainer.addArrangedSubview(greenView)

        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        // this is important for scrolling
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
}

extension ScrollViewController: FunViewDelegate {
    
    func buttonHandler() {
        let testList: [TestList] = [
            TestList(text: "Text",
                     options: ["Держать, Продавать"],
                     dots: [22, 32],
                     testListRight: "Держать",
                     explainRight:  "Держать",
                     explainWrong:  "Продавать"),
            TestList(text: "Text",
                     options: ["Держать, Продавать"],
                     dots: [22, 32],
                     testListRight: "Продавать",
                     explainRight:  "Держать",
                     explainWrong:  "Продавать"),
            TestList(text: "Text",
                     options: ["Держать, Продавать"],
                     dots: [22, 32],
                     testListRight: "Держать",
                     explainRight:  "Держать",
                     explainWrong:  "Продавать")
        ]
        let model = Stock(testList: testList)
        navigationController?.pushViewController(Router.createBuySellViewController(with: model), animated: true)
        print("Tap")
    }
}
