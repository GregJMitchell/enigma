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

  def test_it_has_readable_attributes
    message = ''
    key = '0'
    date = '0'
    encryption = Encryption.new(message, key, date)

    assert_equal '', Encryption.message
    assert_equal '0', Encryption.key
    assert_equal '0', Encryption.date
  end
end