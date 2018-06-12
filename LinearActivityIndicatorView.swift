// Copyright © 2018 Chamitha Wijesekera. All rights reserved.

import Foundation
import UIKit

class LinearActivityIndicatorView: UIView {
    var barTintColor: UIColor = .blue {
        didSet {
            barView1.backgroundColor = barTintColor
            barView2.backgroundColor = barTintColor
        }
    }

    private let barView1 = UIView()
    private let barView2 = UIView()
    private var isAnimating = false

    override public init(frame: CGRect) {
        super.init(frame: frame)

        barView1.backgroundColor = barTintColor
        barView2.backgroundColor = barTintColor

        addSubview(barView1)
        addSubview(barView2)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError()
    }

    func startAnimating() {
        guard !isAnimating else { return }

        isAnimating = true
        isHidden = false

        animate()
    }

    func stopAnimating() {
        isAnimating = false
        isHidden = true
    }

    private func animate() {
        guard isAnimating else { return }

        barView1.frame = CGRect(x: 0, y: 0, width: 0, height: bounds.height)
        barView2.frame = CGRect(x: 0, y: 0, width: 0, height: bounds.height)

        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [.calculationModeCubic], animations: {
            // Start Time = 0s
            // Duration = 0.4s
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
                self.barView1.frame = CGRect(x: 0, y: 0, width: self.bounds.width * 0.5, height: self.bounds.height)
            })

            // Start Time = 0.4s
            // Duration = 0.4s
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.2, animations: {
                self.barView1.frame = CGRect(x: self.bounds.width * 0.25, y: 0, width: self.bounds.width * 0.75, height: self.bounds.height)
            })

            // Start Time = 0.8s
            // Duration = 0.5s
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.25, animations: {
                self.barView1.frame.origin = CGPoint(x: self.bounds.width, y: 0)
            })

            // Start Time = 1.1s
            // Duration = 0.3s
            UIView.addKeyframe(withRelativeStartTime: 0.55, relativeDuration: 0.15, animations: {
                self.barView2.frame = CGRect(x: 0, y: 0, width: self.bounds.width * 0.75, height: self.bounds.height)
            })

            // Start Time = 1.4s
            // Duration = 0.3s
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.15, animations: {
                self.barView2.frame = CGRect(x: self.bounds.width * 0.75, y: 0, width: self.bounds.width * 0.25, height: self.bounds.height)
            })

            // Start Time = 1.7s
            // Duration = 0.2s
            UIView.addKeyframe(withRelativeStartTime: 0.85, relativeDuration: 0.1, animations: {
                self.barView2.frame.origin = CGPoint(x: self.bounds.width, y: 0)
            })
        }, completion: { _ in
            self.animate()
        })
    }
}
