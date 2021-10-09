//
//  FunViewController.swift
//  FintechGame
//
//  Created by v.zhokhov on 09.10.2021.
//

import UIKit

/// Состояние выбрано валюта для пересчета иил результат
enum State {
    case inputView
    case outputView
}

/// Вью контроллер главного экрана:
final class FunViewController: UIViewController {

    // MARK: UI
    
    private lazy var contentView = UIView()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Что такое акции:"
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
//        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let descriptionTextFiled: UITextView = {
        let sampleTextField =  UITextView()
        sampleTextField.text = """
            Акция — это доля в компании. Инвестор, купивший акции, становится совладельцем бизнеса, он может претендовать на часть его прибыли и имущества. Чем большую прибыль получит эмитент, тем больше заработает акционер. С другой стороны, если компания обанкротится, то и стоимость акций упадёт до нуля — тогда инвестор потеряет деньги.
        
        Например, представьте, что вы с другом решили открыть свой бизнес и вложили по 50 000 ₽. Тогда уставной капитал вашей компании составит 100 000 ₽. Каждый из совладельцев бизнеса будет иметь 50 % долю в этом капитале — а значит и в доходах, которые будет получать компания.

        В какой-то момент вы захотели вывести часть денег из оборота. Но это оказывается невозможным — допустим, фирма недавно закупила новое оборудование и свободных средств на её счетах нет.

        Тогда вы решаете выпустить акции — 100 штук, каждая из которых подтверждает владение 1000 рублей в уставном капитале. Теперь вам и вашему другу принадлежит по 50 акций. Затем вы находите человека, который не против поучаствовать в вашем бизнесе, и продаёте ему 20 акций. В результате вы получите деньги, но ваша доля в уставном капитале компании уменьшится. Теперь вашему другу по-прежнему принадлежат 50 %, вам — 30 %, а новому инвестору — 20 %.

        Конечно, в реальной жизни выпустить акции не так просто, но суть не меняется — акция подтверждает долю в компании, поэтому она стоит каких-то денег.

        Облигация — это как кредит. Компания или государство занимает у инвестора деньги и обязуется вернуть их через определённый срок. Это значит, доходы инвестора не зависят от прибыли, которую получит бизнес: в день погашения он должен выплатить держателю облигаций заранее известную сумму.
"""
        sampleTextField.translatesAutoresizingMaskIntoConstraints = false
        sampleTextField.font = UIFont.systemFont(ofSize: 17)
        sampleTextField.showsVerticalScrollIndicator = false
        sampleTextField.isScrollEnabled = false
        sampleTextField.sizeToFit()
        return sampleTextField
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 5
        button.addTarget(self, action: #selector(tapOnConfirmButton(sender:)), for: .touchUpInside)
        return button
    }()

    /// Лейбл левой кнопки
    let confirmButtonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .white //LightPalette().color(.darkBlue)
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "Пройти тест"
        return label
    }()

    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerNotifications()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Справочник"
        view.backgroundColor = .white
        self.hideKeyboardWhenTappedAround()
//        setupScrollView()
//        setupMainCOntent()
        setupView()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        scrollView.contentInset.bottom = 0
    }


    // MARK: - Keyboard
    private func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset: UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height // + 20 px
        scrollView.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInset: UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }

    private func setupView() {
        view.addSubview(headerLabel)
        view.addSubview(imageView)
        view.addSubview(descriptionTextFiled)
        view.addSubview(confirmButton)
        confirmButton.addSubview(confirmButtonLabel)
        
        NSLayoutConstraint.activate([
            
            headerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            
            imageView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 25),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            descriptionTextFiled.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            descriptionTextFiled.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            descriptionTextFiled.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 25),
            descriptionTextFiled.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            confirmButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            confirmButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            confirmButton.topAnchor.constraint(equalTo: descriptionTextFiled.bottomAnchor, constant: 25),
            confirmButton.heightAnchor.constraint(equalToConstant: 60),
            
            confirmButtonLabel.leftAnchor.constraint(equalTo: confirmButton.leftAnchor),
            confirmButtonLabel.rightAnchor.constraint(equalTo: confirmButton.rightAnchor),
            confirmButtonLabel.topAnchor.constraint(equalTo: confirmButton.topAnchor),
            confirmButtonLabel.bottomAnchor.constraint(equalTo: confirmButton.bottomAnchor),
        ])
    }
}

// для скрытия клавиатуры
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}

extension FunViewController {
    @objc private func tapOnConfirmButton(sender: UIButton) {
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
