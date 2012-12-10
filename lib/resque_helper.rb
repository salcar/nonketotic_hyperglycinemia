# encoding: UTF-8

class ResqueHelper
  class << self
    def schedule_or_execute!(klass, *args)
      if Rails.env.downcase == "production"
        Resque.enqueue(klass, *args)
      else
        klass.send(:perform, *args)
      end
    end
  end
end