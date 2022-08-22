# ios-mvp-example

## 概要

サンプルプロジェクト

## アーキテクチャー

MVP + UseCase + Repository

## 環境

- OS: macOS Monterey 12.5.1
- Xcode: 13.4.1
- Mint: 0.17.1

| 名称                                                                    | 概要                     | インストール | 契機                                |
| ----------------------------------------------------------------------- | ------------------------ | ------------ | ----------------------------------- |
| [yonaskolb/Mint 🌱](https://github.com/yonaskolb/Mint#installing)       | CLI 管理ツール           | from `brew`  | 手動                                |
| [uber/mockolo](https://github.com/uber/mockolo)                         | モックジェネレーター     | from `Mint`  | Test Targets の Run Script で実行時 |
| [nicklockwood/SwiftFormat](https://github.com/nicklockwood/SwiftFormat) | コードフォーマッター     | from `Mint`  | Test Targets の Run Script で実行時 |
| [realm/SwiftLint](https://github.com/realm/SwiftLint)                   | 静的解析                 | from `Mint`  | Main Targets の Run Script で実行時 |
| [xcpetty/xcpretty](https://github.com/xcpretty/xcpretty)                | ビルドログフォーマッター | from `gem`   | run-test.sh 実行時                  |

## Mint 用モジュールのインストール

```sh
% ./run-mint-install.sh
```

## Run unit test for CLI

```sh
% ./run-test.sh mvp-example.xcodeproj mvp-example XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
```
