require './test/test_helper'
require './lib/enigma'
require 'date'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_messages
    enigma = Enigma.new
    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }

    assert_equal expected, enigma.encrypt('hello world', '02715', '040895')
  end

  def test_it_can_decrypt_messages
    enigma = Enigma.new
    expected = {
      decryption: 'hello world',
      key: '02715',
      date: '040895'
    }

    assert_equal expected, enigma.decrypt('keder ohulw', '02715', '040895')
  end

  def test_it_can_generate_date
    enigma = Enigma.new
    expected = Time.now.strftime("%d%m%y")

    assert_equal expected, enigma.generate_date
  end

  def test_it_can_generate_key
    enigma = Enigma.new
    enigma.stubs(:rand).returns('1234')
    enigma.stubs(:generate_date).returns('200920')

    assert_equal '01234', enigma.generate_key
  end

  def test_it_can_encrypt_with_no_key_or_date
    enigma = Enigma.new
    enigma.stubs(:rand).returns('1234')
    enigma.stubs(:generate_date).returns('200920')
    expected = {
      encryption: 'ouhsvpsvya ',
      key: '01234',
      date: '200920'
    }

    assert_equal expected, enigma.encrypt('hello world')
  end

  def test_it_can_decrypt_messages_with_no_date
    enigma = Enigma.new
    enigma.stubs(:rand).returns('1234')
    enigma.stubs(:generate_date).returns('200920')
    expected = {
      decryption: 'hello world',
      key: '01234',
      date: '200920'
    }

    assert_equal expected, enigma.decrypt('ouhsvpsvya ', '01234')
  end
end
