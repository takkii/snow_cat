# frozen_string_literal: true

require 'openssl'

# 暗号化クラス
class String_encrypt
  # 暗号化
  def use_case_encrypt
    puts ''
    # source, password
    source = 'パスワード暗号化'
    password = 'passwd'
    salt = OpenSSL::Random.random_bytes(8)
    algorithm = 'aes-256-cbc'

    encrypter = OpenSSL::Cipher.new(algorithm).encrypt
    len = encrypter.key_len + encrypter.iv_len
    iter = 1024
    k_i = OpenSSL::PKCS5.pbkdf2_hmac_sha1(password, salt, iter, len)
    key, iv = k_i.unpack("a#{encrypter.key_len} a#{encrypter.iv_len}")

    encrypter.key = key
    encrypter.iv = iv

    encrypted = encrypter.update(source) + encrypter.final
    # encrypted == source
    puts encrypted # 暗号化
  end

  # 復号化
  def use_case_decrypt
    # source, password 暗号化文字列
    source = 'パスワード復号化'
    password = 'passwd'
    salt = OpenSSL::Random.random_bytes(8)
    algorithm = 'aes-256-cbc'

    encrypter = OpenSSL::Cipher.new(algorithm).encrypt
    len = encrypter.key_len + encrypter.iv_len
    iter = 1024
    k_i = OpenSSL::PKCS5.pbkdf2_hmac_sha1(password, salt, iter, len)
    key, iv = k_i.unpack("a#{encrypter.key_len} a#{encrypter.iv_len}")

    encrypter.key = key
    encrypter.iv = iv

    encrypted = encrypter.update(source) + encrypter.final
    decrypter = OpenSSL::Cipher.new(algorithm).decrypt

    decrypter.key = key
    decrypter.iv = iv

    decrypted = decrypter.update(encrypted) + decrypter.final
    # decrypted == source
    puts decrypted # 復号化
end

  def use_case_hash
    # data, key 暗号化対象文字列
    data = 'パスワード暗号化、ハッシュ'
    key = 'passwd'
    digest = OpenSSL::HMAC.new(key, 'sha256')
    digest.update(data)
    puts digest.hexdigest #暗号化
  end

  def use_case_public
    # 鍵対を生成
    rsa = OpenSSL::PKey::RSA.generate(2048)
    # 暗号化するデータ
    data = '*secret data*'
    # 公開鍵で暗号化
    encrypt_data = rsa.public_encrypt(data)
    puts rsa.public_key.export # 暗号化
  end

  def use_case_private
    # 鍵対を生成
    rsa = OpenSSL::PKey::RSA.generate(2048)
    # 暗号化するデータ
    data = '*secret data*'
    # 公開鍵で暗号化
    encrypt_data = rsa.public_encrypt(data)
    # 秘密鍵で復号化
    decrypted_data = rsa.private_decrypt(encrypt_data)
    puts decrypted_data # 復号化
    end
end

# aes256
String_encrypt.new.use_case_encrypt
puts ''
# aes256
String_encrypt.new.use_case_decrypt
puts ''
# sha1
String_encrypt.new.use_case_hash
puts ''
# public
String_encrypt.new.use_case_public
puts ''
# private
String_encrypt.new.use_case_private