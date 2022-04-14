//
//  SignUpViewController.swift
//  SignUpSample
//
//  Created by Eido Goya on 2022/04/14.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var headerContainer: UIView!
    var headerLabel: UILabel!
    
    var scrollView: UIScrollView!
    var stackView: UIStackView!
    
    var nameContainer: UIView!
    var nameLabel: UILabel!
    var nameTextField: UITextField!
    
    var carrierContainer: UIView!
    var carrierLabel: UILabel!
    var carrierTextField: UITextField!
    
    var socialNumContainer: UIView!
    var socialNumLabel: UILabel!
    var socialNumTextField: UITextField!
    
    var phoneNumContainer: UIView!
    var phoneNumLabel: UILabel!
    var phoneNumTextField: UITextField!
    
    override func loadView() {
        super.loadView()
        setupViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func setupViews() {
        
        view.backgroundColor = .white
        
        headerContainer = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints  = false
            return view
        }()
        headerLabel = {
            let label = UILabel()
            label.text = "Title"
            label.translatesAutoresizingMaskIntoConstraints  = false
            return label
        }()
        
        scrollView = {
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
        stackView = {
            let sv = UIStackView()
            sv.axis = .vertical
            sv.alignment = .fill
            sv.backgroundColor = .blue
            sv.translatesAutoresizingMaskIntoConstraints  = false
            return sv
        }()
        
        nameContainer = {
            let view = UIView()
            view.backgroundColor = .red
            view.translatesAutoresizingMaskIntoConstraints  = false
            return view
        }()
        nameLabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints  = false
            return label
        }()
        nameTextField = {
            let txtField = UITextField()
            txtField.translatesAutoresizingMaskIntoConstraints  = false
            return txtField
        }()
        
        carrierContainer = {
            let view = UIView()
            view.backgroundColor = .orange
            view.translatesAutoresizingMaskIntoConstraints  = false
            return view
        }()
        carrierLabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints  = false
            return label
        }()
        carrierTextField = {
            let txtField = UITextField()
            txtField.translatesAutoresizingMaskIntoConstraints  = false
            return txtField
        }()
        
        socialNumContainer = {
            let view = UIView()
            view.backgroundColor = .yellow
            view.translatesAutoresizingMaskIntoConstraints  = false
            return view
        }()
        socialNumLabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints  = false
            return label
        }()
        socialNumTextField = {
            let txtField = UITextField()
            txtField.translatesAutoresizingMaskIntoConstraints  = false
            return txtField
        }()
        
        phoneNumContainer = {
            let view = UIView()
            view.backgroundColor = .green
            view.translatesAutoresizingMaskIntoConstraints  = false
            return view
        }()
        phoneNumLabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints  = false
            return label
        }()
        phoneNumTextField = {
            let txtField = UITextField()
            txtField.translatesAutoresizingMaskIntoConstraints  = false
            return txtField
        }()
        
        headerContainer.addSubview(headerLabel)
        view.addSubview(headerContainer)
        
        nameContainer.addSubview(nameLabel)
        nameContainer.addSubview(nameTextField)
        
        carrierContainer.addSubview(carrierLabel)
        carrierContainer.addSubview(carrierTextField)
        
        socialNumContainer.addSubview(socialNumLabel)
        socialNumContainer.addSubview(socialNumTextField)
        
        phoneNumContainer.addSubview(phoneNumLabel)
        phoneNumContainer.addSubview(phoneNumTextField)
        
        stackView.addArrangedSubview(nameContainer)
        stackView.addArrangedSubview(carrierContainer)
        stackView.addArrangedSubview(socialNumContainer)
        stackView.addArrangedSubview(phoneNumContainer)
        
        scrollView.addSubview(stackView)
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            headerContainer.topAnchor.constraint(equalTo: view.topAnchor),
            headerContainer.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerContainer.rightAnchor.constraint(equalTo: view.rightAnchor),
            headerContainer.heightAnchor.constraint(equalToConstant: 150),
            
            headerLabel.bottomAnchor.constraint(equalTo: headerContainer.bottomAnchor, constant: -15),
            headerLabel.leftAnchor.constraint(equalTo: headerContainer.leftAnchor, constant: 20),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            scrollView.topAnchor.constraint(equalTo: headerContainer.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            
            nameContainer.heightAnchor.constraint(equalToConstant: 100),
            nameTextField.leftAnchor.constraint(equalTo: nameContainer.leftAnchor),
            nameTextField.rightAnchor.constraint(equalTo: nameContainer.rightAnchor),
            nameTextField.bottomAnchor.constraint(equalTo: nameContainer.bottomAnchor, constant: -10),
            
            carrierContainer.heightAnchor.constraint(equalToConstant: 100),
            
            socialNumContainer.heightAnchor.constraint(equalToConstant: 100),
            
            phoneNumContainer.heightAnchor.constraint(equalToConstant: 100)
            
        ])
        
    }
    
}
