require 'helper'
require 'testoaster'
require 'stringio' 
module Kernel
  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out.string
  ensure
    $stdout = STDOUT
  end
end

class Response  
  attr_accessor :layout
  attr_accessor :body
end

class TestTestoaster < Test::Unit::TestCase
  
  should 'test puts!' do
    result = capture_stdout do
      puts! 'blah blah'
    end
    expected = "+++ +++ \n\"blah blah\"\n"
    assert_equal expected, result    
  end
    
  should 'assert test_layout' do
    @response = Response.new
    @response.layout = 'layyy'
    assert_layout 'layyy'
  end
  
  should 'test t()' do
    result = t('users.test', 'test/en.yml')
    assert_equal 'Test', result
  end
    
  should 'test assert contains' do
    @r = Response.new
    @r.body = 'ttt'    
#    assert_contains 'ttt'
  end
    
end
