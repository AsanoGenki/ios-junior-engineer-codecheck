# 株式会社ゆめみ iOS 未経験者エンジニア向けコードチェック課題

## 概要

本プロジェクトは株式会社ゆめみのコードチェック課題です。

## アプリ仕様

本アプリは 「名前」「誕生日」「血液型」をもとに相性の良い都道府県を占うアプリです。
|サンプル1|サンプル2|
|:-:|:-:|
|<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/64a34f5c-98b4-44f6-916a-a48db56240c5" width="50%">|<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/600ae3f0-4231-4903-b72c-5686660f39ea" width="100%">|

## 環境

- IDE：Xcode 14.2
- Swift：Swift 5.7.2
- 開発ターゲット：iOS 16.2

## 使用ライブラリ
- Realm
- Lottie

---

### **[Realm](https://github.com/realm/realm-swift)**

**インストール方法(SwiftPM)**
```ruby
https://github.com/realm/realm-swift.git
```

**使用箇所**

占いする際に「ユーザーネーム」「誕生日」「血液型」「相性の良い都道府県」「占った日付」をローカルに保存するために使用

---

### **[Lottie](https://github.com/airbnb/lottie-ios)**

**インストール方法(SwiftPM)**
```ruby
https://github.com/airbnb/lottie-spm.git
```

**使用箇所**

ロード画面にアニメーションを表示するために使用

<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/5d40ebef-8c6e-4453-b6e0-9c456666b59e" width="40%">

---

## アピールポイント(機能紹介)

## UXの向上系
**[COVID-19 Japan Web API](https://github.com/ryo-ma/covid19-japan-web-api)を追加することで人口、コロナに関する情報を取得**

<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/d4e9bdb3-7704-43f3-8272-943a14477641" width="40%">

---

**Wikipediaのリンクを追加することで都道府県に関する情報の詳細を読めるようにした**

<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/8479a4a4-2c38-4932-88ac-1cec4bd45ec2" width="30%">

---

**入力画面で記入漏れが発生しないようにした**
**(ボタンの色が変わる)**
|記入前|記入後|
|:-:|:-:|
|<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/5ec127e5-dde2-4787-ba8b-a9c51da8ac56" width="80%">|<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/dc0dfe0a-5a50-4cd1-bc66-ef45de3f3959" width="80%">|

---

**入力画面で入力フォームにフォーカスしている時、ボーダーの色を変更**
|フォーカスしてない時|フォーカスしてる時|
|:-:|:-:|
|<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/fccc3799-5b0e-45ab-9558-235235677f90" width="80%">|<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/84831c17-1ecf-40d1-b815-a33f389762ac" width="80%">|

---

**結果画面に遷移する前にロード画面を表示**

<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/5d40ebef-8c6e-4453-b6e0-9c456666b59e" width="40%">

---

**履歴画面を作成**

<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/0bfe283c-d6e5-4018-8e0e-cc4bb136a260" width="40%">

---
**サウンドの追加**　

・ BGM : [Sweet Peach](https://dova-s.jp/bgm/play19505.html)  
・ 効果音 : [効果音ラボ](https://soundeffect-lab.info/sound/button/)  
・ 音声 : [AVSpeechUtterance](https://developer.apple.com/documentation/avfaudio/avspeechutterance)  

---
**Unit Test、UI Testの追加**　  

(プロジェクト参照)

## UIのブラッシュアップ系

**カスタムフォントの使用**
|[コーポレート・ロゴ（ラウンド）ver3](https://logotype.jp/font-corpmaru.html)|[Rounded Mplus 1c](https://fonts.google.com/specimen/M+PLUS+Rounded+1c?subset=japanese)|
|:-:|:-:|
|<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/63db7b77-6892-43f5-8bee-5ae78ea40f15" width="80%">|<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/25ec403f-53ce-4e2f-a365-6da6350d0228" width="80%">|

---

**日本列島の画像**　　　

<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/ae87d458-b123-4bce-978b-e498207d993f" width="40%">

---

**カスタムボタン**　　　

<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/6e291822-1efe-45ea-817d-4979e3d89544" width="40%">







