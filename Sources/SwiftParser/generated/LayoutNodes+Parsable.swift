//// Automatically generated by generate-swift-syntax
//// Do not edit directly!
//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2023 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

#if compiler(>=6)
@_spi(RawSyntax) @_spi(ExperimentalLanguageFeatures) @_spi(Compiler) public import SwiftSyntax
#else
@_spi(RawSyntax) @_spi(ExperimentalLanguageFeatures) @_spi(Compiler) import SwiftSyntax
#endif

public protocol SyntaxParseable: SyntaxProtocol {
  static func parse(from parser: inout Parser) -> Self
}

extension SyntaxParseable {
  fileprivate static func parse(
    from parser: inout Parser,
    parse: (_ parser: inout Parser) -> some RawSyntaxNodeProtocol
  ) -> Self {
    // Keep the parser alive so that the arena in which `raw` is allocated
    // doesn’t get deallocated before we have a chance to create a syntax node
    // from it. We can’t use `parser.arena` as the parameter to
    // `Syntax(raw:arena:)` because the node might have been re-used during an
    // incremental parse and would then live in a different arena than
    // `parser.arena`.
    defer {
      withExtendedLifetime(parser) {
      }
    }
    let node = parse(&parser)
    let raw = RawSyntax(parser.parseRemainder(into: node))
    return Syntax(raw: raw, rawNodeArena: raw.arena).cast(Self.self)
  }
}

extension AccessorBlockFileSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseAccessorBlockFile()
    }
  }
}

extension AccessorBlockSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseAccessorBlock()
    }
  }
}

extension AccessorDeclSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseAccessorDecl()
    }
  }
}

extension AttributeClauseFileSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseAttributeClauseFile()
    }
  }
}

extension AttributeSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseAttribute()
    }
  }
}

extension AvailabilityMacroDefinitionFileSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseAvailabilityMacroDefinitionFile()
    }
  }
}

extension CatchClauseSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseCatchClause()
    }
  }
}

extension ClosureParameterSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseClosureParameter()
    }
  }
}

extension CodeBlockFileSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseCodeBlockFile()
    }
  }
}

extension CodeBlockItemSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseNonOptionalCodeBlockItem()
    }
  }
}

extension CodeBlockSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseCodeBlock()
    }
  }
}

extension DeclSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseDeclaration()
    }
  }
}

extension EnumCaseParameterSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseEnumCaseParameter()
    }
  }
}

extension ExprSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseExpression()
    }
  }
}

extension FunctionParameterSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseFunctionParameter()
    }
  }
}

extension GenericParameterClauseSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseGenericParameters()
    }
  }
}

extension MemberBlockItemListFileSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseMemberBlockItemListFile()
    }
  }
}

extension MemberBlockSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseMemberBlock()
    }
  }
}

extension PatternSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parsePattern()
    }
  }
}

extension SourceFileSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseSourceFile()
    }
  }
}

extension StmtSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseStatement()
    }
  }
}

extension SwitchCaseSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseSwitchCase()
    }
  }
}

extension TypeSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseType()
    }
  }
}

extension VersionTupleSyntax: SyntaxParseable {
  public static func parse(from parser: inout Parser) -> Self {
    parse(from: &parser) {
      $0.parseVersionTuple()
    }
  }
}

fileprivate extension Parser {
  mutating func parseNonOptionalCodeBlockItem() -> RawCodeBlockItemSyntax {
    guard let node = self.parseCodeBlockItem(isAtTopLevel: false, allowInitDecl: true) else {
      // The missing item is not necessary to be a declaration,
      // which is just a placeholder here
      return RawCodeBlockItemSyntax(
        item: .init(
          decl: RawMissingDeclSyntax(
            attributes: self.emptyCollection(RawAttributeListSyntax.self),
            modifiers: self.emptyCollection(RawDeclModifierListSyntax.self),
            arena: self.arena
          )
        ),
        semicolon: nil,
        arena: self.arena
      )
    }
    return node
  }

  mutating func parseExpression() -> RawExprSyntax {
    return self.parseExpression(flavor: .basic, pattern: .none)
  }
}
