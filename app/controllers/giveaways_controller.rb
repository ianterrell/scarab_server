class GiveawaysController < ApplicationController
  layout "interior"
  
  caches_page :index
  def index; end
  
  def create
    @entry = TwitterGiveawayEntry.new :username => params[:username]
    begin
      client = Grackle::Client.new :auth => { :type=> :basic, :username => params[:username], :password => params[:password] }
      client.statuses.update! :status => "I just entered to win a 100 iTunes gift card from @scarabmag, a literary magazine for your iPhone/iPod! http://www.scarabmag.com/giveaways"
      begin
        client.friendships.create! :screen_name => "scarabmag"
      rescue Grackle::TwitterError
        raise $! unless $!.status == 403
      end
      @entry.save # ignore errors so that we can tweet multiple times by one entrant and still validate uniqueness of username in our DB
      redirect_to thanks_giveaways_path
    rescue
      render :action => "new"
    end
  end
end
