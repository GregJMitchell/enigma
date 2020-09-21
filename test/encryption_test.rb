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

    assert_equal '', encryption.message
    assert_equal '0', encryption.key
    assert_equal '0', encryption.date
  end

  def test_it_can_encrypt_messages
    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }
    encryption = Encryption.new('hello world', '02715', '040895')

    assert_equal expected, encryption.encrypt
  end
end
