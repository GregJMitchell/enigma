require './test/test_helper'
require './lib/encryption'

class EncryptionTest < Minitest::Test
  def test_it_exists
    message = ''
    key = '0'
    date = '0'
    encryption = Encryption.new(message, key, date)

    assert_instance_of Encryption, encryption
  end
end