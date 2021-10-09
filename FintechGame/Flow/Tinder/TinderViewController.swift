//
//  TinderViewController.swift
//  FintechGame
//
//  Created by v.zhokhov on 09.10.2021.
//

import PopBounceButton
import Shuffle_iOS

/// Конроллер для отображения стека с карточками
class TinderViewController: UIViewController {
    
    var cardModels: [TinderCardModel] = []
    
    var cardDirection: SwipeDirection? = .left
    
    // MARK: UI
    
    let cardStack = SwipeCardStack()
    private let buttonTopStackView = ButtonStackView()
    private let buttonStackView = ButtonStackView()
    let conditionView = ConditionView()
    
//    private lazy var imageView: UIImageView = {
//        let imageView = UIImageView()
////        imageView.image = UIImage(named: "oleg")
//        imageView.backgroundColor = .clear
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
//        imageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
//        imageView.layer.cornerRadius = 125
//        imageView.clipsToBounds = true
//        return imageView
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardStack.delegate = self
        cardStack.dataSource = self
        buttonStackView.delegate = self
        
        configureNavigationBar()
        layoutTopButtonStackView()
        layoutButtonStackView()
        layoutCardStackView()
        configureBackgroundGradient()
//        setupOleg()
    }
    
//    private func setupOleg() {
//        view.addSubview(imageView)
//        NSLayoutConstraint.activate([
//            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
//            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
//        ])
//    }
    
    private func configureNavigationBar() {
        let backButton = UIBarButtonItem(title: "Back",
                                         style: .plain,
                                         target: self,
                                         action: #selector(handleShift))
        backButton.tag = 1
        backButton.tintColor = .lightGray
        navigationItem.leftBarButtonItem = backButton
        
        let forwardButton = UIBarButtonItem(title: "Forward",
                                            style: .plain,
                                            target: self,
                                            action: #selector(handleShift))
        forwardButton.tag = 2
        forwardButton.tintColor = .lightGray
        navigationItem.rightBarButtonItem = forwardButton
        
        navigationController?.navigationBar.layer.zPosition = -1
    }
    
    private func configureBackgroundGradient() {
        let backgroundGray = UIColor(red: 244 / 255, green: 247 / 255, blue: 250 / 255, alpha: 1)
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.white.cgColor, backgroundGray.cgColor]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    private func layoutTopButtonStackView() {
        conditionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(conditionView)
        conditionView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            left: view.safeAreaLayoutGuide.leftAnchor,
            right: view.safeAreaLayoutGuide.rightAnchor)
    }
    
    private func layoutCardStackView() {
        view.addSubview(cardStack)
        cardStack.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         left: view.safeAreaLayoutGuide.leftAnchor,
                         bottom: buttonStackView.topAnchor,
                         right: view.safeAreaLayoutGuide.rightAnchor,
                         paddingTop: 50)
    }
    
    private func layoutButtonStackView() {
        view.addSubview(buttonStackView)
        buttonStackView.anchor(left: view.safeAreaLayoutGuide.leftAnchor,
                               bottom: view.safeAreaLayoutGuide.bottomAnchor,
                               right: view.safeAreaLayoutGuide.rightAnchor,
                               paddingLeft: 50,
                               paddingBottom: 12,
                               paddingRight: 50)
    }
    
    @objc
    private func handleShift(_ sender: UIButton) {
        cardStack.shift(withDistance: sender.tag == 1 ? -1 : 1, animated: true)
    }
}

// MARK: Data Source + Delegates

extension TinderViewController: ButtonStackViewDelegate, SwipeCardStackDataSource, SwipeCardStackDelegate {
    
    func cardStack(_ cardStack: SwipeCardStack, cardForIndexAt index: Int) -> SwipeCard {
        let card = SwipeCard()
        card.footerHeight = 80
        card.swipeDirections = [.left, .up, .right]
        for direction in card.swipeDirections {
            card.setOverlay(TinderCardOverlay(direction: direction), forDirection: direction)
        }

        //cardModels[index]
//        navigationItem.title = "Баланс: \(cardModels[index].balance)"
        conditionView.balanceLabel.text = "Баланс: \(cardModels[index].balance)"
        let resultTitle = "Новости: \(cardModels[index].description)"
        let content = TraidCard(withImage: cardModels[index].image, title: resultTitle)
        card.content = content //TraidCard(withImage: cardModels[index].image, title: resultTitle)
        
        let persona = cardModels[index].character
        if persona != nil {
            switch persona {
            case "tutor1":
                content.characterView.image = UIImage(named: "hill")
            case "tutor2":
                content.characterView.image = UIImage(named: "macconahi")
            case "saver":
                content.characterView.image = UIImage(named: "oleg")
            case "mavrodi":
                content.characterView.image = UIImage(named: "leo")
            case .none:
                print("HH")
            case .some(_):
                print("HH")
            }
//            content.characterView.image = UIImage(named: "oleg")
            content.characterView.isHidden = false
        } else {
//                        self.imageView.backgroundColor = .clear
            content.characterView.isHidden = true
        }
        //TinderCardContentView(withImage: model.image)
//        card.footer = TinderCardFooterView(withTitle: "\(model.name)", subtitle: model.occupation)
        return card
    }
    
    func numberOfCards(in cardStack: SwipeCardStack) -> Int {
        return cardModels.count
    }
    
    func didSwipeAllCards(_ cardStack: SwipeCardStack) {
        print("Swiped all cards!")
        switch cardDirection {
        case .left:
//            Router.postRequest(userAnswer: false)
            addCards(userAnswer: false)
            cardDirection = .left
        case .right:
//            Router.postRequest(userAnswer: true)
            addCards(userAnswer: true)
            cardDirection = .right
        case .up:
//            Router.postRequest(userAnswer: true)
            addCards(userAnswer: true)
            cardDirection = .up
        case .down:
//            Router.postRequest(userAnswer: true)
            addCards(userAnswer: true)
            cardDirection = .down
        case .none:
            print("None direction")
        }
//        Router.postRequest(userAnswer: true)
        //navigationController?.pushViewController(Router.createFunViewController(), animated: true)
    }
    
    func cardStack(_ cardStack: SwipeCardStack, didUndoCardAt index: Int, from direction: SwipeDirection) {
        print("Undo \(direction) swipe on \(cardModels[index].name)")
//        Router.postRequest(userAnswer: true)
    }
    
    func cardStack(_ cardStack: SwipeCardStack, didSwipeCardAt index: Int, with direction: SwipeDirection) {
        print("Swiped \(direction) on \(cardModels[index].name)")
        switch direction {
        case .left:
//            addCards(userAnswer: false)
            cardDirection = .left
        case .right:
//            Router.postRequest(userAnswer: true)
//            addCards(userAnswer: true)
            cardDirection = .right
        case .up:
//            Router.postRequest(userAnswer: true)
//            addCards(userAnswer: true)
            cardDirection = .up
        case .down:
//            Router.postRequest(userAnswer: true)
//            addCards(userAnswer: true)
            cardDirection = .down
        }
    }
    
    private func addCards(userAnswer: Bool) {
        
        Router.networkManager.postRequest(userAnswer: userAnswer) { result in
            switch result {
            case .success(let model):
                print("")
                let oldModelsCount = self.cardModels.count
                let newModelsCount = oldModelsCount
                DispatchQueue.main.async {
                    let newModel = TinderCardModel(name: model.header,
                                                          description: model.text,
                                                          image: UIImage(named: "image2"),
                                                          character: model.character,
                                                          balance: model.balance)
//                    self.cardModels.append(newModel)
                    self.cardModels = [newModel]
                    
                    let newIndices = Array(oldModelsCount..<newModelsCount)
                    self.cardStack.appendCards(atIndices: newIndices)
                    self.cardStack.reloadData()
                }
            case .failure(let error):
                print("")
            }
        }
    }
    
    func cardStack(_ cardStack: SwipeCardStack, didSelectCardAt index: Int) {
        print("Card tapped")
    }
    
    func didTapButton(button: TinderButton) {
        switch button.tag {
        case 1:
            cardStack.undoLastSwipe(animated: true)
        case 2:
            cardStack.swipe(.left, animated: true)
        case 3:
            cardStack.swipe(.up, animated: true)
        case 4:
            cardStack.swipe(.right, animated: true)
        case 5:
            cardStack.reloadData()
        default:
            break
        }
    }
}

