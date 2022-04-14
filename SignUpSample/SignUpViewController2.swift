//
//  SignUpViewController2.swift
//  SignUpSample
//
//  Created by Eido Goya on 2022/04/14.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class CustomTxtFieldContainer: UIView {
    var guideLabel: UILabel!
    var textField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        guideLabel = {
            let label = UILabel()
            return label
        }()
        textField = {
            let textField = UITextField()
            textField.placeholder = "Title *"
            textField.backgroundColor = .white
            
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            
            textField.autocorrectionType = UITextAutocorrectionType.no
            
            textField.font = UIFont.systemFont(ofSize: 13)
            
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            
            return textField
        }()
        
        addSubview(guideLabel)
        addSubview(textField)
        
        guideLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.left.equalToSuperview().inset(10)
        }
        textField.snp.makeConstraints {
            $0.top.equalTo(guideLabel.snp.bottom).offset(10)
            $0.left.equalToSuperview().inset(10)
            $0.right.equalToSuperview().inset(10)
            $0.height.equalTo(60)
            $0.bottom.equalToSuperview().inset(10)
        }
    }
    
}

class SignUpViewController2: UIViewController {
    
    var headerContainer: UIView!
    var headerLabel: UILabel!
    
    var scrollView: UIScrollView!
    var stackView: UIStackView!
    var bottomBtn: UIButton!
    
    var nameContainer: CustomTxtFieldContainer!
    var carrierContainer: CustomTxtFieldContainer!
    var socialNumContainer: CustomTxtFieldContainer!
    var phoneNumContainer: CustomTxtFieldContainer!
    
    var disposeBag: DisposeBag = DisposeBag()
    
    override func loadView() {
        super.loadView()
        setupViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bottomBtn.rx.tap
            .bind { [weak self] _ in
                guard let `self` = self else { return }
                
            }
            .disposed(by: disposeBag)
        
        phoneNumContainer.textField.rx
            .text
            .compactMap { $0 }
            .observe(on: MainScheduler.asyncInstance)
            .bind { text in
                if text.count >= 11 {
                    self.phoneNumContainer.textField.resignFirstResponder()
                    
                    UIView.transition(with: self.socialNumContainer, duration: 0.5) {
                        self.socialNumContainer.isHidden = false
                    }
                    
                    self.socialNumContainer.textField.becomeFirstResponder()
                }
            }
            .disposed(by: disposeBag)
        
        socialNumContainer.textField.rx
            .controlEvent([.editingDidEndOnExit])
            .bind { text in
                print(text)
            }
            .disposed(by: disposeBag)
        
        carrierContainer.textField.rx
            .controlEvent([.editingDidEndOnExit])
            .bind { text in
                print(text)
            }
            .disposed(by: disposeBag)
        
        nameContainer.textField.rx
            .controlEvent([.editingDidEndOnExit])
            .bind { text in
                print(text)
            }
            .disposed(by: disposeBag)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        headerContainer = {
            let view = UIView()
            return view
        }()
        headerLabel = {
            let label = UILabel()
            label.numberOfLines = 2
            label.text = "Title\nTitle"
            label.font = .systemFont(ofSize: 22, weight: .semibold)
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
            sv.backgroundColor = .systemGray5
            sv.translatesAutoresizingMaskIntoConstraints  = false
            return sv
        }()
        bottomBtn = {
            let btn = UIButton(type: .roundedRect)
            btn.backgroundColor = .systemBlue
            btn.layer.cornerRadius = 8.0
            btn.isHidden = true
            
            btn.setTitle("다음", for: .normal)
            btn.setTitleColor(.white, for: .normal)
            
            return btn
        }()
        
        nameContainer = {
            let container = CustomTxtFieldContainer()
            container.guideLabel.text = "Name"
            container.isHidden = true
            return container
        }()
        carrierContainer = {
            let container = CustomTxtFieldContainer()
            container.guideLabel.text = "Carrier"
            container.isHidden = true
            return container
        }()
        socialNumContainer = {
            let container = CustomTxtFieldContainer()
            container.guideLabel.text = "Social"
            container.isHidden = true
            container.textField.keyboardType = .numberPad
            return container
        }()
        phoneNumContainer = {
            let container = CustomTxtFieldContainer()
            container.guideLabel.text = "Phone"
            container.textField.keyboardType = .numberPad
            return container
        }()
        
        headerContainer.addSubview(headerLabel)
        view.addSubview(headerContainer)
        
        stackView.addArrangedSubview(nameContainer)
        stackView.addArrangedSubview(carrierContainer)
        stackView.addArrangedSubview(socialNumContainer)
        stackView.addArrangedSubview(phoneNumContainer)
        
        scrollView.addSubview(stackView)
        view.addSubview(scrollView)
        view.addSubview(bottomBtn)
        
        headerContainer.snp.makeConstraints {
            $0.leading.trailing.equalTo(view)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.height.equalTo(80)
        }
        headerLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().inset(20)
        }
        stackView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
        scrollView.snp.makeConstraints {
            $0.top.equalTo(headerContainer.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(bottomBtn.snp.top).offset(-10)
        }
        bottomBtn.snp.makeConstraints {
            $0.height.equalTo(60)
            $0.left.right.equalToSuperview().inset(10)
            $0.bottom.equalTo(view.keyboardLayoutGuide.snp.top).offset(-10)
        }
        nameContainer.snp.makeConstraints {
            $0.height.equalTo(110)
        }
        carrierContainer.snp.makeConstraints {
            $0.height.equalTo(110)
        }
        socialNumContainer.snp.makeConstraints {
            $0.height.equalTo(110)
        }
        phoneNumContainer.snp.makeConstraints {
            $0.height.equalTo(110)
        }
    }
    
}
