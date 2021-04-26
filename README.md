# 💐Best Gifter Wedding（べストギフターウェディング）💐
https://www.best-gifter.work

## サービス概要

**新郎新婦へ、最高のギフトを送りたい。**  

第1次結婚ウェーブ渦中（20代半ば）の方が  
結婚祝いのギフトを選ぶときに  
「なにを？」「いくらで？」を明確にし、「第三者目線」でギフトを選べるサービスです。

## 登場人物
第1次結婚ウェーブ渦中（20代半ば）の方

## ユーザーが抱える課題
結婚祝いのギフトを選ぶときに、相手との関係性によって
- どんなジャンルが適しているか分からない
- いくらくらいが常識の範囲内なのか分からない

いくつか自分で選んでみたものの
- 最後１つに絞れない

## 解決方法
- 「ギフトを贈りたい相手との関係性」を選択すると、おすすめのカテゴリーと相場を提示する。
- カテゴリーからそのまま商品一覧へ遷移し、すぐに購入できる。
（楽天市場商品検索APIを利用し、具体的な商品をWebアプリ上に表示させる。商品パネルをクリックすると、楽天市場へ遷移する。）
- いくつかの案が既にあるが一つに絞れない場合、アンケート投稿機能により、Twitter上で投票を行える。
(TwitterAPIを利用しBest Gifterの公式アカウント上で投稿を行うため、匿名でアンケートが行える。)

## プロダクト
結婚祝いに贈るギフトを考える手助けをしてくれるWebアプリケーション。

## マーケット
結婚する身内や友人、職場の上司・部下・同僚がいる人。
特に、相場やギフトに慣れていない、第一次結婚ラッシュ渦にいる人。

## 使用技術

### バックエンド
- Ruby 2.7.2
- Rails 6.0.3.6
- RSpec 3.10.1
- 楽天商品検索API（外部API）

### 機能における主要なGem
- counter_culture 2.7.0（投票数カウント）
- sourcery 0.16.0（ログイン）
- JWT 2.2.2（トークン発行）
- rakuten_web_service 1.13.0（楽天商品検索API）
- httpclient 2.8.3（ネットワーク通信）
- capistrano 3.16.0（自動デプロイ）
- unicorn 6.0.0（アプケーションサーバ）


### フロントエンド
- Vue 2.6.12
- vuex 3.6.0
- Vue Router 3.4.9
- axios 0.21.1
- vee-validate 3.4.5
- vue-poll 0.1.8（アンケートの投稿/投票）


### CSSフレームワーク
- Buefy 0.9.4
- Bulma 0.9.1

## ER図
<img width="754" alt="スクリーンショット 2021-04-25 20 31 28" src="https://user-images.githubusercontent.com/67740798/116011553-9746c180-a660-11eb-8d87-caafefbbf9e5.png">

## インフラストラクチャー
- CircleCI
- Nginx 1.12.2
- unicorn 6.0.0
- AWS
  - VPC
  - EC2
  - Amazon Linux 2
  - RDS
  - MySQL 5.7
  - ALB
  - Route53
  - ACM

<img width="934" alt="スクリーンショット 2021-04-25 10 44 24" src="https://user-images.githubusercontent.com/67740798/116011591-dbd25d00-a660-11eb-8676-7d3140af6c81.png">
