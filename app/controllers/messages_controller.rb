class MessagesController < ApplicationController
  autocomplete :user, :name, :extra_data => [:id]

  def trash
    authorize! :trash, @message, :message => 'Need to be logged in to see this page!'
    @messages = current_user.messages

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  def sent 
    @messages = Message.all
    authorize! :sent, @message, :message => 'Need to be logged in to see this page!'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  def remove_recipient
    @message = Message.find(params[:id])
    @message.show_recipient = false
    @message.save

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  def remove_sender
    @message = Message.find(params[:id])
    @message.show_sender = false

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  # GET /messages
  # GET /messages.json
  def index
    authorize! :trash, @message, :message => 'Need to be logged in to see this page!'
    @messages = current_user.messages

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])
    if @message.user_id == current_user.id
      @message.read = true
      @message.save
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])

    if @message.recipient_name
      if User.find_by_name(@message.recipient_name)
        @message.user_id = User.find_by_name(@message.recipient_name).id
      end
    end

    respond_to do |format|
      if @message.save
        format.html { redirect_to :back, notice: 'Message was successfully sent!' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { redirect_to :back, :flash => { :error => 'Message was not successful. Please try again.' }  }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
