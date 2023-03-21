//
//  ViewController.swift
//  TaskSeven
//
//  Created by Alexander Nifontov on 21.03.2023.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: - Constants
	
	enum Constants {
		static let imageHeight: CGFloat = 400
		static let scrollHeight: CGFloat = 1500
	}
	
	// MARK: - Subviews
	
	private lazy var scrollView = UIScrollView()
	private lazy var imageView = UIImageView()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		scrollView.insetsLayoutMarginsFromSafeArea = false
		scrollView.contentInsetAdjustmentBehavior = .never
		scrollView.delegate = self
		
		imageView.image = UIImage(named: "default")
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		
		view.addSubview(scrollView)
		scrollView.addSubview(imageView)
	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		
		scrollView.frame = view.frame
		scrollView.contentSize = CGSize(width: view.frame.width, height: Constants.scrollHeight)
		scrollView.verticalScrollIndicatorInsets.top = Constants.imageHeight - view.safeAreaInsets.top
		
		imageView.frame.origin = .zero
		imageView.frame.size = CGSize(width: view.frame.width, height: Constants.imageHeight)
	}
}

// MARK: - UIScrollViewDelegate

extension ViewController: UIScrollViewDelegate {
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		if scrollView.contentOffset.y < 0 {
			let imageViewHeigh = Constants.imageHeight - scrollView.contentOffset.y
			
			imageView.frame.origin = CGPoint(x: 0, y: scrollView.contentOffset.y)
			imageView.frame.size = CGSize(width: view.frame.width, height: imageViewHeigh)
			scrollView.verticalScrollIndicatorInsets.top = imageViewHeigh - view.safeAreaInsets.top
		}
	}
}

