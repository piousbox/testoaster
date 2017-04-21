
def puts! arg, label=""
  puts "+++ +++ #{label}"
  puts arg.inspect
end

begin
  Paperclip.options[:log] = false
rescue Exception => e
  ;
end

def assert_layout layout
  assert_equal layout, @response.layout
end

def t which, addr = 'config/locales/en.yml'
  file = YAML::load(File.open(addr))
  file = file["en"]
  
  arr = which.split('.')
  arr.each do |a|
    file = file[a]
  end
  
  file
end

def assert_contains th
  b = @response.body
  if b =~ /#{Regexp.quote(th)}/
    assert true
  else
    assert false
  end
end

class Testoaster
  def self.hi
    puts "Hello world"
  end
end


module ::Utils
  def self.included base
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  module InstanceMethods

    def puts! args, label=""
      puts "+++ +++ #{label}"
      puts args.inspect
    end

    def format_date(date)
      date = date.to_date
      # date.to_s.split(" UTC")[0]
      date.in_time_zone "Pacific Time (US & Canada)"
    end
    
    def format_time time
      time.in_time_zone "Pacific Time (US & Canada)"
    end

  end

  module ClassMethods
    def clear
      if Rails.env.test?
        self.unscoped.each do |m|
          m.destroy
        end
      end
    end
  end

end


