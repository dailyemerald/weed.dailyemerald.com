class AppController < ApplicationController
  def user_submit  	
  	@vote = Vote.new
  	@form_endpoint = ENV['FORM_ENDPOINT']
  	raise "Must specific FORM_ENDPOINT as ENV variable." if @form_endpoint.nil?
  end

  def submit
    user = cookies.permanent.signed[:emg_id1]
    vote = Vote.where(user: user).first || Vote.new(user: user)

    puts(params.inspect)

    vote.support = params[:support].try(:first)
    vote.story = params[:story]
    vote.story_approved = false
    vote.checkboxes = params[:checkboxes].join(",") rescue nil
    
    if vote.save  	
  		redirect_to '/results?review=t'
  	else
  		render action: 'user_submit'
  	end
  end

  def results
  	@stories = Vote.where(story_approved: true).order('created_at DESC')

  	@categories = Vote.new.checkbox_values
    @user_distrubution = Vote.pluck(:support).inject({}){ |obj, item|
      obj[item] ||= 0
      obj[item] += 1
      obj
    }.map{|key, val|
      {segment: key, count: val}
    }

  	@votes = Vote.all.flat_map{|vote|
  		vote.checkboxes.split(",").map{|checkbox|
  			{ support: vote.support || '?', vote: checkbox }
  		}
  	}.inject({}){|obj, item|
  		obj[item[:support]] ||= []
  		obj[item[:support]] << item[:vote]
  		obj
  	}.inject([]){|obj, item|
      segment = item.first
      values = item.last.inject({}){|obj, item|
        obj[item] ||= 0
        obj[item] += 1
        obj
      }.each{|category, count|
        obj << {segment: segment, category: category, count: count}
      }      
      obj
    }
  

  end

  def login
  end

  def process_login
    if params[:password] == ENV['PASSWORD']
      cookies.permanent.signed[:emg_id1_isadmin] = true
      redirect_to '/moderate'
    else
      render text: "Nope."
    end 
  end

  def moderate
    if cookies.permanent.signed[:emg_id1_isadmin] != true
      raise "not an admin"
    end

    @approved     = Vote.where(story_approved: true)
    @not_approved = Vote.where(story_approved: false).order('created_at DESC')

  end

  def approve_story
    if cookies.permanent.signed[:emg_id1_isadmin] != true
      raise "not an admin"
    end

    vote = Vote.find(params[:id])
    vote.story_approved = true
    vote.save
    redirect_to '/moderate'

  end

  def unapprove_story
    if cookies.permanent.signed[:emg_id1_isadmin] != true
      raise "not an admin"
    end

    vote = Vote.find(params[:id])
    vote.story_approved = false
    vote.save
    redirect_to '/moderate'

  end


end


