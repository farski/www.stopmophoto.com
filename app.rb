require 'rubygems'
require 'sinatra'
require 'haml'

module StopMotionPhoto
  class Www < Sinatra::Base
    set :app_file, __FILE__
    set :root, File.dirname(__FILE__)
    set :views, 'views'
    set :public_folder, 'public'
    set :haml, { :format => :html5 }

    get '/' do
      haml :'index.html', :layout => :'layouts/application.html'
    end

    get '/:page' do |page|
      haml :"#{page}.html", :layout => :'layouts/application.html'
    end

    not_found do
      haml :'404.html', :layout => :'layouts/application.html'
    end
  end
end
