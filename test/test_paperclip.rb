
require 'helper'
require 'testoaster'

class TestPaperclip < Test::Unit::TestCase
  
  should 'test paperclip' do
    
    result = Paperclip.options[:log]
    assert_equal false, result
    
  end
  
end


