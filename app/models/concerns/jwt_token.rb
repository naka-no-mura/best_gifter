module JwtToken
  extend ActiveSupport::Concern

  # JWTをデコードする（発行したトークンの中身を確認）
  # .credentials を消したら動作した（本来：application.credentials.secret_key_base）
  class_methods do
    def decode(token)
      JWT.decode token, Rails.application.secret_key_base
    end
  end

  def create_tokens
    payload = { user_id: id }
    issue_token(payload.merge(exp: Time.current.to_i + 1.month))
  end

  private

  # JWTを発行する
  # .credentials を消したら動作した（本来：application.credentials.secret_key_base）
  def issue_token(payload)
    JWT.encode payload, Rails.application.secret_key_base
  end
end
