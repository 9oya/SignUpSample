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
                
                self.view.endEditing(true)
                
                UIView.animate(withDuration: 0.5) {
                    self.bottomBtn.snp.updateConstraints {
                        $0.left.right.equalToSuperview().inset(10)
                        $0.bottom.equalTo(self.view.keyboardLayoutGuide.snp.top).offset(-10)
                    }
                    
                    self.bottomBtn.layer.cornerRadius = 8.0
                }
            }
            .disposed(by: disposeBag)
        
        phoneNumContainer.textField.rx
            .text
            .do(onNext: { _ in
                UIView.animate(withDuration: 0.5) {
                    self.phoneNumContainer.alpha = 1.0
                }
            })
            .compactMap { $0 }
            .distinctUntilChanged()
            .observe(on: MainScheduler.asyncInstance)
            .bind { text in
                if text.count >= 11 {
                    self.phoneNumContainer.textField.resignFirstResponder()
                    
                    if self.socialNumContainer.isHidden {
                        UIView.transition(with: self.socialNumContainer, duration: 0.5) {
                            self.socialNumContainer.isHidden = false
                        }
                    }
                    
                    UIView.animate(withDuration: 0.5) {
                        self.phoneNumContainer.alpha = 0.5
                        self.socialNumContainer.textField.becomeFirstResponder()
                    }
                }
            }
            .disposed(by: disposeBag)
        
        socialNumContainer.textField.rx
            .text
            .do(onNext: { _ in
                UIView.animate(withDuration: 0.5) {
                    self.socialNumContainer.alpha = 1.0
                }
            })
            .compactMap { $0 }
            .distinctUntilChanged()
            .observe(on: MainScheduler.asyncInstance)
            .bind { text in
                if text.count >= 7 {
                    self.socialNumContainer.textField.resignFirstResponder()
                    
                    if self.carrierContainer.isHidden {
                        UIView.transition(with: self.carrierContainer, duration: 0.5) {
                            self.carrierContainer.isHidden = false
                        }
                    }
                    
                    UIView.animate(withDuration: 0.5) {
                        self.socialNumContainer.alpha = 0.5
                        self.carrierContainer.textField.becomeFirstResponder()
                    }
                }
            }
            .disposed(by: disposeBag)
        
        carrierContainer.textField.rx
            .text
            .do(onNext: { _ in
                UIView.animate(withDuration: 0.5) {
                    self.carrierContainer.alpha = 1.0
                }
            })
            .compactMap { $0 }
            .distinctUntilChanged()
            .observe(on: MainScheduler.asyncInstance)
            .bind { text in
                if text.count >= 2 {
                    self.carrierContainer.textField.resignFirstResponder()
                    
                    if self.nameContainer.isHidden {
                        UIView.transition(with: self.nameContainer, duration: 0.5) {
                            self.nameContainer.isHidden = false
                        }
                    }
                    
                    UIView.animate(withDuration: 0.5) {
                        self.carrierContainer.alpha = 0.5
                        self.nameContainer.textField.becomeFirstResponder()
                    }
                }
            }
            .disposed(by: disposeBag)
        
        nameContainer.textField.rx
            .text
            .do(onNext: { _ in
                UIView.animate(withDuration: 0.5) {
                    self.nameContainer.alpha = 1.0
                }
                
                UIView.animate(withDuration: 0.5) {
                    self.bottomBtn.snp.updateConstraints {
                        $0.left.right.equalToSuperview().inset(0)
                        $0.bottom.equalTo(self.view.keyboardLayoutGuide.snp.top).offset(-0)
                    }
                    self.bottomBtn.layer.cornerRadius = 0.0
                }
            })
            .compactMap { $0 }
            .distinctUntilChanged()
            .observe(on: MainScheduler.asyncInstance)
            .bind { text in
                if text.count >= 1 {
                    
                    UIView.animate(withDuration: 0.5) {
                        self.bottomBtn.snp.updateConstraints {
                            $0.height.equalTo(60)
                            $0.left.right.equalToSuperview().inset(0)
                            $0.bottom.equalTo(self.view.keyboardLayoutGuide.snp.top).offset(-0)
                        }
                        self.bottomBtn.layer.cornerRadius = 0.0
                    }
                    
                    if self.bottomBtn.isHidden {
                        UIView.transition(with: self.bottomBtn, duration: 0.5) {
                            self.bottomBtn.isHidden = false
                        }
                    }
                    
                }
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
//            btn.layer.cornerRadius = 8.0
            btn.layer.cornerRadius = 0.0
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
            $0.bottom.equalTo(bottomBtn.snp.top).offset(-0)
        }
        bottomBtn.snp.makeConstraints {
            $0.height.equalTo(0)
            $0.left.right.equalToSuperview().inset(0)
            $0.bottom.equalTo(view.keyboardLayoutGuide.snp.top).offset(-0)
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
