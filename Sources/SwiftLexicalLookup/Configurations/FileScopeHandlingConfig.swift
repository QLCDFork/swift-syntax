//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2024 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

import SwiftSyntax

/// Specifies how names should be introduced at the file scope.
@_spi(Experimental) public enum FileScopeHandlingConfig {
  /// This is the behavior that is being used
  /// for Swift files with top-level code.
  case memberBlockUpToLastDecl
  /// This is the behavior that is being used
  /// for Swift files that don’t allow top-level code.
  case memberBlock
}
