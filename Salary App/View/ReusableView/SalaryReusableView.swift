////
////  SalaryReusableView.swift
////  Salary App
////
////  Created by Tobi Adegoroye on 21/06/2023.
////
//
//import UIKit
//
//class SalaryReusableView: UIView {
//
//    private lazy var mainView: UIView = {
//        let salaryDescriptionView = UIView()
//        salaryDescriptionView.translatesAutoresizingMaskIntoConstraints = false
//        salaryDescriptionView.backgroundColor = .white
//        salaryDescriptionView.layer.cornerRadius = 16
//        return salaryDescriptionView
//    }()
//
//    private lazy var label: UILabel = {
//        let label = UILabel()
//        label.font = UIFont(name: "SF Pro Rounded", size: 20)
//        label.textColor = .black
//        label.numberOfLines = 0
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private lazy var stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.alignment = .fill
//        stackView.distribution = .fill
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        stackView.spacing = 8
//        return stackView
//    }()
//
//    private lazy var infoBtn: UIButton = {
//        let infoBtn = UIButton()
//        infoBtn.translatesAutoresizingMaskIntoConstraints = false
//        infoBtn.setImage(UIImage(systemName: "info.circle.fill"), for: .normal)
//        return infoBtn
//    }()
//
//    private var image: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(named: "salaryIcon")
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.contentMode = .scaleAspectFit
//        return image
//    }()
//
//
//    init(label: String) {
//        super.init(frame: .zero)
//        self.translatesAutoresizingMaskIntoConstraints = false
//        self.label.text = label
//        setupLayout()
//      }
//
//    func setupLayout() {
//        self.addSubview(mainView)
//        mainView.addSubview(stackView)
//        stackView.addArrangedSubview(image)
//        stackView.addArrangedSubview(label)
//        stackView.addArrangedSubview(infoBtn)
//
//        NSLayoutConstraint.activate([
//
//            mainView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
//            mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            mainView.trailingAnchor
//                .constraint(equalTo: self.trailingAnchor, constant: -16),
//            mainView.bottomAnchor
//                .constraint(equalTo: self.bottomAnchor, constant: -8),
//            mainView.heightAnchor.constraint(equalToConstant: 50),
//
//
//            stackView.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor, constant: 16),
//            stackView.leadingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.leadingAnchor, constant: 8),
//            stackView.trailingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.trailingAnchor, constant: -8),
//            stackView.bottomAnchor
//                .constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor, constant: -16),
//        ])
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//        setupLayout()
//    }
//
//}
//
//
