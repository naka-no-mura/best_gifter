require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe '検索機能' do

    context '全ての入力が正常なとき' do
      it '検索が成功する' do
        get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+%E3%82%BF%E3%82%AA%E3%83%AB&genreId=&minPrice=3000&maxPrice=5000&sort=standard&giftFlag=1&imageFlag=1&page=1'
        json = JSON.parse(response.body)
        expect(response.status).to eq(200)
      end
    end

    context '検索フォームを空欄で検索した場合' do
      it 'デフォルト検索が行われる' do
        get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=standard&giftFlag=1&imageFlag=1&page=1'
        expect(response.status).to eq(200)
      end
    end

    describe '検索結果の並び替え' do
      context 'レビュー件数順' do
        it '検索が成功する' do
          get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=-reviewCount&giftFlag=1&imageFlag=1&page=1'
          expect(response.status).to eq(200)
        end
      end

      context 'レビュー評価順' do
        it '検索が成功する' do
          get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=-reviewAverage&giftFlag=1&imageFlag=1&page=1'
          expect(response.status).to eq(200)
        end
      end

      context '価格が高い順' do
        it '検索が成功する' do
          get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=-itemPrice&giftFlag=1&imageFlag=1&page=1'
          expect(response.status).to eq(200)
        end
      end

      context '価格が安い順' do
        it '検索が成功する' do
          get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=+itemPrice&giftFlag=1&imageFlag=1&page=1'
          expect(response.status).to eq(200)
        end
      end

      context '新着順' do
        it '検索が成功する' do
          get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=+updateTimestamp&giftFlag=1&imageFlag=1&page=1'
          expect(response.status).to eq(200)
        end
      end
    end

    describe 'ページネーション' do
      context '最初のページに戻る' do
        it 'ページ遷移が成功する' do
          get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=standard&giftFlag=1&imageFlag=1&page=1'
          expect(response.status).to eq(200)
        end
      end

      context '1ページ前に戻る' do
        it 'ページ遷移が成功する' do
          get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=standard&giftFlag=1&imageFlag=1&page=2'
          expect(response.status).to eq(200)
          get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=standard&giftFlag=1&imageFlag=1&page=1'
          expect(response.status).to eq(200)
        end
      end

      context 'あるページに遷移する' do
        it 'ページ遷移が成功する' do
          get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=standard&giftFlag=1&imageFlag=1&page=2'
          expect(response.status).to eq(200)
        end
      end

      context '1ページ次に進む' do
        it 'ページ遷移が成功する' do
          get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=standard&giftFlag=1&imageFlag=1&page=2'
          expect(response.status).to eq(200)
        end
      end

      context '最後のページに進む' do
        it 'ページ遷移が成功する' do
          get '/api/v1/rakuten_apis/search?keyword=%E7%B5%90%E5%A9%9A+&genreId=&minPrice=1000&maxPrice=150000&sort=standard&giftFlag=1&imageFlag=1&page=100'
          expect(response.status).to eq(200)
        end
      end
    end
  end
end
