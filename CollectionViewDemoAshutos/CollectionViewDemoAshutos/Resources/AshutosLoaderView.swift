//
//  AshutosLoaderView.swift
//  CollectionViewDemoAshutos
//
//  Created by Ashutos on 01/09/19.
//  Copyright © 2019 Ashutos. All rights reserved.
//

import UIKit

class AshutosLoaderView: UIView {

    private lazy var shadowView: UIView = {
        let shadowView = UIView()
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        return shadowView
    }()

    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var loader: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView()
        indicatorView.color = UIColor.darkGray
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        return indicatorView
    }()

    private lazy var loaderDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var loaderDescription: String = "" {
        didSet {
            loaderDescriptionLabel.text = loaderDescription
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        setupShadowView()
        setupContainerStackView()
        setupLoader()
        setupLoaderDescriptionLabel()
    }

    private func setupShadowView() {
        addSubview(shadowView)
        shadowView.addGrayShadowToAllSides()
        NSLayoutConstraint.activate([
            shadowView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: trailingAnchor),
            shadowView.topAnchor.constraint(equalTo: topAnchor),
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }

    private func setupContainerStackView() {
        addSubview(containerStackView)
        NSLayoutConstraint.activate([
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }

    private func setupLoader() {
        containerStackView.addArrangedSubview(loader)
    }

    private func setupLoaderDescriptionLabel() {
        containerStackView.addArrangedSubview(loaderDescriptionLabel)
    }

    func showLoaderOn(view: UIView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        view.addSubview(self)
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        loader.startAnimating()
    }

    func hideLoader() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        loader.stopAnimating()
        self.removeFromSuperview()
    }

}

extension UIView {
    func addGrayShadowToAllSides() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4.0
    }
}
