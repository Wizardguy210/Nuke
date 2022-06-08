// The MIT License (MIT)
//
// Copyright (c) 2015-2022 Alexander Grebenyuk (github.com/kean).

import Foundation

extension ImageProcessors {
    /// Processed an image using a specified closure.
    public struct Anonymous: ImageProcessing, CustomStringConvertible {
        public let identifier: String
        private let closure: (PlatformImage) throws -> PlatformImage

        public init(id: String, _ closure: @escaping (PlatformImage) throws -> PlatformImage) {
            self.identifier = id
            self.closure = closure
        }

        public func process(_ container: ImageContainer, context: ImageProcessingContext) throws -> ImageContainer {
            try container.map(closure)
        }

        public var description: String {
            "AnonymousProcessor(identifier: \(identifier)"
        }
    }
}
