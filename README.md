# 株式会社ゆめみ iOS 未経験者エンジニア向けコードチェック課題

## 概要

本プロジェクトは株式会社ゆめみのコードチェック課題です。

## アプリ仕様

本アプリは 「名前」「誕生日」「血液型」をもとに相性の良い都道府県を占うアプリです。
|サンプル1|サンプル2|
|:-:|:-:|
|<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/a0ea23aa-5d71-485e-9599-10082f119cd5" width="50%">|<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/ece95a39-fbe5-4d4e-8087-77470ea6184a" width="100%">|

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

<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/2d2a6489-94bf-4787-9ff7-b250f8b1f453" width="40%">

---

## アピールポイント(機能紹介)

## UXの向上系
**[COVID-19 Japan Web API](https://github.com/ryo-ma/covid19-japan-web-api)を追加することで人口、コロナに関する情報を取得**

<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/68a74411-154b-4098-8658-ab724b4082a5" width="40%">

---

**Wikipediaのリンクを追加することで都道府県に関する情報の詳細を読めるようにした**

<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/57d37dfb-3d3f-421d-9c9e-21265569e825" width="30%">

---

**入力画面で記入漏れが発生しないようにした**
**(ボタンの色が変わる)**
|記入前|記入後|
|:-:|:-:|
|<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/d05b1780-fc57-4aed-8e32-4a2a19f93c53" width="80%">|<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/f10cfe60-7f3d-465d-a5b7-f2eb5309dd53" width="80%">|

---

**入力画面で入力フォームにフォーカスしている時、ボーダーの色を変更**
|フォーカスしてない時|フォーカスしてる時|
|:-:|:-:|
|<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/3a5dc83f-a9c2-417d-a551-c8a164d1f90e" width="80%">|<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/5fd592f8-4ffa-488d-9375-a2247ccb6ade" width="80%">|

---

**結果画面に遷移する前にロード画面を表示**

<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/2d2a6489-94bf-4787-9ff7-b250f8b1f453" width="40%">

---

**履歴画面を作成**

<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/dc283dc0-204a-4fe8-8f41-9a8fe49646c2" width="40%">

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
|<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/b47b484f-ad7f-428c-b013-211285592f88" width="80%">|<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/41dab2c5-baa9-4d79-95de-1b745400c899" width="80%">|

---

**日本列島の画像**　　　

<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/d629aa00-805b-4546-9799-ba890bd8bf9b" width="40%">

---

**カスタムボタン**　　　

<img src="https://github.com/AsanoGenki/ios-junior-engineer-codecheck/assets/82352989/640db6eb-a461-456a-8ec7-9af2b6697f6a" width="40%">







